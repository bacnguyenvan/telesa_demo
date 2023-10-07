<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\CommentDetail;
use App\Models\Comments;
use App\Models\Label;
use App\Models\User;
use App\Models\UserComments;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Exception;
use App\Events\ChatEvent;
use App\Models\UserLabel;

class CommentController extends Controller {

    public function dashboard_user_comment(Request $request) {
        
        $keySearch = $request->k_search;
        $labelId = $request->label_id;

        $user_id = Auth::user()->id;
        $user_role =  Auth::user()->role_id;
       
        $comments = Comments::orderBy('comments.updated_time', 'DESC')
            ->leftJoin('vendors', 'vendors.id', '=', 'comments.lesson_id')
            ->leftJoin('comment_detail', 'comment_detail.comment_id', '=', 'comments.id')
            ->leftJoin('users', 'users.id', '=', 'comment_detail.user_id')
            ->leftJoin('user_label', 'comments.id', '=', 'user_label.comment_id')
            ->leftJoin('labels', 'user_label.label_id', '=', 'labels.id')
            ->select('comments.*', 'vendors.name as lesson_name');

        if(!is_null($labelId)) {
            $comments = $comments -> where(['labels.id' => $labelId]);
        }
        if(!is_null($keySearch)) {
            $comments = $comments->where('comment_detail.content', 'like', '%'.$keySearch.'%')
                                ->OrWhere(function($query) use($keySearch) {
                                    $query -> where(function($q) use($keySearch){
                                            $q -> where('users.first_name','like', '%'.$keySearch.'%')
                                            -> orWhere('users.last_name','like', '%'.$keySearch.'%')
                                            -> orWhere(DB::raw("CONCAT(users.first_name, ' ', users.last_name)"), 'LIKE', '%' . $keySearch . '%');
                                    })
                                    -> where('users.role_id', '>' , 2);
                                })
                                ->orWhere('comment_detail.path','like', '%'.$keySearch.'%')
                                ->groupBy('comments.id');
        }

        if($user_role > 2) {
            $comments = $comments->where('comments.user_id', $user_id);
        }
        
        $comments = $comments->get();
                    
        $userComments = [];
        $userIdArr = [];
        
        foreach ($comments as $key => $value) {
            if(in_array($value->user_id, $userIdArr)) continue;
            $userIdArr[] = $value->user_id;
            
            $latestComment = CommentDetail::orderBy('comment_detail.created_time', 'DESC')
                ->leftJoin('users', 'users.id', '=', 'comment_detail.user_id')
                ->select('comment_detail.*', 'users.first_name', 'users.last_name', 'users.username', 'users.email', 'users.role_id', 'users.photo')
                ->where('comment_detail.comment_id', '=', $value->id)
                ->first();

            if(!empty($latestComment)) {
                $latestComment->first_name_answer = $latestComment->first_name;
                $latestComment->last_name_answer = $latestComment->last_name;

                if($latestComment->role_id < 3) {
                    $student = User::where('id', $latestComment->reply_id)->first();
                    if(!empty($student)) {
                        $latestComment->first_name = $student->first_name;
                        $latestComment->last_name = $student->last_name;
                        $latestComment->email = $student->email;
                        $latestComment->photo = $student->photo;
                    }
                } else {
                    // $latestComment->reply_id = $value->user_id;
                }
            }
            $userComment = array(
                'comments' => $value,
                'last_comment' => $latestComment
            );

            $has_new_comment = UserComments::where('user_id', $user_id)->where('comment_id', $value->id)->pluck('id')->first();
            $userComment['new_comment'] = $has_new_comment ? 1 : 0;

            if($user_role < 3) {
                $userComment['label'] = UserLabel::Join('labels', 'user_label.label_id', '=', 'labels.id')
                                                ->select('labels.name', 'labels.id', 'labels.color')
                                                ->where('user_label.comment_id', $value->id)
                                                ->orderBy('user_label.id', 'DESC')
                                                ->first();
            }


            $userComments[] = $userComment;
        }

        foreach($userComments as &$item) {
            if($user_role < 3) {
                $item['total_new_message'] = UserComments::where('user_id', $item['comments']->user_id)->count() ?? 0;
            } else {
                $item['total_new_message'] = UserComments::where('reply_id', $item['comments']->user_id)->count() ?? 0;
            }
            
        }
        

        if($request->isMethod('get')) {
            $labels = Label::all();
            return view('admin.comment.index', compact('userComments', 'user_role', 'labels', 'keySearch', 'labelId'));
        }
        else if($request->isMethod('post')) {
            return ['data' => $userComments];
        }
    }

    public function add_label(Request $request) {
        try {
            $label = new Label();
            $label->name = $request->name;
            $label->color = $request->color;
            $label->save();
            $labels = Label::all();
            $response = array('data' => $labels);
        } catch(Exception $e) {
            $response = array('error' => $e->getMessage());
        }
        return $response;
    }

    public function editLabel(Request $request) {
        try {
            $label = Label::find($request->id)->update([
                'color' => $request->color,
                'name' => $request->name
            ]);
            $response = array('data' => $label);
        } catch(Exception $e) {
            $response = array('error' => $e->getMessage());
        }
        return $response;
    }

    public function del_label(Request $request) {
        try {
            Label::find($request->id)->delete();
            $labels = Label::all();
            $response = array('data' => $labels);
        } catch(Exception $e) {
            $response = array('error' => $e->getMessage());
        }
        return $response;
    }

    public function add_new_comment(Request $request) {
        
        $data = $request->validate([
            'comment_id' => 'nullable|integer',
            'lesson_id' => 'required',
            'content' => 'required'
        ]);

        $user_id = Auth::user()->id;
        $role_id = Auth::user()->role_id;
        $lesson_id = $data['lesson_id'];
        $content['message'] = $data['content'];
        $comment_id = $data['comment_id'];
        $replyId = $request->reply_id ?? 0;
        $replyCommentId = $request->reply_comment_id;

        $response = array();

        try {
            $time = show_comment_detail_created_time();
            
            if ($role_id < 3) {
                $senderName = "Telesa English";
            } else{
                $senderName = Auth::user()->first_name . " " . Auth::user()->last_name;
            }

            
            if (is_null_or_empty($comment_id)) {
                if (in_array($role_id, array(1, 2))) {
                } else if ($role_id != 3) {
                    // add comment
                    $comment_id = Comments::where('user_id', $user_id)->where('lesson_id', $lesson_id)->pluck('id')->first();
                    if (!$comment_id) {
                        $comment_id = DB::table('comments')->insertGetId([
                            'user_id' => $user_id,
                            'lesson_id' => $lesson_id
                        ]);
                    }
                }
            }

            if ($comment_id) {
                // add comment detail
                $cd_id = DB::table('comment_detail')->insertGetId([
                    'user_id' => $user_id,
                    'comment_id' => $comment_id,
                    'content' => $data['content'],
                    'reply_id' => $replyId,
                    'reply_comment_id' => $replyCommentId,
                    'created_time' => Date('Y-m-d H:i:s')
                ]);

                if($replyCommentId) {
                    $replyContent = CommentDetail::find($replyCommentId)->content ?? "";
                    $content['reply_message'] = $replyContent;
                }

                event(new ChatEvent($user_id, $replyId, $content, $time, $senderName, $cd_id ));

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

        return response()->json($response);
    }

    public function selectLabel(Request $request)
    {
        try {
            if(!$request->label_id) {
                $labelSelected = UserLabel::where(
                    ['comment_id' => $request->comment_id])->delete();
            } else {
                $labelSelected = UserLabel::updateOrCreate(
                    ['comment_id' => $request->comment_id],
                    ['user_id' => Auth::user()->id, 'label_id' => $request->label_id]
                );
            }
            

            $response = array('data' => $labelSelected);
        } catch(Exception $e) {
            $response = array('error' => $e->getMessage());
        }
        return $response;
    }


}
