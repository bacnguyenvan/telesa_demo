<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TeacherEducation extends Model
{
    use HasFactory;

    protected $table = "teacher_education";
    protected $fillable = ['teacher_id', 'time_start', 'time_end', 'school', 'education'];
}
