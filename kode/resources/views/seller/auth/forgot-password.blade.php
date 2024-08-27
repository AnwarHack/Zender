@extends('admin.layouts.auth')
@section('main_content')
    <div class="container">
        <div class="d-flex align-items-center justify-content-center flex-column">
            <div class="row w-100 justify-content-center">
                <div class="col-md-8 col-lg-6 col-xl-5">
                    <div class="card mt-4">
                        <div class="card-body p-4">
                            <div class="text-center mt-2">
                                <div class="w-50 mx-auto" >
                                    <a href="{{route('seller.dashboard')}}">
                                        <img src="{{show_image(file_path()['site_logo']['path'].'/'.site_settings('site_logo'),file_path()['site_logo']['size'])}}" class="w-100 h-100" alt="form-logo">  </a>
                                </div>
                                <p class="text-muted mt-2">
                                    {{translate("Reset Password")}} ||{{site_settings('site_name')}}
                                </p>
                            </div>
                            <div class="p-3">
                                <form action="{{route('seller.reset.password.store')}}" method="POST">
                                    @csrf
                                    <div class="mb-3">
                                        <label for="email" class="form-label">
                                            {{translate("Email")}} <span class="text-danger" >*</span>
                                        </label>
                                        <input type="text" name="email" required    class="form-control" id="email" placeholder="Enter Email">
                                    </div>
                                    <div class="mb-3">
                                        <div class="float-end mb-half">
                                            <a href="{{route('seller.login')}}" class="text-muted">
                                                    {{translate("Login")}} ?
                                            </a>
                                        </div>
                                    </div>
                                    <div class="mt-4">
                                        <button class="btn btn-success w-100 rounded-10" type="submit">
                                            {{translate("Password Reset")}}
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="footer mt-3">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="text-center">
                                <p class="mb-0 text-muted">
                                    {{site_settings('copyright_text')}}
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

