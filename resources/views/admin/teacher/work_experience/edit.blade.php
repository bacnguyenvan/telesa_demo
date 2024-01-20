@extends('admin.layouts.admin')

@section('content')

<div class="content-wrapper">
    <div class="container-fluid">
        @include('admin.includes.bread_cumb',['title'=>'User Management'])
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">Work Experience</div>
                        <hr />
                        <form method="POST" action="{{ route('work_experience.update',['teacher_id' => $TeacherWorkExprientce->teacher_id,'id' => $TeacherWorkExprientce->id]) }}" enctype="multipart/form-data" autocomplete="off">
                            @csrf
                            @method('PUT')
                            <div class="form-group row">
                                <label for="input-21" class="col-sm-2 col-form-label">Time start</label>
                                <div class="col-sm-10">
                                    <input type="date" name="time_start" value="{{ old('time_start') ? old('time_start') : date('Y-m-d',$TeacherWorkExprientce->time_start) }}" class="form-control" />
                                    @error('time_start')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-21" class="col-sm-2 col-form-label">Time end</label>
                                <div class="col-sm-10">
                                    <input type="date" name="time_end" value="{{ old('time_end') ? old('time_end') : date('Y-m-d',$TeacherWorkExprientce->time_end) }}" class="form-control" />
                                    @error('time_end')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-22" class="col-sm-2 col-form-label">School</label>
                                <div class="col-sm-10">
                                    <input type="text" name="school" value="{{ old('school') ? old('school') : $TeacherWorkExprientce->school }}" class="form-control" autocomplete="off" />
                                    @error('school')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-23" class="col-sm-2 col-form-label">Position</label>
                                <div class="col-sm-10">
                                    <input type="text" name="position" value="{{ old('position') ? old('position') : $TeacherWorkExprientce->position }}" class="form-control" placeholder="position" />
                                    @error('position')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-21" class="col-sm-2 col-form-label">Description</label>
                                <div class="col-sm-10">
                                    <textarea name="description" class="form-control" cols="30" rows="10">{{ old('description') ? old('description') : $TeacherWorkExprientce->description }}</textarea>
                                    @error('description')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"></label>
                                <div class="col-sm-10">
                                    <button type="submit" class="btn btn-white px-5"><i class="icon-lock"></i> Update</button>
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
@endpush


@endsection