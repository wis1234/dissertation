<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */

public function up()
{
    Schema::create('complaints', function (Blueprint $table) {
        $table->id();
        $table->unsignedBigInteger('student_id');
        $table->string('complain_type');
        $table->string('claimant_firstname');
        $table->string('claimant_lastname');
        $table->string('claimant_phone');
        $table->string('claimant_email');
        $table->string('subject_title');
        $table->text('description');
        $table->string('exam_type');
        $table->string('payment_proof');
        $table->string('status');
        $table->string('result');
        $table->string('ac_year');
        $table->timestamps();

        $table->foreign('student_id')->references('id')->on('students');
    });
}


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('complaints');
    }
};
