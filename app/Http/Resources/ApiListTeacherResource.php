<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Auth;

class ApiListTeacherResource extends JsonResource
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
            'id' => $this->id,
            'name' => $this->first_name . ' ' . $this->last_name,
            'photo' => !is_null($this->photo) ? asset($this->photo) : asset('avatar.png'),
            'country' => $this->teacher_from != 0 ? countries()[$this->teacher_from] : "Chưa cập nhật",
            'speakes' => $this->speakes != 0 ? countries()[$this->speakes] : "Chưa cập nhật",
            'money' => $this->money,
            'saved' => isset($this->save_teacher->teacher_id) ? true : false
        ];
    }
}
