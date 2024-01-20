@extends('admin.layouts.admin')
@section('content')

<div class="content-wrapper">
    <div class="container-fluid">
        @include('admin.includes.bread_cumb',['title'=>'User Management'])
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">Created User</div>
                        <hr />
                        <form method="POST" action="{{ route('teacher.update',['teacher' => $teacher->id]) }}" enctype="multipart/form-data" autocomplete="off">
                            @csrf
                            @method('PUT')
                            <div class="form-group row">
                                <label for="input-25" class="col-sm-2 col-form-label">Image</label>
                                <div class="col-sm-10">
                                    <input type="file" name="image" class="form-control" id="input-25" />
                                    @error('image')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-21" class="col-sm-2 col-form-label">First Name</label>
                                <div class="col-sm-10">
                                    <input type="text" name="first_name" value="{{ old('first_name') ? old('first_name') : $teacher->first_name }}" class="form-control" id="input-21" placeholder="First name" />
                                    @error('first_name')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-21" class="col-sm-2 col-form-label">Last Name</label>
                                <div class="col-sm-10">
                                    <input type="text" name="last_name" value="{{ old('last_name') ? old('last_name') : $teacher->last_name }}" class="form-control" id="input-21" placeholder="Last name" />
                                    @error('last_name')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-22" class="col-sm-2 col-form-label">Email</label>
                                <div class="col-sm-10">
                                    <input type="email" name="email" value="{{ $teacher->email }}" class="form-control" autocomplete="off" id="input-22" placeholder="Enter Your Email Address" readonly />
                                    @error('email')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-23" class="col-sm-2 col-form-label">Mobile Number</label>
                                <div class="col-sm-10">
                                    <input type="text" name="phone" value="{{ old('phone') ? old('phone') : $teacher->phone }}" class="form-control" id="input-23" placeholder="phone" />
                                    @error('phone')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-23" class="col-sm-2 col-form-label">Money (1h)</label>
                                <div class="col-sm-10">
                                    <input type="text" name="money" value="{{ old('money') ? old('money') : $teacher->money }}" class="form-control" id="input-23" placeholder="phone" />
                                    @error('money')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-23" class="col-sm-2 col-form-label">Teaches</label>
                                <div class="col-sm-10">
                                    <select name="teaches" class="form-control">
                                        @foreach(countries() as $key => $value)
                                        <option {{ $teacher->teaches == $key ? "selected" : "" }} value="{{$key}}">{{$value}}</option>
                                        @endforeach
                                    </select>
                                    @error('teaches')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-23" class="col-sm-2 col-form-label">Speakes</label>
                                <div class="col-sm-10">
                                    <select name="speakes" id="" class="form-control">
                                        @foreach(countries() as $key => $value)
                                        <option {{ $teacher->speakes == $key ? "selected" : "" }} value="{{ $key }}">{{$value}}</option>
                                        @endforeach
                                    </select>
                                    @error('speakes')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-23" class="col-sm-2 col-form-label">Teacher from</label>
                                <div class="col-sm-10">
                                    <select name="teacher_from" class="form-control">
                                        @foreach(countries() as $key => $value)
                                        <option {{ $teacher->teacher_from == $key ? "selected" : "" }} value="{{$key}}">{{$value}}</option>
                                        @endforeach
                                    </select>
                                    @error('teacher_from')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-21" class="col-sm-2 col-form-label">Description</label>
                                <div class="col-sm-10">
                                    <textarea name="description" class="form-control" id="mytextarea1" cols="30" rows="10">{{ $teacher->description }}</textarea>
                                    @error('description')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-25" class="col-sm-2 col-form-label">Video</label>
                                <div class="col-sm-10">
                                    <input type="file" name="video" class="form-control" id="input-25" />
                                    @error('video')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-21" class="col-sm-2 col-form-label">Teaching Style</label>
                                <div class="col-sm-10">
                                    <textarea name="teaching_style" class="form-control" cols="30" rows="10">{{ $teacher->teaching_style }}</textarea>
                                    @error('teaching_style')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-21" class="col-sm-2 col-form-label">Teaching Material</label>
                                <div class="col-sm-10">
                                    <textarea name="teaching_material" class="form-control" cols="30" rows="10">{{ $teacher->teaching_material }}</textarea>
                                    @error('teaching_material')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"></label>
                                <div class="col-sm-10">
                                    <button type="submit" class="btn btn-white px-5"><i class="icon-lock"></i> Register</button>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />

<script>
    // tinymce.init({
    //     selector: '#mytextarea1'
    // });
    // tinymce.init({
    //     selector: '#mytextarea2'
    // });
    // $('#mytextarea1').summernote({
    //     height: 400,
    //     tabsize: 2
    // });

    // $(function() {
    //     $('.selectpicker').selectpicker();
    // });
</script>
@endpush


@endsection