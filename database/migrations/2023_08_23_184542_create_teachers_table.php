<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
// database/migrations/yyyy_mm_dd_create_teachers_table.php

public function up()
{
    Schema::create('teachers', function (Blueprint $table) {
        $table->id();
        $table->unsignedBigInteger('user_id');
        $table->string('teacher_firstname');
        $table->string('teacher_lastname');
        $table->string('teacher_phone');
        $table->string('teacher_email');
        $table->string('grade');
        $table->string('speciality');
        $table->string('subject_title');
        $table->timestamps();

        $table->foreign('user_id')->references('id')->on('users');
    });
}


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('teachers');
    }
};
