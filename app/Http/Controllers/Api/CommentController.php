<?php

namespace App\Http\Controllers\Api;

use App\Events\ChatEvent;
use App\Http\Controllers\Controller;
use App\Http\Requests\Api\SendCommentRequest;
use App\Models\CommentDetail;
use App\Models\UserComments;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\ApiListCommentResource;
use App\Models\Comments;
use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Log;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Product\VendorController;

class CommentController extends Controller
{
    protected $user;
    protected $vendor;

    public function __construct()
    {
        $this->user = Auth::guard('api')->user();
    }

    public function anotherVendorController(VendorController $vendor)
    {
        $this->vendor = $vendor;
    }

    public function list()
    {
        $userId = $this->user->id;
        $firstCommentOfUser = CommentDetail::orderBy('comment_detail.id', 'ASC')
            ->where('user_id', $userId)
            ->first();
        $listComments = array();
        if (!empty($firstCommentOfUser->created_time)) {
            $createTimeFirstComment = $firstCommentOfUser->created_time;

            $listComments = CommentDetail::orderBy('comment_detail.created_time', 'DESC')
                ->leftJoin('comments', 'comments.id', '=', 'comment_detail.comment_id')
                ->leftJoin('users', 'users.id', '=', 'comment_detail.user_id')
                ->select('comment_detail.*', 'users.role_id', 'users.first_name', 'users.last_name', 'users.email', 'users.username')
                ->where('users.id', $userId)
                ->orWhere(function ($q) use ($createTimeFirstComment, $userId) {
                    $q->where('comment_detail.created_time', '>=', $createTimeFirstComment)
                        ->where('comment_detail.reply_id', $userId);
                })
                // ->latest()
                ->paginate(10);
            // ->get();
            UserComments::where('reply_id', $userId)->delete();
        }
        $datalistComments = ApiListCommentResource::collection($listComments);
        return response()->json(api_success('Trang chủ danh sách khóa học', $datalistComments));
    }

    public function add(SendCommentRequest $request)
    {
        $user_id = $this->user->id;
        $role_id = $this->user->role_id;
        $lesson_id = $request->lesson_id;
        $content['message'] = $data['content'] = $request->content;
        $comment_id = $request->comment_id;
        $replyId = $request->reply_id ?? 0;
        $replyCommentId = $request->reply_comment_id;
        $response = array();

        try {
            $time = show_comment_detail_created_time();

            $senderName = $this->user->first_name . " " . $this->user->last_name;


            if (is_null_or_empty($comment_id) || !$comment_id) {
                if (in_array($role_id, array(1, 2))) {
                } else if ($role_id != 3) {
                    // add comment
                    $comment_id = Comments::where('user_id', $user_id)->pluck('id')->first();

                    if (!$comment_id) {
                        $comment_id = DB::table('comments')->insertGetId([
                            'user_id' => $user_id,
                            'lesson_id' => $lesson_id
                        ]);
                    }
                }
            }

            if ($comment_id != "") {
                // add comment detail
                $cd_id = DB::table('comment_detail')->insertGetId([
                    'user_id' => $user_id,
                    'comment_id' => $comment_id,
                    'content' => $data['content'],
                    'reply_id' => $replyId,
                    'reply_comment_id' => $replyCommentId,
                    'created_time' => Date('Y-m-d H:i:s')
                ]);

                if ($replyCommentId) {
                    $replyContent = CommentDetail::find($replyCommentId)->content ?? "";
                    $replyMessageId = CommentDetail::find($replyCommentId)->id ?? "";
                    $content['reply_message'] = $replyContent;
                    $content['reply_message_id'] = $replyMessageId;
                }

                event(new ChatEvent($user_id, $replyId, $content, $time, $senderName, $cd_id));

                // update comment: updated_time
                $updated_time = \Carbon\Carbon::createFromFormat('m d Y H:i A', date('m d Y H:iA'));
                DB::table('comments')->where('id', $comment_id)->update(['updated_time' => $updated_time]);
                $response = array('success' => 'add new comment success.', 'id' => $cd_id, 'time' => $time);

                // add notification
                $_data = array(
                    'user_id' => $user_id,
                    'comment_id' => $cd_id,
                    'reply_id' => $replyId
                );
                analyst_student_message($role_id, $_data, $replyId);
            }
        } catch (Exception $e) {
            $response = array('failed' => $e->getMessage());
        }

        return response()->json(api_success('Thành công', $response));
    }

    public function dropzone_store(Request $request)
    {
        $data = array();
        $userId = $this->user->id;
        $roleId = $this->user->role_id;
        $typeSticker = $request->type_sticker;

        $lesson_id = $request->get('lesson');
        $comment_id = $request->get('comment');
        $replyId = $request->get('reply_id');
        $path = $request->path;
        $timeSend = show_comment_detail_created_time();

        if (!$typeSticker) {
            $validator = Validator::make($request->all(), [
                'file' => 'required|mimes:pdf,doc,docx,xls,xlsx,m4a,3gp,flac,mp3,wav,aac,mp4,mov,wmv,avi,mkv,webm,png,jpg,jpeg|max:512000',  // 512000 bytes = 500MB
                'comment' => 'required',
                'lesson' => 'required'
            ]);
        }

        $senderName = $this->user->first_name . " " . $this->user->last_name;

        try {
            if ($typeSticker) {
                $file_type = 6; // sticker
                $cd_id = DB::table('comment_detail')->insertGetId([
                    'user_id' => $userId,
                    'reply_id' => $replyId,
                    'comment_id' => $comment_id,
                    'content' =>  '',
                    'path' => $path,
                    'type' => $file_type,
                    'created_time' => Date('Y-m-d H:i:s')
                ]);

                $content = [
                    'filepath' => $path,
                    'filename' => '',
                    'message' => ''
                ];

                // add notification
                $_data = array(
                    'user_id' => $userId,
                    'comment_id' => $cd_id,
                    'reply_id' => $replyId
                );
                analyst_student_message($roleId, $_data, $replyId);

                // Response
                if ($cd_id) {
                    $data['detail_id'] = $cd_id;
                }
                $data['path'] = $path;
                $data['time'] = $timeSend;
                $data['success'] = 1;
                $data['message'] = 'Send sticker Successfully!';

                event(new ChatEvent($userId, $replyId, $content, $timeSend, $senderName, $cd_id, $file_type));
            } else {
                if ($validator->fails()) {
                    return response()->json(request_error($validator->errors()->messages()));
                } else {
                    if ($request->file('file')) {
                        set_time_limit(500);

                        $file = $request->file('file');
                        $original_filename = $file->getClientOriginalName();

                        $file_type = '';
                        $ext = strtolower(pathinfo($file->getClientOriginalName(), PATHINFO_EXTENSION));
                        if (in_array($ext, array('pdf', 'doc', 'docx', 'xls', 'xlsx'))) {
                            $file_type = 2;
                        } else if (in_array($ext, array('m4a', 'flac', 'mp3', 'wav', 'aac'))) {
                            $file_type = 3;
                        } else if (in_array($ext, array('mp4', 'mov', 'wmv', 'avi', 'mkv', 'webm'))) {
                            $file_type = 4;
                        } else if (in_array($ext, array('png', 'jpg', 'jpeg'))) {
                            $file_type = 5;
                        }

                        // File upload location
                        // $location = 'uploads/comments/' . $comment_id;

                        $strRand = generate_random_string(20);

                        $filename = $strRand . '-' . $original_filename;
                        $env = config("app.env");
                        $destinationPath = 'chat/' . $env . "/" . $comment_id;

                        $disk = Storage::disk('s3');
                        $dir = $destinationPath . '/' . $filename;
                        $disk->put($dir, file_get_contents($file), 'public');
                        $path = $disk->url($dir);
                        $fileConvert = $filename;

                        $cd_id = DB::table('comment_detail')->insertGetId([
                            'user_id' => $userId,
                            'reply_id' => $replyId,
                            'comment_id' => $comment_id,
                            'content' =>  $fileConvert,
                            'path' => $path,
                            'type' => $file_type,
                            'created_time' => Date('Y-m-d H:i:s')
                        ]);

                        // insert new comment - type upload file
                        // add comment detail


                        // update comment: updated_time
                        $updated_time = \Carbon\Carbon::createFromFormat('m d Y H:i A', date('m d Y H:iA'));
                        DB::table('comments')->where('id', $comment_id)->update(['updated_time' => $updated_time]);

                        // add notification
                        $_data = array(
                            'user_id' => $userId,
                            'comment_id' => $cd_id,
                            'reply_id' => $replyId
                        );
                        analyst_student_message($roleId, $_data, $replyId);

                        // Response
                        if ($cd_id) {
                            $data['detail_id'] = $cd_id;
                        }

                        $cloudfrontPath = config('api.cloudfront_url') . '/chat/dev/' . $comment_id . '/' . $filename;

                        $data['path'] = $cloudfrontPath;
                        $data['time'] = $timeSend;
                        $data['success'] = 1;
                        $message = 'Uploaded Successfully!';



                        $content = [
                            'filepath' => $cloudfrontPath,
                            'filename' => $original_filename,
                            'message' => ''
                        ];
                        event(new ChatEvent($userId, $replyId, $content, $data['time'], $senderName, $cd_id, $file_type));
                    } else {
                        // Response
                        $data['success'] = 0;
                        $message = 'File not uploaded.';
                    }
                }
            }
        } catch (\Exception $e) {
            $message = 'File not uploaded. ' . $e->getMessage() . ' - ' . $e->getCode();
            return response()->json(api_error($message));
        }

        return response()->json(api_success($message, $data));
    }

    public function list_image()
    {
        $data = [];
        for ($i = 1; $i <= 11; $i++) {
            $data['sticker']['cat'][] = asset("sticker/hinh_tinh/cat/sticker_$i.png");
            $data['sticker']['troc'][] = asset("sticker/hinh_tinh/troc_trang/sticker_$i.webp");
        }
        for ($i = 1; $i <= 10; $i++) {
            $data['sticker']['rabbit'][] = asset("sticker/hinh_tinh/rabbit/rabbit$i.webp");
            $data['gif']['rabbit'][] = asset('sticker/hinh_gif/ANGOLA_RABBIT/sticker_' . $i . '.gif');
            $data['gif']['dog'][] = asset('/sticker/hinh_gif/DOG/sticker_' . $i . '.gif');
        }


        for ($i = 1; $i <= 9; $i++) {
            $data['gif']['ami'][] = asset('sticker/hinh_gif/AMI/sticker_' . $i . '.gif');
            $data['gif']['mobile_girl'][] = asset('/sticker/hinh_gif/MOBILE_GIRL/sticker_' . $i . '.gif');
        }
        $this->anotherVendorController(new VendorController);
        $data['emoji'] = $this->vendor->getEmojiList();

        return response()->json(api_success("Danh sách hình ảnh sử dụng để chat", $data));
    }

    public function dashboard_user_comment()
    {
        $user_id = $this->user->id;

        $comments = Comments::leftJoin('vendors', 'vendors.id', '=', 'comments.lesson_id')
            ->leftJoin('comment_detail', 'comment_detail.comment_id', '=', 'comments.id')
            ->leftJoin('users', 'users.id', '=', 'comment_detail.user_id')
            ->select('comments.*', 'vendors.name as lesson_name')
            ->where('comments.user_id', $user_id)
            ->groupBy('comment_detail.user_id')
            ->orderBy('comment_detail.id', 'DESC')
            ->get();

        $userComments = [];
        $userIdArr = [];

        foreach ($comments as $key => $value) {

            if (in_array($value->user_id, $userIdArr)) continue;
            $userIdArr[] = $value->user_id;

            $latestComment = CommentDetail::orderBy('comment_detail.created_time', 'DESC')
                ->leftJoin('users', 'users.id', '=', 'comment_detail.user_id')
                ->select('comment_detail.*', 'users.first_name', 'users.last_name', 'users.username', 'users.email', 'users.role_id', 'users.photo')
                ->where('comment_detail.comment_id', '=', $value->id)
                ->first();

            if (!empty($latestComment)) {
                $userComment = [
                    'lesson_id' => $value->id,
                    'lesson_name' => $value->lesson_name,
                    'name' => $latestComment->first_name . ' ' . $latestComment->last_name,
                    'photo' => !is_null($latestComment->photo) ? asset($latestComment->photo) : asset('avatar.png'),
                    'time' => generate_comment_created_datetime($latestComment->created_time),
                    'comment' => get_sub_comment_detail($latestComment->content)
                ];
            }

            $userComments[] = $userComment;
        }

        return response()->json(api_success('Thành công', $userComments));
    }
}
