<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SaveTeacher extends Model
{
    use HasFactory;
    protected $table = 'save_teacher';
    protected $fillable = ['user_id', 'teacher_id'];
}
