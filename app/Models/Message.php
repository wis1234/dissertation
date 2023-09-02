<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    protected $table = 'messages_table';
    protected $fillable = [
        'sender_firstname',
        'sender_lastname',
        'send_phone',
        'sender_email',
        'subject',
        'message',
    ];

    // Define a relationship to associate messages with a user (assuming each message belongs to a user).
    public function user()
    {
        return $this->belongsTo(User::class, 'sender_email', 'email');
    }
}
