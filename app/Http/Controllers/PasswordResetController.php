<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Notifications\PasswordResetNotification;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Notification;
use App\Notifications\VerificationCodeNotification;

class PasswordResetController extends Controller
{
    /**
     * Request a password reset email with a verification code.
     *
     * @param  Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function requestReset(Request $request)
    {
        // Validate the request
        $request->validate([
            'email' => 'required|email',
        ]);
    
        // Find the user by email
        $user = User::where('email', $request->input('email'))->first();
    
        if (!$user) {
            return redirect('http://localhost/reset/not_found.html');
            // return response()->json(['message' => 'User not found'], 404);
        }
    
        // Generate a unique verification code
        $verificationCode = mt_rand(100000, 999999); // Generate a 6-digit verification code
    
        // Set an expiration time for the code
        $verificationCodeExpiry = now()->addMinutes(30); // Adjust the time as needed
    
        // Store the verification code and expiration time in the user's record
        $user->reset_code = $verificationCode;
        $user->reset_code_expiry = $verificationCodeExpiry;
        $user->save();
    
        // Send a notification email to the user with the verification code
        $user->notify(new PasswordResetNotification($verificationCode));
    
        // return response()->json(['message' => 'Verification code email sent']);
        return redirect('http://localhost/reset/send-verification-code.html');
    }
    
    

    /**
     * Verify the verification code.
     *
     * @param  Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function verifyverificationCode(Request $request)
    {
        // Validate the request
        $request->validate([
            'verification_code' => 'required'
       ] );

        // Find the user by the reset code
        $user = User::where('reset_code', $request->input('verification_code'))->first();

        if (!$user) {

            // return response()->json(['message' => 'Invalid or expired verification code'], 400);

            return redirect('http://localhost/reset/invalid_or_expire.html');
        }

        // Check if the reset code is not expired
        if ($user->reset_code_expiry >= now()) {
            // return response()->json(['message' => 'Verification code is valid'], 200);
            return redirect('http://localhost/reset/change-password.html'); // Redirigez vers la page de réinitialisation du mot de passe
        }

        // return response()->json(['message' => 'Invalid or expired verification code'], 400);
        return redirect('http://localhost/reset/invalid_or_expire.html');

    }

    /**
     * Reset the user's password after verification.
     *
     * @param  Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    
    public function resetPassword(Request $request)
    {
        // Validate the request
        $request->validate([
            'email' => 'required|email',
            'password' => 'required|min:8',
        ]);
    
        // Find the user by the email provided in the request
        $user = User::where('email', $request->input('email'))->first();
    
        if (!$user) {

            // return response()->json(['message' => 'User not found'], 404);
            return redirect('http://localhost/reset/not_found.html');

        }
    
        // Update the user's password and reset the reset_code and reset_code_expiry
        $user->update([
            'password' => Hash::make($request->input('password')),
            'reset_code' => null, // Reset the reset code
            'reset_code_expiry' => null, // Reset the reset code expiry
        ]);
    
        // return response()->json(['message' => 'Password reset successfully']);
        return redirect('http://localhost/reset/change_password_sucess.html');

    }
    
    
}