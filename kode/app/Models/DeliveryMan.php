<?php

namespace App\Models;

use App\Enums\StatusEnum;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class DeliveryMan extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $guarded = [];


    protected $casts = [
        'kyc_data' => 'object',
        'address'  => 'object'
    ];


    public function scopeSearch($q)
    {
        return $q->when(request()->input('search'),function($q){
             $searchBy = '%'. request()->input('search').'%';
             return  $q->where('first_name','like',$searchBy)
                        ->orWhere('email',request()->input('search'))
                        ->orWhere('username',request()->input('search'))
                        ->orWhere('phone',request()->input('search'));
            });
    }


    // get updated by info
    public function scopeActive($q){
        return $q->where('status',(StatusEnum::true)->status());
    }


    public function country() {
        return $this->belongsTo(Country::class,'country_id','id');
    }


    public function orders() {
        return $this->hasMany(Order::class,'delivery_man_id','id');
    }


    public function ratings() {
        return $this->hasMany(DeliveryManRating::class,'delivery_men_id','id');
    }




    public function latestConversation(){
        return $this->hasOne(CustomerDeliverymanConversation::class,'deliveryman_id','id')
                                   ->latest();
    }




}
