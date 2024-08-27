<?php

namespace App\Http\Services\Deliveryman;

use App\Enums\Settings\TokenKey;
use App\Http\Controllers\Controller;
use App\Models\DeliveryMan;


class AuthService extends Controller
{


  
    /**
     * Get deliveryman via phone
     *
     * @param string|integer $phoneCode
     * @param string|integer $phone
     * @return DeliveryMan|null
     */
    public function getActiveDeliverymanByPhone(string|int $phoneCode , string|int $phone) :  ?DeliveryMan{
        return DeliveryMan::active()
                 ->where('phone',$phone)
                 ->where('phone_code',$phoneCode)
                 ->first();
    }


    /**
     * Create access token
     *
     * @param DeliveryMan $seller
     * @return string
     */
    public function getAccessToken(DeliveryMan $deliveryMan) : string {

        return  $deliveryMan->createToken(TokenKey::DELIVERY_MAN_AUTH_TOKEN->value,['role:'.TokenKey::DELIVERY_MAN_TOKEN_ABILITIES->value])
                         ->plainTextToken;
    }

}