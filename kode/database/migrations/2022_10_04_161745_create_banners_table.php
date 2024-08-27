<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBannersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('banners', function (Blueprint $table) {
            $table->id();
            $table->string('uid',100)->index()->nullable();
            $table->integer('serial_id')->nullable();
            $table->string('heading')->nullable();
            $table->string('sub_heading')->nullable();
            $table->string('btn_name')->nullable();
            $table->string('btn_url')->nullable();
            $table->string('bg_image')->default('default.jpg')->nullable();
            $table->string('banner_type')->nullable();
            $table->string('price_range')->nullable();
            $table->enum('status',[0,1])->default(1)->comment('Active : 1,Inactive : 0');
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
        Schema::dropIfExists('banners');
    }
}
