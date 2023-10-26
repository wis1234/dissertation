<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transcript extends Model
{
    use HasFactory;

    protected $fillable = [
        'ac_year',
        'ac_level',
        'mat',
        'exam_type',
        'field',
        'speciality',
        'description',
        'fiche_inscription',
        'user_id',      
        'firstname',
        'lastname',
        'email',
        'phone',
    ];
    

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
