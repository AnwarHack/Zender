<?php

namespace App\Http\Resources\Deliveryman;

use App\Enums\StatusEnum;
use App\Http\Resources\DeliverymanConversationResource;
use App\Http\Resources\DeliveryManRatingCollection;
use Illuminate\Http\Resources\Json\JsonResource;

class DeliveryManResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {

        $kycData =  collect($this->kyc_data)->map(function(object $data , string $key): object{
                        if($data->file) $data->file = show_image(file_path()['delivery_man_kyc']['path'] ."/".$data->file);
                        return $data;
                    });

        $data = [
            
            'id'                => $this->id,
            "fcm_token"         => $this->fcm_token,
            'first_name'        => $this->first_name,
            'last_name'         => $this->last_name,
            'email'             => $this->email,
            'username'          => $this->username ,
            'phone'             => $this->phone,
            'phone_code'        => $this->phone_code,
            'country_id'        => $this->country_id,
            'balance'           => (double)api_short_amount($this->balance),
            'order_balance'           => (double)api_short_amount($this->order_balance),
            'is_banned'         => $this->status == StatusEnum::false->status() ? true : false,
            'image'             => show_image(file_path()['profile']['delivery_man']['path']."/".$this->image,file_path()['profile']['delivery_man']['size']),  
            'address'             => $this->address,
            'kyc_data'            => $kycData,

        ];

        
        if($this->relationLoaded('latestConversation') && @$this->latestConversation ){
            $data['latest_conversation'] = new DeliverymanConversationResource(@$this->latestConversation);
        }


        if($this->relationLoaded('ratings') && @$this->ratings ){
            $data['reviews'] = new DeliveryManRatingCollection(@$this->ratings()->paginate(paginate_number()));
            $data['avg_ratings'] = @$this->ratings->avg('rating')?? 0;
        }
        return $data;
    }
}
