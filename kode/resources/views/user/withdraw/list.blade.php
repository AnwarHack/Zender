@extends('frontend.layouts.app')

@push('stylepush')

  <style>
        .method-card{
            border: 0.1rem solid var(--gray-5) !important;
        }
        .search-input{
            padding-block: 6px;
            border-radius: 4px;
        }
  </style>

@endpush

@section('content')
   @php
     $promo_banner = frontend_section('promotional-offer');
   @endphp

<div class="breadcrumb-banner">
    <div class="breadcrumb-banner-img">
        <img src="{{show_image(file_path()['frontend']['path'].'/'.@frontend_section_data($breadcrumb->value,'image'),@frontend_section_data($breadcrumb->value,'image','size'))}}" alt="breadcrumb.jpg">
    </div>
    <div class="page-Breadcrumb">
        <div class="Container">
            <div class="breadcrumb-container">
                <h1 class="breadcrumb-title">{{($title)}}</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="{{url('/')}}">
                            {{translate('home')}}
                        </a></li>

                        <li class="breadcrumb-item active" aria-current="page">
                            {{translate($title)}}
                        </li>

                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>

<section class="pb-80">
    <div class="Container">
        <div class="row g-4">
            @include('user.partials.dashboard_sidebar')

            <div class="col-xl-9 col-lg-8">
                <div class="profile-user-right">
                    <a href="{{@frontend_section_data($promo_banner->value,'image','url')}}" class="d-block">
                        <img class="w-100" src="{{show_image(file_path()['frontend']['path'].'/'.@frontend_section_data($promo_banner->value,'image'),@frontend_section_data($promo_banner->value,'image','size'))}}" alt="banner.jpg">
                    </a>

                    <div class="mt-5" >
                    
     

                        <div class="card mt-5">
                            <div class="card-header">
                                <div class="d-flex align-items-start align-items-sm-center justify-content-between flex-sm-row flex-column gap-4">
                                    <div class="d-flex align-items-center gap-3">
                                        <h4 class="card-title">
                                            {{translate("Withdraw List")}}
                                        </h4>
                                    </div>

                                    <div class="d-flex align-items-center gap-3">
                                     
                                        <form id="filter-order" action="{{route(Route::currentRouteName(),Route::current()->parameters())}}" method="get">
                                         

                                             <div class="d-flex align-items-center gap-3">
                                                <input value="{{request()->input('search')}}" placeholder="{{translate('Search by TRX CODE')}}" class="form-control search-input" type="text" name="search" id="search">

                                                <input placeholder="{{translate('Search by date')}}"  value="{{request()->input('date')}}" class="form-control search-input" type="text" name="date" id="datePicker">

                                                 <button class="btn btn-lg btn-dark">
                                                    {{translate("Search")}}
                                                 </button>
                                                 <a href="{{ route(Route::currentRouteName(),Route::current()->parameters()) }}"  class="btn btn-lg btn-danger">
                                                    {{translate("Reset")}}
                                                 </a>
                                             </div>
                                         
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <div class="card-body">
                                <div class="table-responsive table-responsive-sm">
                                    <table class="table table-nowrap align-middle mt-0">
                                        <thead class="table-light">
                                            <tr class="text-muted fs-14">
                                              

                                                <th>{{translate('Time')}}</th>
                                                <th>{{translate('Transaction Number')}}</th>
                                                <th>{{translate('Method')}}</th>
                                                <th>{{translate('Amount')}}</th>
                                                <th>{{translate('Charge')}}</th>
                                                <th>{{translate('Receivable')}}</th>
                                                <th>{{translate('Status')}}</th>
                                                <th>{{translate('Actions')}}</th>
                                            </tr>
                                        </thead>

                                        <tbody class="border-bottom-0">
                                            @forelse($withdraws as $withdraw)
                                            <tr>
                                                <td data-label="{{translate('Time')}}">
                                                    <span class="fw-bold">{{diff_for_humans($withdraw->created_at)}}</span><br>
                                                    {{get_date_time($withdraw->created_at)}}
                                                </td>
            
                                                <td data-label="{{translate('Method')}}">
                                                    <span class="fw-bold">{{(@$withdraw->trx_number)}}</span>
                                                </td>
                                                <td data-label="{{translate('Method')}}">
                                                    <span class="fw-bold">{{(@$withdraw->method ? $withdraw->method->name :"N/A")}}</span>
                                                </td>
            
                                                <td data-label="{{translate('Amount')}}">
                                                    <span class="text-primary fw-bold">{{(show_amount($withdraw->amount,default_currency()->symbol))}} </span>
                                                </td>
            
                                                <td data-label="{{translate('Charge')}}">
                                                    <span class="text-danger fw-bold">{{(show_amount($withdraw->charge,default_currency()->symbol))}} </span>
                                                </td>
            
                                                <td data-label="{{translate('Receivable')}}">
                                                    <span class="fw-bold text-success">
                                                        {{show_amount($withdraw->final_amount ,@$withdraw->currency->symbol)}}
                                                    </span>
                                                </td>
            
                                                <td data-label="{{translate('Status')}}">
                                                    @if($withdraw->status == 1)
                                                        <span class="badge badge-soft-success">{{translate('Received')}}</span>
                                                    @elseif($withdraw->status == 2)
                                                        <span class="badge badge-soft-primary">{{translate('Pending')}}</span>
                                                    @elseif($withdraw->status == 3)
                                                        <span class="badge badge-soft-danger">{{translate('Rejected')}}</span>
                                                     
                                                    @endif
                                                </td>

                                                <td data-label="{{translate('Action')}}">
                                                    <a href="{{route('user.withdraw.show',$withdraw->id)}}" class="badge badge-soft-info fs-12 pointer"><i class="fa-regular fa-eye"></i></a>
                                                </td>
                                            </tr>
                                            @empty
                                                <tr>
                                                    <td class="text-center text-muted py-5" colspan="8">{{translate('No Data Found')}}</td>
                                                </tr>
                                            @endforelse
                                        </tbody>
                                    </table>
                                </div>
                                <div class="mt-4 d-flex align-items-center justify-content-end">
                                        {{$withdraws->withQueryString()->links()}}
                                </div>
                            </div>
                        </div>

                    </div>

                   
                </div>
            </div>
        </div>
    </div>
</section>

@endsection


@push('scriptpush')
    <script>
        (function($){
            "use strict";
            flatpickr("#datePicker", {
                dateFormat: "Y-m-d",
                mode: "range",
            });
        })(jQuery);
    </script>
@endpush
