@extends('admin.layouts.admin')
@section('content')
<link href='{{ asset("css/fullcalendar.css") }}' rel='stylesheet' />
<link href='{{ asset("css/fullcalendar.print.css") }}' rel='stylesheet' media='print' />
<script src='{{ asset("js/jquery-ui.custom.min.js") }}' type="text/javascript"></script>

<script>
    const list_history = JSON.parse(`{!! json_encode($result) !!}`);
</script>

<script src='{{ asset("js/fullcalendar.js") }}' type="text/javascript"></script>

<style>
    #wrap {
        width: 1100px;
        margin: 0 auto;
    }

    #external-events {
        float: left;
        width: 150px;
        padding: 0 10px;
        text-align: left;
    }

    #external-events h4 {
        font-size: 16px;
        margin-top: 0;
        padding-top: 1em;
    }

    .external-event {
        /* try to mimick the look of a real event */
        margin: 10px 0;
        padding: 2px 4px;
        background: #3366CC;
        color: #fff;
        font-size: .85em;
        cursor: pointer;
    }

    #external-events p {
        margin: 1.5em 0;
        font-size: 11px;
        color: #666;
    }

    #external-events p input {
        margin: 0;
        vertical-align: middle;
    }

    #calendar {
        margin: 0 auto;
        width: 900px;
        background-color: #2a323c;
        border-radius: 6px;
        border: 1px solid #fff;
    }

    .fc-grid .fc-other-month {
        background: #525252;
    }

    .fc-grid .fc-other-month .fc-day-number {
        opacity: unset;
    }

    table.fc-header,
    thead tr.fc-first {
        background-color: #2a323c;
    }

    .fc-content {
        border-top: 1px solid #fff;
    }

    .fc-event {
        color: #000 !important;
    }
</style>
<div class="content-wrapper">
    <div class="container-fluid">
        @include('admin.includes.bread_cumb',['title'=>'User Management'])
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <h5 class="card-title">Calendar</h5>
                    </div>
                    <div class="card-body">
                        <div id='wrap'>

                            <div id='calendar'></div>

                            <div style='clear:both'></div>
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
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Choose time interact</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{ route('store_student_calendar') }}" method="POST">
                @csrf
                <div class="modal-body">
                    <div class="form-check">
                        <input class="form-check-input" name="checkBoxInteract[]" type="checkbox" value="1" id="flexCheckMorning">
                        <label class="form-check-label" for="flexCheckMorning">
                            Morning
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" name="checkBoxInteract[]" type="checkbox" value="2" id="flexCheckMidday">
                        <label class="form-check-label" for="flexCheckMidday">
                            Midday
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" name="checkBoxInteract[]" type="checkbox" value="3" id="flexCheckEvening">
                        <label class="form-check-label" for="flexCheckEvening">
                            Evening
                        </label>
                    </div>
                </div>
                <input type="hidden" name="time_interact" id="time_interact">
                <input type="hidden" name="user_id" value="{{$id}}">
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" id="save_time_interact">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection