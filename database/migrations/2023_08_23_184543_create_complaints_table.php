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
            $table->string('claimant_firstname');
            $table->string('claimant_lastname');
            $table->string('claimant_phone');
            $table->string('claimant_email');
            $table->string('ac_year');
            $table->string('ac_level');
            $table->string('mat_number');
            $table->string('field');
            $table->string('speciality');
            $table->string('exam_type');
            $table->string('complain_type');
            $table->string('ecue');
            $table->string('ecue_sub');
            $table->text('fiche_inscription'); // Change to text type
            $table->text('payment_proof'); // Change to text type
            $table->text('description');
            $table->timestamps();

            $table->foreign('student_id')->references('id')->on('users');
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
