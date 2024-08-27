<?php

namespace App\Http\Resources\Deliveryman;

use App\Enums\StatusEnum;
use App\Models\Order;
use App\Models\SupportTicket;
use Illuminate\Http\Resources\Json\JsonResource;

class ConfigResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {


        $onboarding_data =  [];
        if(site_settings('deliveryman_app_settings')){
             $pages =  json_decode(site_settings('deliveryman_app_settings'),true);
             foreach($pages  as $key=>$data){
                $data['image']           = show_image(file_path()['onboarding_image']['path'].'/'.$data['image']);
                $onboarding_data[$key]   = $data;
             }
    
        }

        return [

            'map_api_key'            => site_settings('gmap_client_key'),
            'delevary_status'        => Order::delevaryStatus(),
            'ticket_priority'        => SupportTicket::priority(),

            "currency_position_is_left" => site_settings('currency_position',StatusEnum::true->status()) 
                                                    == StatusEnum::true->status()
                                                    ? true : false,

            'onboarding_pages'    => site_settings('app_settings') ? array_values($onboarding_data)  : (object)[],
        ];
    }
}
