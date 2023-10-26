<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Certificate extends Model
{
    use HasFactory;
    protected $table = 'certificates';

    protected $fillable = [
        'user_id',
        'ac_year',
        'ac_level',
        'mat',
        'firstname', 
        'lastname', 
        'email',     
        'phone',     
        'exam_type',
        'field',
        'speciality',
        'description',
        'bulletin1',
        'bulletin2',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
