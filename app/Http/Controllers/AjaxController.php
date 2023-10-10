<?php

namespace App\Http\Controllers;

use App\Models\CommentDetail;
use App\Models\Comments;
use App\Models\User;
use App\Models\UserCommentNew;
use App\Models\UserComments;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Log;
use App\Events\ChatEvent;
use App\Events\RemoveMessage;
use Illuminate\Support\Facades\Storage;

class AjaxController extends Controller {
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function get_new_comments() {
        if ($user_id = Auth::user()->id) {
            $new_comments = UserComments::orderBy('id', 'ASC')
                ->where('reply_id', $user_id)
                ->where('new_comment', 1)
                ->get();
            $count_new = $new_comments->count();
            $count = $count_new > 0 ? $count_new : 0;
            echo json_encode(array('count' => $count));
            exit;
        }
    }

    /**
     * Generate Image upload View
     *
     * @return void
     */
    public function dropzone() {
        return view('dropzone-view');
    }

    /**
     * Image Upload Code
     *
     * @return void
     */
    public function dropzone_store(Request $request) {
        $data = array();
        $userId = Auth::user()->id;
        $roleId = Auth::user()->role_id;
        $validator = Validator::make($request->all(), [
            'file' => 'required|mimes:pdf,doc,docx,xls,xlsx,m4a,3gp,flac,mp3,wav,aac,mp4,mov,wmv,avi,mkv,webm,png,jpg,jpeg|max:512000',  // 512000 bytes = 500MB
            'comment' => 'required',
            'lesson' => 'required'
        ]);

		try {
        if ($validator->fails()) {
            $err = $validator->errors()->first('file') ?? "";
            \Log::info("err: $err, userid: $userId");
            
            $data['success'] = 0;
            $data['error'] = "File không cho phép. " . $validator->errors()->first('file'); // Error 
            
            return response($data['error'], 422)->header('Content-Type', 'text/plain');

        } else {
            if ($request->file('file')) {
                $file = $request->file('file');
                $original_filename = $file->getClientOriginalName();
                // $original_filetype = $file->getClientOriginalExtension();
                // $orginal_minetype = $file->getClientMimeType();
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

                $filename = generate_random_string(20) . '-' . $original_filename;
                $lesson_id = $request->get('lesson');
                $comment_id = $request->get('comment');
                $replyId = $request->get('reply_id');
                
                // File upload location
                // $location = 'uploads/comments/' . $comment_id;

                $destinationPath = 'chat/' . $comment_id;

                $disk = Storage::disk('s3');
                $disk->put($destinationPath . '/' . $filename, file_get_contents($file), 'public');

                // Upload file
                // $file->move($location, $filename);
                // $path = url('/') . '/' . $location . '/' . $filename;

                $path = $disk->url($destinationPath . '/'  . $filename);

                

                // insert new comment - type upload file
                // add comment detail
                $cd_id = DB::table('comment_detail')->insertGetId([
                    'user_id' => $userId,
                    'reply_id' => $replyId,
                    'comment_id' => $comment_id,
                    'content' => $original_filename,
                    'path' => $path,
                    'type' => $file_type,
                    'created_time' => Date('Y-m-d H:i:s')
                ]);

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
                if($cd_id) {
                    $data['detail_id'] = $cd_id;
                }
                $data['path'] = $path;
                $data['time'] = show_comment_detail_created_time();
                $data['success'] = 1;
                $data['message'] = 'Uploaded Successfully!';

                if ($roleId < 3) {
                    $senderName = "Telesa English";
                } else{
                    $senderName = Auth::user()->first_name . " " . Auth::user()->last_name;
                }

                $content = [
                    'filepath' => $path,
                    'filename' => $original_filename,
                    'message' => ''
                ];

                event(new ChatEvent($userId, $replyId, $content, $data['time'], $senderName, $cd_id, $file_type));

            } else {
                // Response
                $data['success'] = 0;
                $data['message'] = 'File not uploaded.';
            }
        }
        } catch (Exception $e) {
                $data['success'] = 0;
                $data['message'] = 'File not uploaded. ' . $e->getMessage() . ' - ' . $e->getCode();
                return response($data['message'], 422)->header('Content-Type', 'text/plain');        
        }

        return response()->json($data);
    }

    public function remove_file_uploaded(Request $request) {
        $id = $request->id;
        if ($id) {
            $path = CommentDetail::where('id', $id)->pluck('path')->first();
            if (!is_null_or_empty($path)) {
                $base_url = url('/') . '/';
                $path_file = str_replace($base_url, "", $path);
                // delete file uploaded on server
                if (file_exists(public_path($path_file))) {
                    unlink(public_path($path_file));
                }
                // delete comment detail in DB
                CommentDetail::where('id', $id)->delete();
            }
        }
    }

    public function delete_comment_detail(Request $request) {
        $id = $request->id;
        $user_id = Auth::user()->id;
        if ($id) {
            event(new RemoveMessage($user_id, $id));
            // delete comment detail in DB
            CommentDetail::where('id', $id)->where('user_id', $user_id)->delete();
        }
    }
}
