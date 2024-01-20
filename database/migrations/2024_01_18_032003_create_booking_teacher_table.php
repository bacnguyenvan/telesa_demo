<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBookingTeacherTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('booking_teacher', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->integer('teacher_id');
            $table->integer('time_booking');
            $table->string('date_booking');
            $table->integer('weekdays')->comment("0: Chủ nhật, 1: Thứ 2, ...");
            $table->integer('type')->comment('0: Đang chờ, 1: Chấp nhận, 2: Bận');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('booking_teacher');
    }
}
