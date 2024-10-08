<?php

namespace App\Http\Controllers\Admin;

use App\Enums\StatusEnum;
use App\Http\Controllers\Controller;
use App\Models\Country;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Transaction;
use App\Models\Order;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;
use Illuminate\Support\Facades\Auth;
class CustomerController extends Controller
{
    public function __construct(){

        $this->middleware(['permissions:manage_customer']);
    }

    public function index() :View
    {
        $title     = translate('Manage customers');
        $customers = User::search()->latest()->with('order')->paginate(site_settings('pagination_number',10));
        return view('admin.customer.index', compact('title', 'customers'));
    }

    public function active() :View
    {
        $title = translate('Active customers');
        $customers = User::search()->active()->latest()->with('order')->paginate(site_settings('pagination_number',10));
        return view('admin.customer.index', compact('title', 'customers'));
    }

    public function banned()  :View
    {
        $title     = translate('Banned customers');
        $customers = User::banned()->search()->latest()->with('order')->paginate(site_settings('pagination_number',10));
        return view('admin.customer.index', compact('title', 'customers'));
    }

    public function details(int $id) :View
    {
        $title = translate('Customer Details');
        $user  = User::where('id', $id)->first();
        $countries = Country::visible()->get();
        return view('admin.customer.details', compact('title', 'user','countries'));
    }
    public function login(int $id) :RedirectResponse
    {
        $user  = User::where('id', $id)->firstOrfail();
        $user->status = StatusEnum::true->status();
        $user->save();
        Auth::guard('web')->login($user);

        return redirect()->route('home');

    }

    public function update(Request $request, int  $id) :RedirectResponse
    {
        $request->validate([
            'name'      => 'nullable|max:120',
            'email'     => 'nullable|unique:users,email,'.$id,
            'phone'     => 'nullable|unique:users,phone,'.$id,
            'address'   => 'nullable|max:250',
            'city'      => 'nullable|max:250',
            'state'     => 'nullable|max:250',
            'zip'       => 'nullable|max:250',
            'status'    => 'nullable|in:1,0',
            'country_id' => 'required|exists:countries,id',
        ]);
        $user = User::where('id',$id)->firstOrfail();
        $user->name  = $request->name;
        $user->email = $request->email;
        $user->phone = $request->phone;
        $user->country_id = $request->country_id;
        $address = [
            'address' => $request->address,
            'city'    => $request->city,
            'state'   => $request->state,
            'zip'     => $request->zip
        ];
        $user->address = $address;
        $user->status  = $request->status;
        $user->save();
        return back()->with('success',translate('User has been updated'));

    }



    public function transaction(int | string  $id) :View
    {
        $user         = User::where('id',$id)->firstOrfail();
        $title        = ucfirst($user->name)." transaction";
        $transactions = Transaction::users()->where('user_id', $id)->latest()->with('user')->paginate(site_settings('pagination_number',10));
        return view('admin.report.index', compact('title', 'transactions'));
    }

    public function physicalProductOrder(int $id) :View
    {
        $user   = User::where('id', $id)->firstOrfail();
        $title  = ucfirst($user->name)." physical product order";
        $orders = Order::physicalOrder()->where('customer_id', $id)->orderBy('id', 'DESC')->with('customer')->paginate(site_settings('pagination_number',10));
        return view('admin.order.index', compact('title', 'orders'));
    }

    public function digitalProductOrder(int $id) :View
    {
        $user   = User::where('id',$id)->firstOrfail();
        $title  = ucfirst($user->name)." digital product order";
        $orders = Order::digitalOrder()->where('customer_id', $id)->orderBy('id', 'DESC')->with('customer')->paginate(site_settings('pagination_number',10));
        return view('admin.digital_order.index', compact('title', 'orders'));
    }

}
