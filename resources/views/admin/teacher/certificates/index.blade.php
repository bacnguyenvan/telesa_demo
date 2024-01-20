@extends('admin.layouts.admin')

@section('content')
<style>
    .card .table td,
    .card .table th {
        white-space: break-spaces;
    }
</style>
<div class="content-wrapper">
    <div class="container-fluid">
        @include('admin.includes.bread_cumb',['title'=>'Work Experience'])
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <a href="{{ route('certificates.create',['teacher_id' => $teacher_id]) }}"><button>Add</button></a>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Certificate</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($collection as $key=>$item)
                                    <tr>
                                        <th scope="row">{{$key+1}}</th>
                                        <td>{{ $item->certificate }}</td>
                                        <td>
                                            <a type="button" href="{{ route('certificates.edit',['teacher_id' => $item->teacher_id,'id' => $item->id]) }}" class="btn btn-warning waves-effect waves-light m-1">
                                                <i class="fa fa-pencil"></i> <span>Edit</span>
                                            </a>
                                            <form method="POST" action="{{ route('certificates.destroy',['teacher_id' => $item->teacher_id,'id' => $item->id]) }}">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="btn btn-warning waves-effect waves-light m-1">
                                                    <i class="fa fa-pencil"></i> <span>Delete</span>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                    @endforeach

                                </tbody>
                            </table>
                        </div>
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

@endsection