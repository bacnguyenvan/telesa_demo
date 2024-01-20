<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Auth;

class ApiListCommentResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $name = "";
        $cloudfrontUrl = config('api.cloudfront_url') . '/chat/dev';
        if (Auth::user()->id != $this->user_id) {
            if (Auth::user()->role_id < 3) {
                $name = $this->first_name . ' ' . $this->last_name;
            } else {
                $name = "Telesa English";
            }
        }

        switch ($this->type) {
            case 5:
                $path = $cloudfrontUrl . "/" . $this->comment_id . "/" . $this->content;
                break;
            case 6:
                $path = $this->path;
                break;

            default:
                $path = $this->path;
                break;
        }

        $reply_id = !empty($this->reply) ? $this->reply->id : 0;

        return [
            'id' => $this->id,
            'name' => $name,
            'type' => $this->type,
            'path' => $path,
            'content' => $this->content,
            'sender_id' => $this->user_id,
            'reply_id' => $reply_id,
            'created_time' => show_comment_detail_created_time($this->created_time)
        ];
    }
}
