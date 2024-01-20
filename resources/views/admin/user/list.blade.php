@extends('admin.layouts.admin')

@section('content')
<style>
    /* .paginate a {
        display: inline-block;
        color: #000;
        width: auto;
    } */

    .paginate span {
        width: auto;
        display: inline-block
    }

    .cursor-default {
        color: #000;
    }

    span[aria-current="page"] {
        background: rgba(0, 0, 0, 0.65);
    }

    span[aria-current="page"] span {
        color: red;
    }

    svg[fill="currentColor"] {
        width: 20px;
    }
</style>
<div class="content-wrapper">
    <div class="container-fluid">
        @include('admin.includes.bread_cumb',['title'=>'User Management'])
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <h5 class="card-title">All Users</h5>
                    </div>
                    <div class="card-header pull-left">
                        Total: {{ $collection->total() }}
                    </div>
                    <div class="card-header d-flex justify-content-end">
                        <!-- <a href="{{ route('admin_user_create') }}" class="btn btn-warning waves-effect waves-light m-1">
                            <i class="fa fa-plus"></i> <span>Add New</span>
                        </a> -->
                        <a href="{{ route('export_excel_last_message') }}" class="btn btn-success waves-effect waves-light m-1">
                            <i class="fa fa-file-excel-o"></i> <span>Export Excel</span>
                        </a>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <th scope="col">#</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Last Message</th>
                                    <th scope="col">Last time Send</th>
                                    <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($collection as $key=>$item)
                                    <tr>
                                        <th scope="row">{{$key+1}}</th>
                                        <td>{{ $item->first_name." ".$item->last_name }}</td>
                                        <td>
                                            {{ get_sub_comment_detail($item->content) }}
                                            <!-- @if($item->type == 1)
                                            {{ get_sub_comment_detail($item->content) }}
                                            @elseif($item->type == 2)
                                            <a href="{{ $cloudfrontUrl . "/" . $item->comment_id . "/" . $item->content }}" target="_blank">File</a>
                                            @elseif($item->type == 3)
                                            <a href="{{ $cloudfrontUrl . "/" . $item->comment_id . "/" . $item->content }}" target="_blank">Audio</a>
                                            @elseif($item->type == 4)
                                            <a href="{{ $cloudfrontUrl . "/" . $item->comment_id . "/" . $item->content }}" target="_blank">Video</a>
                                            @elseif($item->type == 5)
                                            <a href="{{ $cloudfrontUrl . "/" . $item->comment_id . "/" . $item->content }}" target="_blank">Image</a>
                                            @endif -->
                                        </td>
                                        <!-- <td>{{ date('H:i:s d/m/Y', strtotime($item->created_time)) }}</td> -->
                                        <td>{{ time_elapsed_string($item->created_time) }}</td>
                                        <td>
                                            <div>
                                                @php
                                                if($item->user_id == Auth::user()->id) {
                                                $receiverId = $item->reply_id;
                                                }else{
                                                $receiverId = $item->user_id;
                                                }
                                                @endphp
                                                <a type="button" target="_blank" href="{{ route('admin_lesson_view', ['id' => $item->lesson_id, 'comment_id' => $item->id ]) }}?st_id={{$receiverId}}" class="btn btn-light waves-effect waves-light m-1">
                                                    <i class="fa fa-eye"></i> <span>view</span>
                                                </a>
                                            </div>
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

        <div class="paginate pull-right">
            {{ $collection->links() }}
        </div>
        <!--start overlay-->
        <div class="overlay"></div>
        <!--end overlay-->
    </div>
    <!-- End container-fluid-->
</div>
<!--End content-wrapper-->

@endsection