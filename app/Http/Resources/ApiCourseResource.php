<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ApiCourseResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        // return parent::toArray($request);
        $price_after_discount = $this->discount != 0 ? $this->price - ($this->price * $this->discount / 100) : 0;
        return [
            'id' => $this->id,
            'name' => $this->name,
            'price' => $this->price,
            'discount' => $this->discount,
            'price_after_discount' => $price_after_discount,
            'banner' =>  $this->banner != null ? env('APP_URL') . '/' . $this->banner : null
        ];
    }
}
