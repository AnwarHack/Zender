<?php

namespace App\Models;

use App\Enums\RewardPointStatus;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


use Illuminate\Database\Eloquent\Builder;


class RewardPointLog extends Model
{
    use HasFactory;

    protected $guarded = [];


    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id');
    }


    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }



     /**
     * Date Filter
     *
     * @param Builder $query
     * @param string $column
     * @return Builder
     */
    public function scopeDate(Builder $query, string $column = 'created_at') : Builder {

        if (!request()->date) {
            return $query;
        }
        $dateRangeString             = request()->date;
        $start_date                  = $dateRangeString;
        $end_date                    = $dateRangeString;
        if (strpos($dateRangeString, ' to ') !== false) {
            list($start_date, $end_date) = explode(" to ", $dateRangeString);
        }

        return $query->where(function ($query) use ($start_date, $end_date ,$column ) {
                        $query->whereBetween($column , [$start_date, $end_date])
                            ->orWhereDate($column , $start_date)
                            ->orWhereDate($column , $end_date);
        });

    }



    
    public function scopeFilter($q)
    {
        return $q->when(request()->input('status'),function($q){
                return $q->where('status',request()->input('status'));
            });
    }


    
    public function scopePending($q)
    {
        return  $q->where('status',RewardPointStatus::PENDING->value);
    }

    public function scopeRedeemed($q)
    {
        return  $q->where('status',RewardPointStatus::REDEEMED->value);
    }


    public function scopeExpired($q)
    {
        return  $q->where('status',RewardPointStatus::EXPIRED->value);
    }



    

}
