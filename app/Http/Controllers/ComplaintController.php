<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Image;
use App\Models\Complaint;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;

class ComplaintController extends Controller
{
    public function index()
    {
        return Complaint::all();
    }

    public function store(Request $request)
    {
        $rules = [
            'fiche_inscription' => 'required|file|mimes:jpg,jpeg,png|max:2048',
            'mat' => 'required|string', // Change 'mat_number' to 'mat'
            'ac_year' => 'required|string',
            'ac_level' => 'required|string',
            'field' => 'required|string',
            'speciality' => 'required|string',
            'exam_type' => 'required|string',
            'complain_type' => 'required|string',
            'ecue' => 'required|string',
            'ecue_sub' => 'required|string',
            'description' => 'required|string',
        ];

        // Check if 'payment_proof' exists in the request
        if ($request->hasFile('payment_proof')) {
            $rules['payment_proof'] = 'nullable|file|mimes:jpg,jpeg,png|max:2048';
        }

        $request->validate($rules);

        $mat = $request->input('mat');
        $user = User::where('mat_number', $mat)->first();

        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }

        $ficheInscriptionPath = $this->storeFile($request->file('fiche_inscription'));
        if (!$ficheInscriptionPath) {
            return response()->json(['message' => 'Failed to store fiche_inscription file'], 500);
        }

        // Initialize an empty array to store payment proof paths
        $paymentProofPaths = [];

        // Store payment proof paths (if available)
        if ($request->hasFile('payment_proof')) {
            foreach ($request->file('payment_proof') as $paymentProof) {
                $paymentProofPath = $this->storeFile($paymentProof);
                if ($paymentProofPath) {
                    $paymentProofPaths[] = $paymentProofPath;
                }
            }
        }

        // Create a new Image model and store the image path in the images table
        $image = new Image([
            'path' => $ficheInscriptionPath, // Store the fiche_inscription path in the 'path' column
        ]);

        // Save the image with the associated complaint (if available)
        $image->save();

        

    // Create the Complaint model with a reference to the stored image
    $complaint = new Complaint([
        'student_id' => $user->id,
        'ac_year' => $request->input('ac_year'),
        'ac_level' => $request->input('ac_level'),
        'mat' => $request->input('mat'),
        'field' => $request->input('field'),
        'speciality' => $request->input('speciality'),
        'exam_type' => $request->input('exam_type'),
        'complain_type' => $request->input('complain_type'),
        'ecue' => $request->input('ecue'),
        'ecue_sub' => $request->input('ecue_sub'),
        'fiche_inscription' => $ficheInscriptionPath, // Store as a string
        'description' => $request->input('description'),
        'claimant_firstname' => $user->firstname,
        'claimant_lastname' => $user->lastname,
        'claimant_phone' => $user->phone,
        'claimant_email' => $user->email,


        $complaint = new Complaint
    ]);

    $complaint->save();

    // Store image paths in the "images" table
    $this->storeImages($complaint, $paymentProofPaths);

    return Redirect::to('dissertation_UI/test.html');
}

private function storeImages(Complaint $complaint, array $paths)
{
    foreach ($paths as $path) {
        $image = new Image(['path' => $path]);
        $complaint->images()->save($image);
    }
}



    

    public function show($id)
    {
        return Complaint::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $complaint = Complaint::findOrFail($id);

        $request->validate([
            'ac_year' => 'required|string',
            'ac_level' => 'required|string',
            'field' => 'required|string',
            'speciality' => 'required|string',
            'exam_type' => 'required|string',
            'complain_type' => 'required|string',
            'ecue' => 'required|string',
            'ecue_sub' => 'required|string',
            'description' => 'required|string',
        ]);

        // Handle file updates if needed
        // ...

        $complaint->update([
            'ac_year' => $request->input('ac_year'),
            'ac_level' => $request->input('ac_level'),
            'field' => $request->input('field'),
            'speciality' => $request->input('speciality'),
            'exam_type' => $request->input('exam_type'),
            'complain_type' => $request->input('complain_type'),
            'ecue' => $request->input('ecue'),
            'ecue_sub' => $request->input('ecue_sub'),
            'description' => $request->input('description'),
        ]);

        return response()->json($complaint, 200);
    }

    public function destroy($id)
    {
        $complaint = Complaint::findOrFail($id);
        $complaint->delete();
        return response(null, 204);
    }

    private function storeFile($file)
    {
        if (!$file || !$file->isValid()) {
            return null;
        }

        $fileName = uniqid() . '_' . $file->getClientOriginalName();

        $file->move(public_path('storage'), $fileName);

        return 'storage/' . $fileName;
    }
}


// namespace App\Http\Controllers;

// use App\Models\Complaint;
// use App\Models\User;
// use Illuminate\Http\Request;

// class ComplaintController extends Controller
// {
//     public function index()
//     {
//         return Complaint::all();
//     }

//     public function store(Request $request)
//     {
//         // Validation rules
//         $rules = [
//             'fiche_inscription' => 'required|file|mimes:jpg,jpeg,png|max:2048',

//             'ac_year' => 'required|string',
//             'ac_level' => 'required|string',
//             'mat' => 'required|string',

//             'field' => 'required|string',
//             'speciality' => 'required|string',
//             'exam_type' => 'required|string',
//             'complain_type' => 'required|string',
//             'ecue' => 'required|string',
//             'ecue_sub' => 'required|string',
//             'description' => 'required|string',
//         ];
    
//         // Check if 'payment_proof' exists in the request
//         if ($request->hasFile('payment_proof')) {
//             $rules['payment_proof'] = 'nullable|file|mimes:jpg,jpeg,png|max:2048';
//         }
    
//         $request->validate($rules);
    
//         $mat = $request->input('mat');
//         $user = User::where('mat_number', $mat)->first();
    
//         if (!$user) {
//             return response()->json(['message' => 'User not found'], 404);
//         }
    
//         $ficheInscriptionPath = $this->storeFile($request->file('fiche_inscription'));
//         if (!$ficheInscriptionPath) {
//             return response()->json(['message' => 'Failed to store fiche_inscription file'], 500);
//         }
    
//         // Initialize an empty array to store payment proof paths
//         $paymentProofPaths = [];
    
//         // Store payment proof paths (if available)
//         if ($request->hasFile('payment_proof')) {
//             foreach ($request->file('payment_proof') as $paymentProof) {
//                 $paymentProofPath = $this->storeFile($paymentProof);
//                 if ($paymentProofPath) {
//                     $paymentProofPaths[] = $paymentProofPath;
//                 }
//             }
//         }
    
//         // Create a new complaint
//         $complaint = new Complaint([
//             'student_id' => $user->id,
//             'ac_year' => $request->input('ac_year'),
//             'ac_level' => $request->input('ac_level'),
//             'mat' => $request->input('mat'),
//             'field' => $request->input('field'),
//             'speciality' => $request->input('speciality'),
//             'exam_type' => $request->input('exam_type'),
//             'complain_type' => $request->input('complain_type'),
//             'ecue' => $request->input('ecue'),
//             'ecue_sub' => $request->input('ecue_sub'),
//             'fiche_inscription' => $ficheInscriptionPath, // Store as a string
//             'description' => $request->input('description'),
//             'claimant_firstname' => $user->firstname,
//             'claimant_lastname' => $user->lastname,
//             'claimant_phone' => $user->phone,
//             'claimant_email' => $user->email,
//         ]);
    
//         $complaint->save();
    
//         // Store image paths in the "images" table
//         $this->storeImages($complaint, $paymentProofPaths);
    
//         return response()->json($complaint, 201);
//     }
    
//     private function storeImages(Complaint $complaint, array $paths)
//     {
//         foreach ($paths as $path) {
//             $complaint->images()->create(['path' => $path]);
//         }
//     }
    
    
    
    
    

//     public function show($id)
//     {
//         return Complaint::findOrFail($id);
//     }

//     public function update(Request $request, $id)
//     {
//         $complaint = Complaint::findOrFail($id);

//         $request->validate([
//             'ac_year' => 'required|string',
//             'ac_level' => 'required|string',
//             'mat' => 'required|string',

//             'field' => 'required|string',
//             'speciality' => 'required|string',
//             'exam_type' => 'required|string',
//             'complain_type' => 'required|string',
            
//             'ecue' => 'required|string',
//             'ecue_sub' => 'required|string',
//             'description' => 'required|string',
//         ]);

//         // Handle file updates if needed
//         // ...

//         $complaint->update([
//             'ac_year' => $request->input('ac_year'),
//             'ac_level' => $request->input('ac_level'),
//             'mat' => $request->input('mat'),

//             'field' => $request->input('field'),
//             'speciality' => $request->input('speciality'),
//             'exam_type' => $request->input('exam_type'),
//             'complain_type' => $request->input('complain_type'),
           
//             'ecue' => $request->input('ecue'),
//             'ecue_sub' => $request->input('ecue_sub'),
//             'description' => $request->input('description'),
//         ]);

//         return response()->json($complaint, 200);
//     }

//     public function destroy($id)
//     {
//         $complaint = Complaint::findOrFail($id);
//         $complaint->delete();
//         return response(null, 204);
//     }

//     // Handle file upload and return the file path
//     private function storeFile($file)
//     {
//         // Check if the file exists and is valid
//         if (!$file || !$file->isValid()) {
//             return null;
//         }

//         // Generate a unique file name
//         $fileName = uniqid() . '_' . $file->getClientOriginalName();

//         // Move the file to the 'public' storage directory
//         $file->move(public_path('storage'), $fileName);

//         // Return the file path
//         return 'storage/' . $fileName;
//     }
// }
