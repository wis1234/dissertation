<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class PasswordResetNotification extends Notification
{
    use Queueable;

    protected $verificationCode;

    public function __construct($verificationCode)
    {
        $this->verificationCode = $verificationCode;
    }

    public function via($notifiable)
    {
        return ['mail'];
    }

    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->line('You are receiving this email because we received a verification code request for your account.')
            ->line('Your verification code is: ' . $this->verificationCode)
            ->line('If you did not request this code, no further action is required.')
            ->line('Best Regards,')
            ->salutation('© ' . date('Y') . ' eGraC from LaTESC. All rights reserved.');
    }
}
