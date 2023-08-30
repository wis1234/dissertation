<?php

namespace App\Http\Controllers;

use App\Models\Complaint;
use Illuminate\Http\Request;

class ComplaintController extends Controller
{
    public function index()
    {
        return Complaint::all();
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'student_id' => 'required|exists:students,id',
            'complain_type' => 'required|string',
            'claimant_firstname' => 'required|string',
            'claimant_lastname' => 'required|string',
            'claimant_phone' => 'required|string',
            'claimant_email' => 'required|email',
            'subject_title' => 'required|string',
            'description' => 'required|string',
            'exam_type' => 'required|string',
            'payment_proof' => 'required|string',
            'status' => 'required|string',
            'result' => 'required|string',
            'ac_year' => 'required|string',
        ]);

        return Complaint::create($validatedData);
    }

    public function show($id)
    {
        return Complaint::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $complaint = Complaint::findOrFail($id);

        $validatedData = $request->validate([
            'student_id' => 'required|exists:students,id',
            'complain_type' => 'required|string',
            'claimant_firstname' => 'required|string',
            'claimant_lastname' => 'required|string',
            'claimant_phone' => 'required|string',
            'claimant_email' => 'required|email',
            'subject_title' => 'required|string',
            'description' => 'required|string',
            'exam_type' => 'required|string',
            'payment_proof' => 'required|string',
            'status' => 'required|string',
            'result' => 'required|string',
            'ac_year' => 'required|string',
        ]);

        $complaint->update($validatedData);

        return $complaint;
    }

    public function destroy($id)
    {
        $complaint = Complaint::findOrFail($id);
        $complaint->delete();
        return response(null, 204);
    }
}
