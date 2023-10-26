<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'firstname', 
        'lastname', 
        'email', 
        'phone',
        'mat_number',
         'google_id', 
         'phone_code',
         'secret_key', 
         'identifier', 
         'password',
    ];

    public function student()
    {
        return $this->hasOne(Student::class);
    }

    public function teacher()
    {
        return $this->hasOne(Teacher::class);
    }

    public function messages()
    {
        return $this->hasMany(Message::class, 'sender_email', 'email');
    }

    public function transcripts()
    {
        return $this->hasMany(Transcript::class, 'user_id');
    }

    public function certificates()
    {
        return $this->hasMany(Certificate::class);
    }

    public function diplomas()
{
    return $this->hasMany(Diploma::class);
}

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];
}
