<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Transcript;
use App\Models\User;
use Illuminate\Support\Facades\Storage;

class TranscriptController extends Controller
{
    public function index()
    {
        try {
            $transcripts = Transcript::all();
            return response()->json($transcripts, 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Error fetching transcripts'], 500);
        }
    }

    public function show(Transcript $transcript)
    {
        try {
            return response()->json($transcript, 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Error fetching transcript'], 500);
        }
    }

    public function store(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'ac_year' => 'required',
                'ac_level' => 'required',
                'mat' => 'required|exists:users,mat_number',
                'exam_type' => 'required',
                'field' => 'required',
                'speciality' => 'required',
                'description' => 'required',
                'fiche_inscription' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            ]);

            if ($validator->fails()) {
                return redirect('http://localhost/reset/false_form_filled.html');
            }

            // Get user details based on mat
            $user = User::where('mat_number', $request->input('mat'))->first();

            $imagePath = $request->file('fiche_inscription')->store('transcript_images', 'public');

            $transcript = Transcript::create(array_merge($request->all(), [
                'user_id' => $user->id,
                'firstname' => $user->firstname,
                'lastname' => $user->lastname,
                'email' => $user->email,
                'phone' => $user->phone,
                'fiche_inscription' => $imagePath,
            ]));

            // return response()->json($transcript, 201);
            return redirect('http://localhost/reset/test_transcript.html');

        } catch (\Exception $e) {

            return redirect('http://localhost/reset/false_form_filled.html');

            // return response()->json(['message' => 'Error creating transcript'], 500);
        }
    }

    public function update(Request $request, Transcript $transcript)
    {
        try {
            $validator = Validator::make($request->all(), [
                'ac_year' => 'required',
                'ac_level' => 'required',
                'mat' => 'required|exists:users,mat_number',
                'exam_type' => 'required',
                'field' => 'required',
                'speciality' => 'required',
                'description' => 'required',
                'fiche_inscription' => 'sometimes|image|mimes:jpeg,png,jpg,gif|max:2048',
            ]);

            if ($validator->fails()) {

                return redirect('http://localhost/reset/false_form_filled.html');

                // return response()->json($validator->errors(), 400);
            }

            // Get user details based on mat
            $user = User::where('mat_number', $request->input('mat'))->first();

            $transcriptData = array_merge($request->all(), [
                'user_id' => $user->id,
                'firstname' => $user->firstname,
                'lastname' => $user->lastname,
                'email' => $user->email,
                'phone' => $user->phone,
            ]);

            if ($request->hasFile('fiche_inscription')) {
                Storage::delete('public/' . $transcript->fiche_inscription);
                $imagePath = $request->file('fiche_inscription')->store('transcript_images', 'public');
                $transcriptData['fiche_inscription'] = $imagePath;
            }

            $transcript->update($transcriptData);

            return response()->json($transcript, 200);
        } catch (\Exception $e) {

            return redirect('http://localhost/reset/false_form_filled.html');

            // return response()->json(['message' => 'Error updating transcript'], 500);
        }
    }

    public function destroy(Transcript $transcript)
    {
        try {
            Storage::delete('public/' . $transcript->fiche_inscription);
            $transcript->delete();

            return response()->json(null, 204);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Error deleting transcript'], 500);
        }
    }
}
