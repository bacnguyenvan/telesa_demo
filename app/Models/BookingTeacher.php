<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BookingTeacher extends Model
{
    use HasFactory;
    protected $table = "booking_teacher";
    protected $fillable = ['user_id', 'teacher_id', 'time_booking', 'date_booking', 'weekdays', 'type'];
}
