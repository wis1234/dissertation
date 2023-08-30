<?php

namespace App\Http\Controllers;

use App\Models\Teacher;
use App\Models\User;
use Illuminate\Http\Request;

class TeacherController extends Controller
{
    public function index()
    {
        return Teacher::all();
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'mat_number' => 'required|string|exists:users,mat_number',
            'grade' => 'required|string',
            'speciality' => 'required|string',
            'subject_title' => 'required|string',
        ]);

        // Fetch user information based on the provided mat_number
        $user = User::where('mat_number', $validatedData['mat_number'])->firstOrFail();

        // Create a new teacher record
        $teacher = Teacher::create([
            'user_id' => $user->id,
            'teacher_firstname' => $user->firstname,
            'teacher_lastname' => $user->lastname,
            'teacher_phone' => $user->phone,
            'teacher_email' => $user->email,
            'grade' => $validatedData['grade'],
            'speciality' => $validatedData['speciality'],
            'subject_title' => $validatedData['subject_title'],
        ]);

        return response()->json(['message' => 'Teacher created successfully', 'teacher' => $teacher], 201);
    }

    public function show($id)
    {
        return Teacher::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $teacher = Teacher::findOrFail($id);

        $validatedData = $request->validate([
            'user_id' => 'required|exists:users,id',
            'teacher_firstname' => 'required|string',
            'teacher_lastname' => 'required|string',
            'teacher_phone' => 'required|string',
            'teacher_email' => 'required|email',
            'grade' => 'required|string',
            'speciality' => 'required|string',
            'subject_title' => 'required|string',
        ]);

        $teacher->update($validatedData);

        return $teacher;
    }

    public function destroy($mat_number)
    {
        try {
            $teacher = Teacher::whereHas('user', function ($query) use ($mat_number) {
                $query->where('mat_number', $mat_number);
            })->firstOrFail();

            $teacher->delete();

            $user = $teacher->user;
            $message = "You've just deleted {$user->firstname} {$user->lastname} successfully";

            return response()->json(['message' => $message], 201);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Teacher not found'], 404);
        }
    }
}
