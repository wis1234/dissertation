<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\TeacherController;
use App\Http\Controllers\ComplaintController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\MessageController;
use App\Http\Controllers\PasswordResetController;
use App\Http\Controllers\TranscriptController;
use App\Http\Controllers\CertificateController;
use App\Http\Controllers\DiplomaController;





/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});



Route::middleware('auth:sanctum')->group(function () {
    // Route::get('/users', [UserController::class, 'index']);

});
Route::middleware('auth:web')->group(function () {
    // Protected routes that require authentication
    Route::get('/users', [UserController::class, 'index']);
    // Add more authenticated routes here
});

//users routing
// Route::get('/users', [UserController::class, 'index']);
// Route::post('/users', [UserController::class, 'store']);
Route::get('/users/{mat_number}', [UserController::class, 'show']);
Route::put('/users/{mat_number}', [UserController::class, 'update']);
Route::delete('/users/{mat_number}', [UserController::class, 'destroy']);
//students routing

Route::get('/students', [StudentController::class, 'index']);
Route::post('/students', [StudentController::class, 'store']);
Route::get('/students/{id}', [StudentController::class, 'show']);
Route::put('/students/{id}', [StudentController::class, 'update']);
Route::delete('/students/{id}', [StudentController::class, 'destroy']);
// teachers routing
Route::get('/teachers', [TeacherController::class, 'index']);
Route::post('/teachers', [TeacherController::class, 'store']);
Route::get('/teachers/{id}', [TeacherController::class, 'show']);
Route::put('/teachers/{id}', [TeacherController::class, 'update']);
Route::delete('/teachers/{id}', [TeacherController::class, 'destroy']);
//complaints routing
Route::get('/complaints', [ComplaintController::class, 'index']);
Route::post('/complaints', [ComplaintController::class, 'store']);
Route::get('/complaints/{id}', [ComplaintController::class, 'show']);
Route::put('/complaints/{id}', [ComplaintController::class, 'update']);
Route::delete('/complaints/{id}', [ComplaintController::class, 'destroy']);

//Payment routing

Route::get('/paiement/verify/{transactionId}', [PaymentController::class, 'verifyTransaction']);
Route::post('/paiement/refund/{transactionId}', [PaymentController::class, 'refundTransaction']);
Route::post('/paiement/setup-payout', [PaymentController::class, 'setupPayout']);

//login and logout routing

// User login
Route::post('/login', [UserController::class, 'login']);

// User logout
Route::post('/logout', [UserController::class, 'logout']);



// Message routing
Route::get('/messages', [MessageController::class, 'index']);
Route::post('/messages', [MessageController::class, 'store']);
Route::get('/messages/{id}', [MessageController::class, 'show']);
Route::put('/messages/{id}', [MessageController::class, 'update']);
Route::delete('/messages/{id}', [MessageController::class, 'destroy']);

//transcript routing
Route::group(['prefix' => 'transcripts'], function () {
    Route::get('/', [TranscriptController::class, 'index']);
    Route::post('/', [TranscriptController::class, 'store']);

    Route::get('{transcript}', [TranscriptController::class, 'show']);
    Route::delete('{transcript}', [TranscriptController::class, 'destroy']);
    Route::put('{transcript}', [TranscriptController::class, 'update']);
});

//certifcate routing
Route::get('/certificates', [CertificateController::class, 'index']);
Route::post('/certificates', [CertificateController::class, 'store']);
Route::get('/certificates/{certificate}', [CertificateController::class, 'show']);
Route::put('/certificates/{certificate}', [CertificateController::class, 'update']);
Route::delete('/certificates/{certificate}', [CertificateController::class, 'destroy']);

// Diploma routing
Route::group(['prefix' => 'diplomas'], function () {
    Route::get('/', [DiplomaController::class, 'index']);
    Route::post('/', [DiplomaController::class, 'store']);

    Route::get('{diploma}', [DiplomaController::class, 'show']);
    Route::delete('{diploma}', [DiplomaController::class, 'destroy']);
    Route::put('{diploma}', [DiplomaController::class, 'update']);
});


//Passwor reset routing
// Request a password reset email
Route::post('password/reset/request', [PasswordResetController::class, 'requestReset']);

// Verify the reset token
Route::post('password/reset/verify', [PasswordResetController::class, 'verifyverificationcode']);

// Reset the password
Route::post('password/reset', [PasswordResetController::class, 'resetPassword']);

