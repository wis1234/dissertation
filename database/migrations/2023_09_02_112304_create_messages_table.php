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
        Schema::create('messages_table', function (Blueprint $table) {
            $table->id();
            $table->string('sender_firstname')->nullable();
            $table->string('sender_lastname')->nullable();
            $table->string('send_phone')->nullable();
            $table->string('sender_email');
            $table->string('subject');
            $table->text('message');
            $table->timestamps();
        });
    }
    

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('messages');
    }
};
