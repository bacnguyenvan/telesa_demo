<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVendorsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vendors', function (Blueprint $table) {
            $table->id();
            $table->string('name',100)->nullable();
            $table->text('description')->nullable();
            $table->string('image', 250)->nullable();
            $table->string('audio01', 250)->nullable();
            $table->string('audio02', 250)->nullable();
            $table->string('audio03', 250)->nullable();
            $table->string('file01', 250)->nullable();
            $table->string('file02', 250)->nullable();
            $table->string('file03', 250)->nullable();
            $table->string('video01', 250)->nullable();
            $table->string('video02', 250)->nullable();
            $table->string('video03', 250)->nullable();
            $table->tinyInteger('status')->default(1);
            $table->timestamps();
        });

        Schema::create('product_vendor', function (Blueprint $table) {
            $table->id();
            $table->integer('product_id')->nullable();
            $table->integer('vendor_id')->nullable();
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
        Schema::dropIfExists('vendors');
        Schema::dropIfExists('product_vendor');
    }
}
