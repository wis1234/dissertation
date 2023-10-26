<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Complaint;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\Storage;
use Exception; // Corrected namespace

class ComplaintController extends Controller
{
    public function index()
    {
        try {
            $complaints = Complaint::all();
            return response()->json(['complaints' => $complaints]);
        } catch (Exception $e) {
            return response()->json(['message' => 'Error fetching complaints', 'error' => $e->getMessage()], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function store(Request $request)
    {
        try {
            $validator = Validator::make($request->only(['fiche_inscription', 'mat', 'ac_year', 'ac_level', 'field', 'speciality', 'exam_type', 'complain_type', 'ecue', 'ecue_sub', 'description']), [
                'fiche_inscription' => 'required|file|mimes:jpg,jpeg,png|max:2048',
                'mat' => 'required|string',
                'ac_year' => 'required|string',
                'ac_level' => 'required|string',
                'field' => 'required|string',
                'speciality' => 'required|string',
                'exam_type' => 'required|string',
                'complain_type' => 'required|string',
                'ecue' => 'required|string',
                'ecue_sub' => 'required|string',
                'description' => 'nullable|string',
            ]);

            if ($validator->fails()) {
                throw new ValidationException($validator);
            }

            $mat = $request->input('mat');
            $user = User::where('mat_number', $mat)->first();

            if (!$user) {
                // return response()->json(['message' => 'User not found'], Response::HTTP_NOT_FOUND);
                return redirect('http://localhost/reset/not_found.html');

            }

            $complaintData = $request->only(['ac_year', 'ac_level', 'mat', 'field', 'speciality', 'exam_type', 'complain_type', 'ecue', 'ecue_sub', 'description']);
            $complaintData['student_id'] = $user->id;
            $complaintData['claimant_firstname'] = $user->firstname;
            $complaintData['claimant_lastname'] = $user->lastname;
            $complaintData['claimant_phone'] = $user->phone;
            $complaintData['claimant_email'] = $user->email;

            $ficheInscriptionPath = $this->storeFile($request->file('fiche_inscription'));

            if (!$ficheInscriptionPath) {

                // return response()->json(['message' => 'Failed to store fiche_inscription file'], Response::HTTP_INTERNAL_SERVER_ERROR);
                return redirect('http://localhost/reset/false_form_filled.html');

            }

            // Create the Complaint model with the 'fiche_inscription' field set to the path
            $complaint = new Complaint($complaintData);
            $complaint->fiche_inscription = $ficheInscriptionPath;
            $complaint->save();

            // return response()->json(['message' => 'Complaint created successfully', 'data' => $complaint]);

            return redirect('http://localhost/reset/test.html');

        } catch (ValidationException $e) {

            // return response()->json(['error' => $e->getMessage()], Response::HTTP_BAD_REQUEST);
            return redirect('http://localhost/reset/false_form_filled.html');


        } catch (Exception $e) {
            
            // return response()->json(['message' => 'An error occurred', 'error' => $e->getMessage()], Response::HTTP_INTERNAL_SERVER_ERROR);
            return redirect('http://localhost/reset/false_form_filled.html');

        }
    }

    public function show($id)
    {
        try {
            $complaint = Complaint::findOrFail($id);
            return response()->json(['complaint' => $complaint]);
        } catch (ModelNotFoundException $e) {
            return response()->json(['error' => 'Complaint not found'], Response::HTTP_NOT_FOUND);
        } catch (Exception $e) {
            return response()->json(['message' => 'Error fetching complaint', 'error' => $e->getMessage()], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $complaint = Complaint::findOrFail($id);

            $validator = Validator::make($request->only(['ac_year', 'ac_level', 'mat', 'field', 'speciality', 'exam_type', 'complain_type', 'ecue', 'ecue_sub', 'description']), [
                'ac_year' => 'required|string',
                'ac_level' => 'required|string',
                'mat' => 'required|string',
                'field' => 'required|string',
                'speciality' => 'required|string',
                'exam_type' => 'required|string',
                'complain_type' => 'required|string',
                'ecue' => 'required|string',
                'ecue_sub' => 'required|string',
                'description' => 'nullable|string',
            ]);

            if ($validator->fails()) {
                throw new ValidationException($validator);
            }

            $complaintData = $request->only(['ac_year', 'ac_level', 'mat', 'field', 'speciality', 'exam_type', 'complain_type', 'ecue', 'ecue_sub', 'description']);

            // Update 'fiche_inscription' file if provided
            if ($request->hasFile('fiche_inscription')) {
                $ficheInscriptionPath = $this->storeFile($request->file('fiche_inscription'));
                if (!$ficheInscriptionPath) {
                    return response()->json(['message' => 'Failed to update fiche_inscription file'], Response::HTTP_INTERNAL_SERVER_ERROR);
                }
                $complaintData['fiche_inscription'] = $ficheInscriptionPath;
            }

            // Update other complaint data
            $complaint->update($complaintData);

            return response()->json(['message' => 'Complaint updated successfully', 'data' => $complaint]);
        } catch (ValidationException $e) {
            return response()->json(['error' => $e->getMessage()], Response::HTTP_BAD_REQUEST);
        } catch (ModelNotFoundException $e) {
            return response()->json(['error' => 'Complaint not found'], Response::HTTP_NOT_FOUND);
        } catch (Exception $e) {
            return response()->json(['message' => 'An error occurred', 'error' => $e->getMessage()], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function destroy($id)
    {
        try {
            $complaint = Complaint::findOrFail($id);

            // Delete 'fiche_inscription' file if it exists
            if ($complaint->fiche_inscription) {
                $this->deleteFile($complaint->fiche_inscription);
            }

            $complaint->delete();

            return response()->json(['message' => 'Complaint deleted successfully'], Response::HTTP_OK);
        } catch (ModelNotFoundException $e) {
            return response()->json(['error' => 'Complaint not found'], Response::HTTP_NOT_FOUND);
        } catch (Exception $e) {
            return response()->json(['message' => 'An error occurred', 'error' => $e->getMessage()], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    private function storeFile($file)
    {
        if (!$file || !$file->isValid()) {
            return null;
        }

        return $file->store('complaint_files', 'public');
    }

    private function deleteFile($path)
    {
        Storage::disk('public')->delete($path);
    }
}
