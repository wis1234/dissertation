<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Diploma extends Model
{
    use HasFactory;

    protected $table = 'diplomas';

    protected $fillable = [
        'user_id',
        'ac_year',
        'ac_level',
        'mat',
        'field',
        'speciality',
        'description',
        'fiche_inscription',
        'firstname',
        'lastname',
        'email',
        'phone',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
