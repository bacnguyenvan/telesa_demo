@extends('admin.layouts.admin_lesson')

@section('content')

<div class="content-wrapper">
    <div class="container-fluid">
        @include('admin.includes.bread_cumb',['title'=>'User Management'])
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">Update User</div>
                        <hr />
                        <form id="userUpdateForm" method="POST" action="#" enctype="multipart/form-data" name="updateForm" class="updateForm" autocomplete="off">
                            @csrf
                            <input type="hidden" name="id" value="{{ $user->id }}">
                            <div class="form-group row">
                                <label for="input-21" class="col-sm-2 col-form-label">First Name</label>
                                <div class="col-sm-10">
                                    <input type="text" name="first_name" value="{{ $user->first_name }}" class="form-control" id="input-21" placeholder="First name" />
                                    @error('first_name')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-21" class="col-sm-2 col-form-label">Last Name</label>
                                <div class="col-sm-10">
                                    <input type="text" name="last_name" value="{{ $user->last_name }}" class="form-control" id="input-21" placeholder="Last name" />
                                    @error('last_name')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <!--

                                <div class="form-group row">
                                    <label for="input-21" class="col-sm-2 col-form-label">User Name</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="username" autocomplete="off" value="{{ $user->username }}" class="form-control" id="input-21" placeholder="Username" />
                                        @error('username')
                                            <div class="text-warning">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            -->
                            <div class="form-group row">
                                <label for="input-21" class="col-sm-2 col-form-label">User Role</label>
                                <div class="col-sm-10">
                                    {{-- <input type="text" name="role" class="form-control" id="input-21" placeholder="Username" /> --}}
                                    <select name="role_id" class="form-control" id="">
                                        {{-- @foreach (App\Models\UserRole::get() as $item) --}}
                                        @foreach ($user_roles as $item)
                                        <option {{ $user->role_id == $item->serial ? 'selected' : ''}} value="{{ $item->serial }}">{{ $item->name }}</option>
                                        @endforeach
                                    </select>
                                    @error('role_id')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-25" class="col-sm-2 col-form-label">Course</label>
                                <div class="col-sm-10">
                                    @include('admin.product.components.select_course',[
                                    'name' => 'course[]',
                                    'attributes' => '',
                                    'class' => 'multiple-select course',
                                    'collection' => $courses,
                                    'value' => $UserCourseList,
                                    'fields' => [
                                    ['name' => 'name','type' => 'text'],
                                    ['name' => 'icon','type' => 'file'],
                                    ]
                                    ])
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-22" class="col-sm-2 col-form-label">Email</label>
                                <div class="col-sm-10">
                                    <input type="email" name="email" value="{{ $user->email }}" class="form-control" id="input-22" placeholder="Enter Your Email Address" />
                                    @error('email')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-23" class="col-sm-2 col-form-label">Mobile Number</label>
                                <div class="col-sm-10">
                                    <input type="text" name="phone" value="{{ $user->phone }}" class="form-control" id="input-23" placeholder="phone" />
                                    @error('phone')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-24" class="col-sm-2 col-form-label">Password</label>
                                <div class="col-sm-10">
                                    <input type="password" name="password" class="form-control" id="input-24" placeholder="Enter Password" />
                                    @error('password')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-25" class="col-sm-2 col-form-label">Confirm Password</label>
                                <div class="col-sm-10">
                                    <input type="password" name="password_confirmation" class="form-control" id="input-25" placeholder="Confirm Password" />
                                    @error('password_confirmation')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-25" class="col-sm-2 col-form-label">Image</label>
                                <div class="col-sm-10">
                                    <img src="/{{ $user->photo }}" style="height: 50px; margin-bottom: 10px;" alt="user image"> <br>
                                    <input type="file" name="image" class="form-control" id="input-25" />
                                    @error('image')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"></label>
                                <div class="col-sm-10">
                                    <button type="button" onclick="updateInformation()" class="btn btn-white px-5"><i class="icon-lock"></i>
                                        Update
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
        <!--start overlay-->
        <div class="overlay"></div>
        <!--end overlay-->
    </div>
    <!-- End container-fluid-->
</div>
<!--End content-wrapper-->

@push('ccss')
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" rel="stylesheet" />
@endpush

@push('cjs')
<script src="{{ asset('contents/admin') }}/plugins/summernote/dist/summernote-bs4.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
<script>
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    $('#mytextarea1').summernote({
        height: 400,
        tabsize: 2
    });

    $(function() {
        $('.selectpicker').selectpicker();
    });

    function updateInformation() {
        let formData = $('#userUpdateForm').serialize();
        confirm('hei, Do you sure want to Update.') &&
            $.ajax({
                url: '{{route("admin_user_update")}}',
                method: "POST",
                data: formData,
                success: function(response) {
                    console.log('done');
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    console.log(xhr.status);
                    console.log(thrownError);
                }
            })
    }
</script>
@endpush
@endsection
