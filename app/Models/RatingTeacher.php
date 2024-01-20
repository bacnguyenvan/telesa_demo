<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RatingTeacher extends Model
{
    use HasFactory;
    protected $table = "rating_teacher";
    protected $fillable = ['user_id', 'teacher_id', 'star', 'rate_content'];

    public function user_rating()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }
}
