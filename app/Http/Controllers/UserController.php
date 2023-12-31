<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Support\Facades\Hash;

use Illuminate\Support\Facades\Auth;

use Illuminate\Support\Facades\Redirect;

use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class UserController extends Controller
{
    public function index()
    {
        return User::all();
    }

    public function store(Request $request)
    {
        try {
            $validatedData = $request->validate([
                'firstname' => 'required|string',
                'lastname' => 'required|string',
                'email' => 'required|email|unique:users',
                'phone' => 'required|string',
                'mat_number' => 'required|string|unique:users',
                'google_id' => 'nullable|string',
                'phone_code' => 'nullable|string',
                'secret_key' => 'nullable|string',
                'password' => 'required|string|min:6',
            ]);

            $identifier = $this->generateIdentifier($validatedData['firstname'], $validatedData['lastname'], $validatedData['mat_number']);
            $validatedData['identifier'] = $identifier;

            $user = User::create($validatedData);

            // Redirect on successful registration
            return redirect('http://localhost/reset/index_redirect.html');
        } catch (\Exception $e) {
            // Handle the exception and redirect to error.html
            return redirect('http://localhost/reset/already_exists.html');
        }
    }

    private function generateIdentifier($firstname, $lastname, $mat_number)
    {
        $uniquePart = uniqid();
        return $firstname . '|-_-|' . $uniquePart . '@ADR0@' . $lastname . '|_-_|' . $mat_number;
    }

    public function show($mat_number)
    {
        $user = User::where('mat_number', $mat_number)->first();
        if ($user) {
            return response()->json(['message' => 'User retrieved successfully', 'user' => $user]);
        } else {
            return response()->json(['error' => 'User not found'], 404);
        }
    }

    public function update(Request $request, $mat_number)
    {
        $user = User::where('mat_number', $mat_number)->first();

        if ($user) {
            $validatedData = $request->validate([
                'firstname' => 'required|string',
                'lastname' => 'required|string',
                'email' => [
                    'required',
                    'email',
                    Rule::unique('users')->ignore($user->id),
                ],
                'phone' => 'required|string',
                'mat_number' => [
                    'required',
                    'string',
                    Rule::unique('users')->ignore($user->id),
                ],
                'identifier' => [
                    'required',
                    'string',
                    Rule::unique('users')->ignore($user->id),
                ],
                'google_id' => 'nullable|string',
                'phone_code' => 'nullable|string',
                'secret_key' => 'nullable|string',
                'password' => 'sometimes|string|min:6',
            ]);

            $user->update($validatedData);

            return response()->json(['message' => 'User updated successfully', 'user' => $user]);
        } else {
            return response()->json(['error' => 'User not found'], 404);
        }
    }

    public function destroy($mat_number)
    {
        $user = User::where('mat_number', $mat_number)->first();

        if ($user) {
            $firstname = $user->firstname;
            $lastname = $user->lastname;
            $user->delete();

            $message = "You've just deleted $firstname $lastname successfully";
            return response()->json(['message' => $message], 204);
        } else {
            return response()->json(['error' => 'User not found'], 404);
        }
    }


    // public function login(Request $request)
    // {
    //     $credentials = $request->only('email', 'password');
    
    //     if (Auth::attempt($credentials)) {
    //         // Authentication was successful, redirect to a specific route
    //         return redirect('http://localhost/reset/index_redirect.html');
    //     } else {
    //         $message = "Invalid credentials";
    //         // Authentication failed, redirect back with an error message
    //         return redirect('http://localhost/reset/invalid_credential.html');
    //     }
    // }


    /**
     * Handle an authentication attempt.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        // Validate the user's login input
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            $user = auth()->user();
            
            // Create a new Sanctum token with an expiration time
            $token = $request->user()->createToken('api-token', ['read']);
            
            // Set the token to expire after a certain time (e.g., 30 minutes)
            $token->plainTextToken;
            
            return response()->json([
                'user' => $user,
                'access_token' => $token->plainTextToken,
            ]);
        } else {
            // Authentication failed, return an error response
            return response()->json(['message' => 'Invalid credentials'], 401);
        }
    }
    
    

    public function logout(Request $request)
    {
        Auth::logout();
        return Redirect::to('http://localhost/reset/index.html');
    }
}

