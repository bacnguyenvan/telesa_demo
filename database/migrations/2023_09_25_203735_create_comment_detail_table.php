<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCommentDetailTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('comment_detail', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->integer('reply_id')->nullable();
            $table->integer('comment_id');
            $table->string('path', 255)->nullable();
            $table->text('content')->nullable();
            $table->tinyInteger('type')->default(1)->comment('1: text, 2: file 3: audio, 4: video, 5: image');
            $table->datetime('created_time')->useCurrent();
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
        Schema::dropIfExists('comment_detail');
    }
}
