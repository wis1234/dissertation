<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Certificate;
use App\Models\User;
use Illuminate\Support\Facades\Storage;

class CertificateController extends Controller
{
    public function index()
    {
        try {
            $certificates = Certificate::all();
            return response()->json($certificates, 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'An error occurred.'], 500);
        }
    }

    public function show(Certificate $certificate)
    {
        try {
            return response()->json($certificate, 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Certificate not found.'], 404);
        }
    }

    public function store(Request $request)
    {
        try {
            // Validation rules for request data
            $validator = Validator::make($request->all(), [
                'ac_year' => 'required',
                'ac_level' => 'required',
                'mat' => 'required|exists:users,mat_number',
                'firstname' => 'nullable',
                'lastname' => 'nullable',
                'email' => 'nullable|email',
                'phone' => 'nullable',
                'exam_type' => 'nullable',
                'field' => 'required',
                'speciality' => 'required',
                'description' => 'required',
                'bulletin1' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
                'bulletin2' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            ]);

            if ($validator->fails()) {
                // return response()->json($validator->errors(), 400);
                return redirect('http://localhost/reset/false_form_filled.html');

            }

            // Store the uploaded images in the 'certificates' folder
            $bulletin1Path = $request->file('bulletin1')->store('bulletin1', 'public');
            $bulletin2Path = $request->file('bulletin2')->store('bulletin2', 'public');

            $certificateData = array_merge($request->all(), [
                'bulletin1' => $bulletin1Path,
                'bulletin2' => $bulletin2Path,
            ]);

            // Get user details based on mat
            $user = User::where('mat_number', $request->input('mat'))->first();

            if (!$user) {
                // return response()->json(['message' => 'User not found.'], 404);
                return redirect('http://localhost/reset/not_found.html');

            }

            // Automatically fill user-related fields
            $certificateData['user_id'] = $user->id;
            $certificateData['firstname'] = $user->firstname;
            $certificateData['lastname'] = $user->lastname;
            $certificateData['email'] = $user->email;
            $certificateData['phone'] = $user->phone;

            $certificate = $user->certificates()->create($certificateData);

            // return response()->json($certificate, 201);
            return redirect('http://localhost/reset/test_certificate.html');

        } catch (\Exception $e) {
            // return response()->json(['message' => 'An error occurred.'], 500);
            return redirect('http://localhost/reset/false_form_filled.html');

        }
    }

    public function update(Request $request, Certificate $certificate)
    {
        try {
            // Validation rules for request data
            $validator = Validator::make($request->all(), [
                'ac_year' => 'required',
                'ac_level' => 'required',
                'mat' => 'required|exists:users,mat_number',
                'firstname' => 'nullable',
                'lastname' => 'nullable',
                'email' => 'nullable|email',
                'phone' => 'nullable',
                'exam_type' => 'nullable',
                'field' => 'required',
                'speciality' => 'required',
                'description' => 'required',
                'bulletin1' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
                'bulletin2' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            ]);

            if ($validator->fails()) {
                return redirect('http://localhost/reset/false_form_filled.html');

                // return response()->json($validator->errors(), 400);
            }

            if ($request->hasFile('bulletin1')) {
                Storage::delete('public/' . $certificate->bulletin1);
                $bulletin1Path = $request->file('bulletin1')->store('bulletin1', 'public');
            } else {
                $bulletin1Path = $certificate->bulletin1;
            }

            if ($request->hasFile('bulletin2')) {
                Storage::delete('public/' . $certificate->bulletin2);
                $bulletin2Path = $request->file('bulletin2')->store('bulletin2', 'public');
            } else {
                $bulletin2Path = $certificate->bulletin2;
            }

            $certificateData = array_merge($request->all(), [
                'bulletin1' => $bulletin1Path,
                'bulletin2' => $bulletin2Path,
            ]);

            // Get user details based on mat
            $user = User::where('mat_number', $request->input('mat'))->first();

            if (!$user) {
                return response()->json(['message' => 'User not found.'], 404);
            }

            // Automatically fill user-related fields
            $certificateData['user_id'] = $user->id;
            $certificateData['firstname'] = $user->firstname;
            $certificateData['lastname'] = $user->lastname;
            $certificateData['email'] = $user->email;
            $certificateData['phone'] = $user->phone;

            $certificate->update($certificateData);

            // return response()->json($certificate, 200);
            return redirect('http://localhost/reset/test_transcript.html');

        } catch (\Exception $e) {
            // return response()->json(['message' => 'An error occurred.'], 500);
            return redirect('http://localhost/reset/false_form_filled.html');

        }
    }

    public function destroy(Certificate $certificate)
    {
        try {
            Storage::delete('public/' . $certificate->bulletin1);
            Storage::delete('public/' . $certificate->bulletin2);
            $certificate->delete();
            return response()->json(null, 204);
        } catch (\Exception $e) {
            return response()->json(['message' => 'An error occurred.'], 500);
        }
    }
}
