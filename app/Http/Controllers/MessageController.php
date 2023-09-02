<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Message;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;

class MessageController extends Controller
{
    // List all messages
    public function index()
    {
        $messages = Message::all();
        return response()->json(['data' => $messages]);
    }

    // Create a new message
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'sender_email' => 'required|email',
            'subject' => 'required',
            'message' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        // Check if the user exists based on the provided email
        $user = User::where('email', $request->input('sender_email'))->first();

        if (!$user) {

return response()->json(['message' => 'An error occurred. Please try again.'], 500);

        }

        // Create a new message using the user's data
        $message = new Message([
            'sender_firstname' => $user->firstname,
            'sender_lastname' => $user->lastname,
            'send_phone' => $user->phone,
            'sender_email' => $request->input('sender_email'),
            'subject' => $request->input('subject'),
            'message' => $request->input('message'),
        ]);

        $message->save();

        return response()->json(['message' => 'Message sent successfully'], 200);

    }

    // Show a specific message
    public function show($id)
    {
        $message = Message::find($id);

        if (!$message) {
            return response()->json(['error' => 'Message not found.'], 404);
        }

        return response()->json(['data' => $message]);
    }

    // Update a message
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'sender_email' => 'required|email',
            'subject' => 'required',
            'message' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        $message = Message::find($id);

        if (!$message) {
            return response()->json(['error' => 'Message not found.'], 404);
        }

        // Check if the user exists based on the provided email
        $user = User::where('email', $request->input('sender_email'))->first();

        if (!$user) {
            return response()->json(['error' => 'User not found.'], 404);
        }

        // Update the message using the user's data
        $message->sender_firstname = $user->firstname;
        $message->sender_lastname = $user->lastname;
        $message->send_phone = $user->phone;
        $message->sender_email = $request->input('sender_email');
        $message->subject = $request->input('subject');
        $message->message = $request->input('message');

        $message->save();

        return response()->json(['message' => 'Message updated successfully'], 200);
    }

    // Delete a message
    public function destroy($id)
    {
        $message = Message::find($id);

        if (!$message) {
            return response()->json(['error' => 'Message not found.'], 404);
        }

        $message->delete();

        return response()->json(['message' => 'Message deleted successfully'], 200);
    }
}
