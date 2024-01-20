@extends('admin.layouts.admin')

@section('content')

<div class="content-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">Certificates</div>
                        <hr />
                        <form method="POST" action="{{ route('certificates.update',['teacher_id' => $item->teacher_id,'id' => $item->id]) }}" enctype="multipart/form-data" autocomplete="off">
                            @csrf
                            @method("PUT")
                            <div class="form-group row">
                                <label for="input-21" class="col-sm-2 col-form-label">Certificate</label>
                                <div class="col-sm-10">
                                    <input type="text" name="certificate" value="{{ old('certificate') ? old('certificate') : $item->certificate }}" class="form-control" />
                                    @error('certificate')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-21" class="col-sm-2 col-form-label">Description</label>
                                <div class="col-sm-10">
                                    <textarea name="description" id="description" style="width: 100%;" rows="10">{{ old('description') ? old('description') : $item->description  }}</textarea>
                                    @error('description')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="input-25" class="col-sm-2 col-form-label">File</label>
                                <div class="col-sm-10">
                                    <input type="file" name="file" class="form-control" id="input-25" />
                                    @error('image')
                                    <div class="text-warning">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"></label>
                                <div class="col-sm-10">
                                    <button type="submit" class="btn btn-white px-5"><i class="icon-lock"></i> Create</button>
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