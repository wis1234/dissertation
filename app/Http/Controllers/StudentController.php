<?php

namespace App\Http\Controllers;

use App\Models\Student;
use App\Models\User; // Import the User model
use Illuminate\Http\Request;
use Illuminate\Database\QueryException;

class StudentController extends Controller
{
    public function index()
    {
        return Student::all();
    }

    public function store(Request $request)
    {
        try {
            $validatedData = $request->validate([
                'user_id' => 'required|exists:users,id',
                'ac_level' => 'required|string',
            ]);

            // Retrieve user data based on user_id
            $user = User::findOrFail($validatedData['user_id']);

            // Automatically populate student fields based on user data
            $studentData = array_merge($validatedData, [
                'student_firstname' => $user->firstname,
                'student_lastname' => $user->lastname,
                'student_phone' => $user->phone,
                'student_email' => $user->email,
            ]);

            $student = Student::create($studentData);

            return response()->json(['message' => 'Student created successfully', 'student' => $student], 201);
        } catch (QueryException $e) {
            return response()->json(['error' => 'Database error'], 500);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Something went wrong'], 500);
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $student = Student::findOrFail($id);

            $validatedData = $request->validate([
                'user_id' => 'required|exists:users,id',
                'ac_level' => 'required|string',
                'mat_number' => 'required|string',
                'identifier' => 'required|string',
            ]);

            // Retrieve user data based on user_id
            $user = User::findOrFail($validatedData['user_id']);

            // Automatically update student fields based on user data
            $studentData = array_merge($validatedData, [
                'student_firstname' => $user->firstname,
                'student_lastname' => $user->lastname,
                'student_phone' => $user->phone,
                'student_email' => $user->email,
            ]);

            $student->update($studentData);

            return response()->json(['message' => 'Student updated successfully', 'student' => $student]);
        } catch (QueryException $e) {
            return response()->json(['error' => 'Database error'], 500);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Something went wrong'], 500);
        }
    }

    public function show($id)
    {
        try {
            $student = Student::findOrFail($id);
            return response()->json(['message' => 'Student retrieved successfully', 'student' => $student]);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Student not found'], 404);
        }
    }

    public function destroy($id)
    {
        try {
            $student = Student::findOrFail($id);
            $student->delete();
            return response()->json(['message' => 'Student deleted successfully'], 204);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Student not found'], 404);
        }
    }
}
