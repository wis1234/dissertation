<?php

namespace App\Http\Controllers;

use Kkiapay\Kkiapay;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    protected $kkiapay;

    public function __construct()
    {
        // Initialisez KiKiaPay avec vos clés d'API
        $publicKey = 'votre_cle_publique';
        $privateKey = 'votre_cle_privee';
        $secret = 'votre_secret';
        $sandbox = true; // Mettez à false pour la production

        $this->kkiapay = new Kkiapay($publicKey, $privateKey, $secret, $sandbox);
    }

    public function verifyTransaction($transactionId)
    {
        // Demande de vérification de la transaction
        $response = $this->kkiapay->verifyTransaction($transactionId);

        return response()->json($response);
    }

    public function refundTransaction($transactionId)
    {
        // Demande de remboursement de la transaction
        $response = $this->kkiapay->refundTransaction($transactionId);

        return response()->json($response);
    }

    public function setupPayout(Request $request)
    {
        // Obtenez les paramètres de la requête et appelez setupPayout
        $payoutData = $request->all();
        $response = $this->kkiapay->setupPayout($payoutData);

        return response()->json($response);
    }
}
