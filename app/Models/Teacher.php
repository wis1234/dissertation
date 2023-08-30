<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Teacher extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id', 
        'teacher_firstname', 
        'teacher_lastname', 
        'teacher_phone', 
        'teacher_email', 
        'grade',
        'speciality', 
        'subject_title'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function complaints()
    {
        return $this->hasMany(Complaint::class);
    }

    
    public function subjects()
    {
        return $this->belongsToMany(Subject::class);
    }

}
