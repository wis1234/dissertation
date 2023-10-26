<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Diploma;
use App\Models\User;
use Illuminate\Support\Facades\Storage;

class DiplomaController extends Controller
{
    public function index()
    {
        try {
            $diplomas = Diploma::all();
            return response()->json($diplomas, 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Error fetching diplomas'], 500);
        }
    }

    public function show(Diploma $diploma)
    {
        try {
            return response()->json($diploma, 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Error fetching diploma'], 500);
        }
    }

    public function store(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'ac_year' => 'required',
                'ac_level' => 'required',
                'mat' => 'required|exists:users,mat_number',
                'field' => 'required',
                'speciality' => 'required',
                'description' => 'required',
                'fiche_inscription' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            ]);

            if ($validator->fails()) {
                // return response()->json($validator->errors(), 400);
                return redirect('http://localhost/reset/false_form_filled.html');

            }

            // Get user details based on mat
            $user = User::where('mat_number', $request->input('mat'))->first();

            if (!$user) {
                // return response()->json(['message' => 'User not found'], 404);
                return redirect('http://localhost/reset/false_form_filled.html');

            }

            $imagePath = $request->file('fiche_inscription')->store('diploma_images', 'public');

            $diploma = new Diploma([
                'ac_year' => $request->input('ac_year'),
                'ac_level' => $request->input('ac_level'),
                'mat' => $request->input('mat'),
                'field' => $request->input('field'),
                'speciality' => $request->input('speciality'),
                'description' => $request->input('description'),
                'fiche_inscription' => $imagePath,
                'user_id' => $user->id,
                'firstname' => $user->firstname,
                'lastname' => $user->lastname,
                'email' => $user->email,
                'phone' => $user->phone,
            ]);

            $diploma->save();

            // return response()->json($diploma, 201);
            return redirect('http://localhost/reset/test_diploma.html');


        } catch (\Exception $e) {
            // return response()->json(['message' => 'Error creating diploma'], 500);
            return redirect('http://localhost/reset/false_form_filled.html');

        }
    }

    public function update(Request $request, Diploma $diploma)
    {
        try {
            $validator = Validator::make($request->all(), [
                'ac_year' => 'required',
                'ac_level' => 'required',
                'mat' => 'required|exists:users,mat_number',
                'field' => 'required',
                'speciality' => 'required',
                'description' => 'required',
                'fiche_inscription' => 'sometimes|image|mimes:jpeg,png,jpg,gif|max:2048',
            ]);

            if ($validator->fails()) {
                return response()->json($validator->errors(), 400);
            }

            // Get user details based on mat
            $user = User::where('mat_number', $request->input('mat'))->first();

            $diplomaData = array_merge($request->all(), [
                'user_id' => $user->id,
                'firstname' => $user->firstname,
                'lastname' => $user->lastname,
                'email' => $user->email,
                'phone' => $user->phone,
            ]);

            if ($request->hasFile('fiche_inscription')) {
                Storage::delete('public/' . $diploma->fiche_inscription);
                $imagePath = $request->file('fiche_inscription')->store('diploma_images', 'public');
                $diplomaData['fiche_inscription'] = $imagePath;
            }

            $diploma->update($diplomaData);

            return response()->json($diploma, 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Error updating diploma'], 500);
        }
    }

    public function destroy(Diploma $diploma)
    {
        try {
            Storage::delete('public/' . $diploma->fiche_inscription);
            $diploma->delete();

            return response()->json(null, 204);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Error deleting diploma'], 500);
        }
    }
}
