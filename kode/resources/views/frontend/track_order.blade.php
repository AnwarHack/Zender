@extends('frontend.layouts.app')
@push('stylepush')
    <style>
        .fs-30{
            font-size: 30px;
        }
        .text--primary{
            color: var(--primary)
        }
        .profile-image {
            width: 40px;
            height: 40px;
            overflow: hidden;
            border-radius: 50%;
        }

        .profile-img {
            width: 100%;
            height: auto;
        }

        .title {
            font-weight: bold;
            font-size: 13px
        }
    </style>
@endpush
@section('content')
    <section class="pt-80 pb-80">
        <div class="Container">
            <div class="tracking-container">
                <p class="fs-5">
                    {{ translate("To track your order please enter your Order ID in the box below and press the “Track Button”. This was given to you on your receipt and in the confirmation email you should have received") }}
                </p>

                <form class="tracking-form">
                    <div class="tracking-id">
                        <label for="trackingId" class="form-label">
                            {{ translate('TRACKING ID ') }}
                            <span class="text-danger">*</span>
                        </label>
                        <input type="text" name="order_number" id="trackingId" value="{{ $orderNumber ?? null }}"
                            placeholder="Enter order ID" class="form-control" />
                    </div>
                    <div class="tracking-id">
                        <label for="email" class="form-label">
                            {{ translate('BILLING EMAIL') }}
                        </label>
                        <input type="email" name="email" id="email" class="form-control"
                            placeholder="{{ translate('Email you using during checkout') }}" />
                    </div>
                    <button class="tracking-submit-btn">
                        {{ translate('Track Now') }}
                    </button>
                </form>

                @if ($order)
                    <div class="row g-4">
                        <div class="col-xl-9 col-lg-8">
                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div class="d-flex align-items-center gap-3">
                                            <h4 class="card-title">
                                                {{ translate('Tracking order lists') }}
                                            </h4>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <div class="tracking-tabs-content">
                                        <div class="tracking-product">
                                            <div class="order-processing">
                                                <div class="tracking-wrapper">
                                                    <div class="empty-bar"></div>
                                                    <div
                                                        class="color-bar @if (@$order->status == 2) order-confirm
                                                @elseif(@$order->status == 3)
                                                     courier
                                                @elseif(@$order->status == 4)
                                                     way
                                                @elseif(@$order->status == 5)
                                                    pickup @endif ">
                                                    </div>
                                                    <ul>
                                                        <li class="order-status">
                                                            <div class="el"><i class="fa-solid fa-circle-check"></i>
                                                            </div>
                                                            <p class="order-status-text">
                                                                {{ translate('Order Confirm') }}
                                                                <span></span>
                                                            </p>
                                                        </li>
                                                        <li class="order-status">
                                                            <div class="el"><i class="fa-solid fa-box"></i></div>
                                                            <p class="order-status-text">
                                                                {{ translate('Picked by courier') }}
                                                                <span></span>
                                                            </p>
                                                        </li>
                                                        <li class="order-status">
                                                            <div class="el"><i class="fa-solid fa-truck-fast"></i></div>
                                                            <p class="order-status-text">
                                                                {{ translate('On The Way') }}
                                                                <span></span>
                                                            </p>
                                                        </li>
                                                        <li class="order-status">
                                                            <div class="el">
                                                                <i class="fa-solid fa-check"></i>
                                                            </div>
                                                            <p class="order-status-text">
                                                                {{ translate('Delivered') }}
                                                                <span></span>
                                                            </p>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="tracking-order-info">
                                                <p class="order-id">
                                                    {{ translate('Order ID') }}
                                                    : <span>#{{ @$order->order_id }}</span></p>
                                                <div class="tracking-order-status">
                                                    <div class="tracking-order-status-item">
                                                        <p> {{ translate('Order date') }} :</p>
                                                        <span>{{ get_date_time(@$order->created_at, 'd M Y') }}</span>
                                                    </div>
                                                    <div class="tracking-order-status-item">
                                                        <p>{{ translate('Shipping by') }} :</p>
                                                        <span>{{ $order->shipping_deliverie_id != null ? $order->shipping?->name : 'N/A' }}</span>


                                                        @if ($order->shipping)
                                                            <div>
                                                                {{ translate('Delivery In') }} :
                                                                {{ $order->shipping->duration }} {{ translate('Days') }}
                                                            </div>
                                                        @endif
                                                    </div>



                                                    <div class="tracking-order-status-item">
                                                        <p> {{ translate('Status') }} :</p>
                                                        @if (@$order->status == 1)
                                                            <span>{{ translate('Order Placed') }}</span>
                                                        @elseif(@$order->status == 2)
                                                            <span>{{ translate('Order Confirm') }}</span>
                                                        @elseif(@$order->status == 3)
                                                            <span>{{ translate('Picked by courier') }}</span>
                                                        @elseif(@$order->status == 4)
                                                            <span>{{ translate('On The Way') }}</span>
                                                        @elseif(@$order->status == 5)
                                                            <span>{{ translate('Delivered') }}</span>
                                                        @elseif($order->status == 6)
                                                            <span>{{ translate('Order Cancel') }}</span>
                                                        @endif
                                                    </div>
                                                </div>

                                                @php
                                                    $subTotal = 0;
                                                    $originalPrice = 0;
                                                    $discount = 0;
                                                    $tax = 0;
                                                    $totalAmount = 0;

                                                @endphp

                                                @if ($order->OrderDetails->isNotEmpty())
                                                    <div class="table-responsive">
                                                        <table class="table table-nowrap align-middle mt-0">
                                                            <thead class="table-light">
                                                                <tr class="text-muted fs-14">
                                                                    <th scope="col">
                                                                        {{ translate('Product') }}
                                                                    </th>

                                                                    <th scope="col" class="text-center">
                                                                        {{ translate('Original Price') }}
                                                                    </th>

                                                                    <th scope="col" class="text-center">
                                                                        {{ translate('Tax amount') }}
                                                                    </th>
                                                                    <th scope="col" class="text-center">
                                                                        {{ translate('Discount') }}
                                                                    </th>

                                                                    <th scope="col" class="text-center">
                                                                        {{ translate('Total Price') }}
                                                                    </th>

                                                                    <th scope="col" class="text-center">
                                                                        {{ translate('Status') }}
                                                                    </th>

                                                                
                                                                    
                                                                    <th scope="col" class="text-end">
                                                                        {{ translate('Chat') }}
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>


                                                                @foreach ($order->OrderDetails as $orderDetail)
                                                                    @if (@$orderDetail->product)
                                                                        <tr class="tr-item fs-14">
                                                                            <td>
                                                                                <div class="order-item">
                                                                                    <div class="order-item-img">
                                                                                        <img src="{{ show_image(file_path()['product']['featured']['path'] . '/' . @$orderDetail->product->featured_image, file_path()['product']['featured']['size']) }}"
                                                                                            alt="{{ @$orderDetail->product->featured_image }}" />
                                                                                    </div>
                                                                                    <div class="order-item-content">
                                                                                        <div class="order-product-details">
                                                                                            <h5>
                                                                                                <a
                                                                                                    href="{{ route('product.details', [ $orderDetail->product->slug ? $orderDetail->product->slug : make_slug($orderDetail->product->name), $orderDetail->product->id]) }}">
                                                                                                    {{ $orderDetail->product->name }}
                                                                                                </a>

                                                                                            </h5>

                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                           
                                                                            </td>
                                                                         

                                                                            <td class="text-center">
                                                                                <span>{{ short_amount($orderDetail->original_price) }}</span>
                                                                            </td>
                                                                            <td class="text-center">
                                                                                <span>{{ short_amount($orderDetail->total_taxes) }}</span>
                                                                            </td>

                                                                            <td class="text-center">
                                                                                <span>{{ short_amount($orderDetail->discount) }}</span>
                                                                            </td>

                                                                            <td class="text-center">
                                                                                <span>{{ short_amount($orderDetail->total_price) }}</span>
                                                                            </td>

                                                                            <td class="text-center">
                                                                                @php echo order_status_badge($orderDetail->status)  @endphp
                                                                            </td>

                                                
                                                                            <td class="text-end">
                                                                                @php
                                                                                   $seller = $orderDetail->product ? $orderDetail->product->seller : null;
                                                                                @endphp
                                                                                @if($seller)
                                                                                    <a  title="{{ translate('Chat with seller') }}"
                                                                                    data-bs-toggle="tooltip" data-bs-placement="top" href="{{route('user.seller.chat.list' , ['seller_id' => @$seller->id])}}"
                                                                                         class="chat-btn"><i class="fa-brands fa-rocketchat"></i>
                                                                                    </a>
                                                                                @else
                                                                                 {{translate("N/A")}}
                                                                                @endif
                                                                            </td>
                                                                        </tr>
                                                                        @php
                                                                            $originalPrice +=
                                                                                $orderDetail->original_price;
                                                                            $tax += $orderDetail->total_taxes;
                                                                            $discount += $orderDetail->discount;
                                                                            $totalAmount += $orderDetail->total_price;
                                                                        @endphp
                                                                    @endif
                                                                @endforeach

                                                            </tbody>
                                                        </table>

                                                        <li
                                                            class="d-flex align-items-center justify-content-between gap-4 subtotal">
                                                            <span class="fw-semibold ps-4 py-4  fs-14 nowrap">
                                                                {{ translate('Sub Total') }}:</span>
                                                            <span class="fw-semibold text-end pe-4 py-3  fs-14 nowrap"
                                                                id="subtotalamount">
                                                                {{ short_amount($originalPrice) }}
                                                            </span>
                                                        </li>

                                                        <li
                                                            class="d-flex align-items-center justify-content-between gap-4 subtotal">
                                                            <span class="fw-semibold ps-4 py-4  fs-14 nowrap">
                                                                {{ translate('All Taxes') }}:</span>
                                                            <span class="fw-semibold text-end pe-4 py-3  fs-14 nowrap">
                                                                {{ short_amount($tax) }}</span>
                                                        </li>

                                                        <li
                                                            class="d-flex align-items-center justify-content-between gap-4 subtotal">
                                                            <span class="fw-semibold ps-4 py-4  fs-14 nowrap">
                                                                {{ translate('Total Discount') }}:</span>
                                                            <span class="fw-semibold text-end pe-4 py-3  fs-14 nowrap">
                                                                {{ short_amount($order->discount) }}</span>
                                                        </li>

                                                        <li
                                                            class="d-flex align-items-center justify-content-between gap-4 subtotal">
                                                            <span class="fw-semibold ps-4 py-4  fs-14 nowrap">
                                                                {{ translate('Shpping charge') }}:</span>
                                                            <span class="fw-semibold text-end pe-4 py-3  fs-14 nowrap">
                                                                {{ short_amount($order->shipping_charge) }}</span>
                                                        </li>

                                                        <li
                                                            class="table-active d-flex align-items-center justify-content-between gap-4">
                                                            <h6 class="ps-4 py-3 nowrap fs-14 fw-bold">
                                                                {{ translate('Total') }} :</h6>
                                                            <span class="text-end pe-4 py-3 nowrap fs-14">
                                                                <span id="totalamount" class="fw-bold">

                                                                    {{ short_amount($order->amount) }}
                                                                </span>
                                                            </span>
                                                        </li>

                                                    </div>
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-3 col-lg-4">

                   

                            <div class="card mb-4">
                                <div class="card-header">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div class="d-flex align-items-center gap-3">
                                            <h4 class="card-title fs-16">
                                                {{ translate('Billing Info') }}
                                            </h4>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-body">

                                    @php
                                        $user = auth_user('web');
                                    @endphp
                                    <div class="d-flex align-items-start flex-column gap-4 billing-list ">

                                        @if (@$order->billingAddress)
                                            <span class="fs-14 d-flex align-items-center gap-3"> <small
                                                    class="text-muted fs-14">{{ translate('Address name') }}:</small>
                                                {{ @$order->billingAddress->name }}</span>
                                            <span class="fs-14 d-flex align-items-center gap-3"> <small
                                                    class="text-muted fs-14">{{ translate('First Name') }}:</small>
                                                {{ @$order->billingAddress->first_name }}</span>

                                            <span class="fs-14 d-flex align-items-center gap-3"> <small
                                                    class="text-muted fs-14">{{ translate('Last name') }}:</small>
                                                {{ @$order->billingAddress->last_name }}</span>
                                            <span class="fs-14 d-flex align-items-center gap-3"> <small
                                                    class="text-muted fs-14">{{ translate('Phone') }}:</small>
                                                {{ @$order->billingAddress->phone }}</span>

                                            <span class="fs-14 d-flex align-items-center gap-3"> <small
                                                    class="text-muted fs-14">{{ translate('Address') }}:</small>
                                                {{ @$order->billingAddress->address->address }}</span>

                                            <span class="fs-14 d-flex align-items-center gap-3"> <small
                                                    class="text-muted fs-14">{{ translate('Zip') }}:</small>
                                                {{ @$order->billingAddress->zip }}</span>
                                            <span class="fs-14 d-flex align-items-center gap-3"> <small
                                                    class="text-muted fs-14">{{ translate('Country') }}:</small>
                                                {{ @$order->billingAddress->country->name }}</span>
                                            <span class="fs-14 d-flex align-items-center gap-3"> <small
                                                    class="text-muted fs-14">{{ translate('State') }}:</small>
                                                {{ @$order->billingAddress->state->name }}</span>
                                            <span class="fs-14 d-flex align-items-center gap-3"> <small
                                                    class="text-muted fs-14">{{ translate('City') }}:</small>
                                                {{ @$order->billingAddress->city->name }}</span>
                                        @endif

                                        @if (@$order->billing_information)
                                            @foreach (@$order->billing_information as $key => $address)
                                                <span class="fs-14 d-flex align-items-center gap-3"> <small
                                                        class="text-muted fs-14">{{ k2t($key) }}:</small>
                                                    {{ $address }}</span>
                                            @endforeach
                                        @endif

                                    </div>
                                </div>
                            </div>


                            @if($order->custom_information)

                                <div class="card mb-4">
                                    <div class="card-header">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div class="d-flex align-items-center gap-3">
                                                <h4 class="card-title fs-16">
                                                    {{ translate('Custom Info') }}
                                                </h4>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card-body">

                            
                                        <div class="d-flex align-items-start flex-column gap-4 billing-list ">

                                            @if (@$order->custom_information)
                                                @foreach (@$order->custom_information as $key => $address)
                                                    <span class="fs-14 d-flex align-items-center gap-3"> <small
                                                            class="text-muted fs-14">{{ k2t($key) }}:</small>
                                                        {{ $address }}</span>
                                                @endforeach
                                            @endif

                                        </div>
                                    </div>
                                </div>

                            @endif

                            <div class="card">
                                <div class="card-header">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div class="d-flex align-items-center gap-3">
                                            <h4 class="card-title fs-16">
                                                {{ translate('Order Info') }}
                                            </h4>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-body ">
                                    <div class="d-flex align-items-start flex-column gap-4 billing-list">
                                        <span class="fs-14 d-flex align-items-center gap-3"> <small
                                                class="text-muted fs-14">
                                                {{ translate('Order number') }} :</small> {{ @$order->order_id }}</span>
                                        <span class="fs-14 d-flex align-items-center gap-3"> <small
                                                class="text-muted fs-14">
                                                {{ translate('Payment Method') }} :</small>

                                            @if($order->wallet_payment == App\Models\Order::WALLET_PAYMENT)
                                                
                                                {{ translate('Payment VIA Wallet')}}

                                            @else
                                                @if ($order->payment_type == '2')
                                                    {{ @$order->paymentMethod ? $order->paymentMethod->name : 'N/A' }}
                                                @else
                                                    {{ translate('Cash On Delivary') }}
                                                @endif
                                            @endif
                                                
                                        </span>

                                        <span class="fs-14 d-flex align-items-center gap-3"> <small
                                                class="text-muted fs-14">
                                                {{ translate('Total Amount') }} :</small>
                                            {{ short_amount($order->amount) }}
                                        </span>

                                        <span class="fs-14 d-flex align-items-center gap-3"> <small
                                                class="text-muted fs-14">
                                                {{ translate('Payment Status') }} :</small>
                                            @if ($order->payment_status == '1')
                                                {{ translate('Unpaid') }}
                                            @else
                                                {{ translate('Paid') }}
                                            @endif
                                        </span>
                                        <span class="fs-14 d-flex align-items-center gap-3"> <small
                                                class="text-muted fs-14">
                                                {{ translate('Order Status') }} :</small>

                                                @php echo order_status_badge($order->status)  @endphp
                                        </span>

                                        <span class="fs-14 d-flex align-items-center gap-3"> <small
                                            class="text-muted fs-14">
                                            {{ translate('Date') }} :</small>

                                            {{
                                                diff_for_humans($order->created_at)
                                            }}
                                        </span>


                                    </div>
                                </div>
                            </div>


                            @if($order->order_type == App\Models\Order::DIGITAL)

                              
                             
                               @php
                                   
                                   $order = $order->load(['digitalProductOrder']);
                                   $orderDetail = $order->digitalProductOrder->load(['digitalProductAttributeValue','digitalProductAttributeValue.digitalProductAttributeValueKey']);

                                   $attribute = $orderDetail?->digitalProductAttributeValue;

                                   $attributeValues    =   $orderDetail?->digitalProductAttributeValue?->digitalProductAttributeValueKey;
                             

                               @endphp

                               @if( @$attribute && @$attributeValues )


                                    <div class="card mt-4">
                                        <div class="card-header">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <div class="d-flex align-items-center gap-3">
                                                    <h4 class="card-title fs-16">
                                                        {{ translate('Attribute info') }}
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                        

                                        <div class="card-body ">

                                            <div class="d-flex gap-4 mb-4 fs-14">
                                                {{translate("Attribute Name")}} : <span class="badge-soft-success fs-12 badge">{{@$attribute->name}}</span>
                                            </div>

                                            @foreach (@$attributeValues->where('status',1) as $value )
                                                <div class="d-flex align-items-start flex-column gap-4 billing-list mb-3">
                                                    <span class="d-flex align-items-start flex-column gap-2">
                                                         <small class="fs-14">
                                                            {{$value->name ? $value->name : 'N/A'  }} :
                                                        </small>  
                                                        <p class="fs-12 text-muted d-flex align-items-center gap-2"> 
                                                            
                                                            @if($value->file )
                                                   
                                                                <a href="{{route('attribute.download',['order_id' => $order->order_id,'id'=>$value->id])}}" class="badge badge-soft-info fs-12 pointer">
                                                                    <i class="fa-solid fa-download"></i>
                                                                </a> 
                                                            @endif
                                                            {{$value->value }}
                                                        </p>                                                        
                                                    </span>
                                                </div>
                                            @endforeach
                                            
                                        </div>
                                    </div>

                                @endif
                            @endif


                        </div>
                    </div>
                @endif
            </div>
        </div>
    </section>




@endsection
