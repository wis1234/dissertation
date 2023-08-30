<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Subject extends Model
{
    protected $fillable = [
        'title',
    ];

    public function teachers()
    {
        return $this->belongsToMany(Teacher::class);
    }
}
