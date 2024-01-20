<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateUserTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->integer('teaches')->default(0);
            $table->integer('speakes')->default(0);
            $table->integer('teacher_from')->default(0);
            $table->text('description')->nullable();
            $table->string('video')->nullable();
            $table->text('teaching_style')->nullable();
            $table->text('teaching_material')->nullable();
            $table->integer('money')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            //
        });
    }
}
