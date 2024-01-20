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
                    <div class="card-header d-flex justify-content-between" style="align-items: center;">
                        <form action="" method="get" class="d-flex" style="align-items: flex-end;">
                            <div style="margin-right:10px">
                                Start Date <input class="form-control" type="date" name="start_date" placeholder="Enter email">
                            </div>
                            <div style="margin-right:10px">
                                End Date <input class="form-control" type="date" name="end_date" placeholder="Enter email">
                            </div>
                            <button type="submit" class="btn btn-primary">Search</button>
                        </form>
                    </div>
                    <div class="card-header pull-left">
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">first name</th>
                                        <th scope="col">last name</th>
                                        <th scope="col">email</th>
                                        <th style="text-align: center;" scope="col">total interact</th>
                                        <th style="text-align: center;" scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($collection as $key=>$item)
                                    <tr>
                                        <th scope="row">{{$key+1}}</th>
                                        <td>{{ $item->first_name }}</td>
                                        <td>{{ $item->last_name }}</td>
                                        <td>{{ $item->email }}</td>
                                        <td align="center">{{ $item->total_interact ."/". 21 }}</td>
                                        <td align="center">
                                            <div>
                                                @if(in_array(Auth::user()->role_id,[1,2]))
                                                <a type="button" href="{{ route('admin_student_calendar',$item->id) }}" class="btn btn-secondary
                                                 waves-effect waves-light m-1">
                                                    <i class="fa fa-calendar"></i> <span>Calendar</span>
                                                </a>
                                                @endif
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