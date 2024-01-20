<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TeacherCertificates extends Model
{
    use HasFactory;
    protected $table = "teacher_certificates";
    protected $fillable = ['teacher_id', 'certificate', 'description', 'file'];
}
