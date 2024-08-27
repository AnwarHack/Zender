<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DeliveryManOrder extends Model
{
    use HasFactory;

    protected $guarded = [];


    public function deliveryMan(){
        return $this->belongsTo(DeliveryMan::class,'delivery_men_id','id');
    }


    public function order(){
        return $this->belongsTo(Order::class,'order_id','id');
    }




}
