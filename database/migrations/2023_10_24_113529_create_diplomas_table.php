<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDiplomasTable extends Migration
{
    public function up()
    {
        Schema::create('diplomas', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->string('firstname');
            $table->string('lastname');
            $table->string('email');
            $table->string('phone');
            $table->string('ac_year');
            $table->string('ac_level');
            $table->string('mat');
            $table->string('field');
            $table->string('speciality');
            $table->text('description');
            $table->string('fiche_inscription');
            $table->timestamps();
        });

        // Define foreign key constraint
        Schema::table('diplomas', function (Blueprint $table) {
            $table->foreign('user_id')->references('id')->on('users');
        });
    }

    public function down()
    {
        Schema::dropIfExists('diplomas');
    }
}
