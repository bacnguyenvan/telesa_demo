<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TeacherWorkExprientce extends Model
{
    use HasFactory;
    protected $table = 'teacher_work_experience';
    protected $fillable = [
        'teacher_id',
        'time_start',
        'time_end',
        'school',
        'position',
        'description'
    ];
}
