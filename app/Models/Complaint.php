<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Complaint extends Model
{
    use HasFactory;

    protected $fillable = [
        'student_id',
         'complain_type', 
         'mat_number',
         'claimant_firstname',
        'claimant_lastname',
         'claimant_phone', 
         'claimant_email', 
         'subject_title', 
         'description', 
         'exam_type', 
         'payment_proof', 
         'status',
          'result', 
          'ac_year',
    ];

    public function student()
    {
        return $this->belongsTo(Student::class);
    }
}
