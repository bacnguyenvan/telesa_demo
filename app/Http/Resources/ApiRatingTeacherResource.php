<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ApiRatingTeacherResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'name' => $this->user_rating->first_name . ' ' . $this->user_rating->last_name,
            'time' => date('H:i, d/m/Y', strtotime($this->updated_at)),
            'photo' => !is_null($this->user_rating->photo) ? asset($this->user_rating->photo) : null,
            'star' => $this->star,
            'rate_content' => $this->rate_content
        ];
    }
}
