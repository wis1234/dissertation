<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCertificatesTable extends Migration
{
    public function up()
    {
        Schema::create('certificates', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id'); // Add user_id column
            $table->string('ac_year');
            $table->string('ac_level');
            $table->string('mat');
            $table->string('exam_type');
            $table->string('field');
            $table->string('speciality');
            $table->string('firstname'); // Add firstname field
            $table->string('lastname');  // Add lastname field
            $table->string('email');    // Add email field
            $table->string('phone');    // Add phone field
            $table->text('description');
            $table->string('bulletin1')->nullable(); // Bulletin 1 path
            $table->string('bulletin2')->nullable(); // Bulletin 2 path
            $table->timestamps();

            // Add foreign key constraint
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('certificates');
    }
}
