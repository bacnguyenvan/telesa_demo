@extends('admin.layouts.admin_lesson')

@section('content')
<style>
    .card .table td,
    .card .table th {
        white-space: break-spaces;
    }
</style>
<link href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/4.0.1/min/dropzone.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/4.2.0/min/dropzone.min.js"></script>


<div class="content-wrapper @if(Auth::user()->role_id == 2) teacher-view-lesson @endif">
    <div class="container-fluid">
        @include('admin.includes.bread_cumb',['title'=>'Bài học: '. $vendor->name])

        <div class="row">
            <div class="view-lesson col-12 @if(Auth::user()->role_id == 1) col-lg-6 col-xl-6 @else col-lg-8 col-xl-8 @endif">
                <div class="card section-lesson">
                    <div class="card-header">Video</div>
                    <div class="card-body">
                        @if($vendor->video01 != null)
                        <video controls width="100%" controlsList="nodownload">
                            <source src="{{url('/'.$vendor->video01)}}">
                        </video>
                        <br><br>
                        @endif
                        @if($vendor->video02 != null)
                        <video controls width="100%" controlsList="nodownload">
                            <source src="{{url('/'.$vendor->video02)}}">
                        </video>
                        <br><br>
                        @endif
                        @if($vendor->video03 != null)
                        <video controls width="100%" controlsList="nodownload">
                            <source src="{{url('/'.$vendor->video03)}}">
                        </video>
                        @endif
                    </div>
                </div>
            </div>

            <div class="view-comment-file col-12 @if(Auth::user()->role_id == 1) col-lg-6 col-xl-6 @else col-lg-4 col-xl-4 @endif">
                <div class="card section-comment-file">
                    <div class="tabpanel">
                        <!-- Nav tabs -->
                        <ul id="lessonTabs" class="nav nav-tabs col-sm-12" role="tablist">
                            @if(($cur_comment_id && $cur_comment_id > 0) || Auth::user()->role_id > 3 )
                            <li id="lessonTabComment" role="presentation" class="col-sm-6 col-xs-12 tab-active">
                                <a href="#tab-comment" aria-controls="#tab-comment" class="active" role="tab" data-toggle="tab">Comment</a>
                            </li>
                            @endif
                            <li id="lessonTabFile" role="presentation" class="col-xs-12 @if(($cur_comment_id && $cur_comment_id > 0) || Auth::user()->role_id > 3 ) col-sm-6 @else col-sm-12 tab-active no-tab-cmt @endif">
                                <a href="#tab-files" aria-controls="#tab-files" role="tab" data-toggle="tab">Files</a>
                            </li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content lesson-tab-content">
                            @if(($cur_comment_id && $cur_comment_id > 0) || Auth::user()->role_id > 3 )
                            <div role="tabpanel" class="tab-pane active" id="tab-comment">
                                <div class="table-responsive lesson-user-comment">
                                    <div id="userCommentDetails" class="user-comment-list useselecttext">
                                        @if ($listComments)
                                        @foreach ($listComments as $k => $detail)
                                        <div id="cmtDetail_{{ $detail->id }}" data-id="{{ $detail->id }}"  class="user-comment-item {{ get_comment_detail_classname(Auth::user()->id, $detail->user_id) }} @if($detail->reply_comment_id)user-reply-comment-item @endif">
                                            @if (Auth::user()->id != $detail->user_id)
                                            <div class="comment-username">
                                                <span>@if(Auth::user()->role_id < 3) {{ trim($detail->first_name . ' ' . $detail->last_name) }} @else Telesa English @endif</span>
                                            </div>
                                            @endif
                                            <div class="comment-detail">
                                                {{-- @if($detail->type == 2)
                                                <div class="preview-file"><i class="zmdi zmdi-file"></i></div>
                                                @elseif($detail->type == 3)
                                                <div class="preview-file"><i class="zmdi zmdi-file"></i></div>
                                                @elseif($detail->type == 4)
                                                <div class="preview-file"><i class="zmdi zmdi-file"></i></div>
                                                @elseif($detail->type == 5)
                                                <div class="preview-image"><a href="{{ $detail->path }}" target="_blank">
                                                        <div class="bg-preview-image" style="background-image: url('{{ $detail->path }}')"></div>
                                                    </a></div>
                                                @endif --}}

                                                @if($detail->type > 1)
                                                    @if($detail->type == 5 || $detail->type == 2)
                                                    <div class="preview-image">
                                                        {{-- <a href="{{ $detail->path }}" target="_blank">
                                                            <div class="bg-preview-image" style="background-image: url('{{ $detail->path }}'); width:100%"></div>
                                                        </a> --}}
                                                        @if($detail->type == 5)
                                                        <img src="{{ $detail->path }}" loading="lazy" alt="Hình ảnh mô tả">
                                                        @else
                                                        <a href="{{ $detail->path }}" target="_blank">
                                                            <div class="bg-preview-image" style="background-image: url('{{ $detail->path }}'); width:100%"></div>
                                                        </a>
                                                        @endif
                                                    </div>
                                                    <span><a href="{{ $detail->path }}" target="_blank">{{ $detail->content }}</a></span>
                                                    @else
                                                        @if($detail->type == 3)
                                                        <video loading="lazy" width="100%" height="50px" controls>
                                                            <source src="{{ $detail->path }}" type="video/mp4">
                                                            Trình duyệt của bạn không hỗ trợ video HTML5.
                                                        </video>
                                                        @else
                                                        <video loop=1 muted=1 autoplay=false width="100%" height="150px" controls>
                                                            <data-src src="{{ $detail->path }}" type="video/mp4"></data-src>
                                                        </video>
                                                        <!-- <video class="video-js vjs-default-skin" controls preload="auto" width="100%" height="360" data-setup='{ "playbackRates": [0.5, 1, 1.5, 2] }'>
                                                            <source src="{{ $detail->path }}" type="video/mp4">
                                                        </video> -->
                                                        @endif
                                                        <span>{{ $detail->content }}</span>
                                                    @endif
                                                @else
                                                @if(!empty($detail->reply))
                                                <p class="reply-content" data-id="{{ $detail->reply->id }}"><i class="fa fa-reply"></i>{{ Str::limit($detail->reply->content, 35, '...') }} </p>
                                                @endif
                                                <span>{{ $detail->content }}</span>
                                                @endif
                                            </div>
                                            @if (Auth::user()->id == $detail->user_id)
                                            <div id="delCmt_{{ $detail->id }}" data-id="{{ $detail->id }}" class="hide btn-delcmt" style="display: none;"><i class="zmdi zmdi-delete"></i></div>
                                            @endif
                                        </div>
                                        <div id="cmtTime_{{ $detail->id }}"class="comment-time {{ get_comment_detail_classname(Auth::user()->id, $detail->user_id) }} comment-time-{{$detail->id}}">
                                            <span>{{ show_comment_detail_created_time($detail->created_time) }}</span>
                                        </div>
                                        @endforeach
                                        @endif
                                    </div>
                                    
                                    <div class="record-block">
                                        <div class="record-pause" id="stopButton">
                                            <i class="ti-control-pause"></i>
                                        </div>
                                        <div class="record-sound">
                                            <img src="{{ asset('sound.gif') }}"/>
                                        </div>
                                        <div class="record-timer" id="recordingTime">
                                            00:00
                                        </div>
                                        <div class="result-record">
                                            <ol id="recordingsList"></ol>
                                            <div class="record-button">
                                                <div class="cancel-record" id="cancel-record">
                                                    Hủy
                                                    <i class="zmdi zmdi-delete"></i>
                                                </div>
                                                <div class="send-record">
                                                    Gửi
                                                    <i class="zmdi zmdi-mail-send"></i>
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <div class="user-comment-box">
                                        <div class="cmt-feature">
                                            <div class="cmt-message-sticker">
                                                <img src="{{asset('sticker.png')}}"/>
                                                @include('admin.lessons.sticker-popup', ['emojis' => $emojis])
                                            </div>
                                            <div class="cmt-message-file">
                                                <i class="zmdi zmdi-attachment-alt"></i>
                                            </div>
                                            <div class="cmt-message-record" id="recordButton">
                                                <i class="ti-microphone"></i>
                                            </div>
                                        </div>
                                        
                                        <div class="cmt-message-box">
                                            <div class="chat-box">
                                                <div><i class="fa fa-reply"></i> Trả lời</div>
                                                <div class="friend-message">
                                                    
                                                </div>
                                                <div class="close-reply">x</div>
                                            </div>
                                            <div class="input-container">
                                                <input id="inputUserComment" name="content" type="text" class="cmt-message-input" value="" placeholder="">
                                            </div>
                                        </div>
                                        <div class="cmt-message-send">
                                            <button id="sendUserComment" class="btn btn-send-comment" type="button" data-comment="{{ $cur_comment_id }}" data-lesson="{{ $cur_lesson_id }}" data-reply="{{$cur_reply_id}}" data-reply_comment=""><i class="zmdi zmdi-mail-send"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endif
                            <div role="tabpanel" class="tab-pane @if(($cur_comment_id && $cur_comment_id > 0) || Auth::user()->role_id > 3 ) @else active no-tab-cmt @endif" id="tab-files">
                                <div class="table-responsive">
                                    <table class="table align-items-center">
                                        <tbody>
                                            @if($vendor->file01 != null)
                                            <tr>
                                                <td><i class="fa fa-circle text-white mr-2"></i> File 01</td>
                                                <td><a href="{{url('/'.$vendor->file01)}}" target="_blank"><i class="zmdi zmdi-case-download"></i> <span>Tài liệu 01</span></a></td>
                                            </tr>
                                            @endif
                                            @if($vendor->file02 != null)
                                            <tr>
                                                <td><i class="fa fa-circle text-white mr-2"></i> File 02</td>
                                                <td><a href="{{url('/'.$vendor->file02)}}" target="_blank"><i class="zmdi zmdi-case-download"></i> <span>Tài liệu 02</span></a></td>
                                            </tr>
                                            @endif

                                            @if($vendor->file03 != null)
                                            <tr>
                                                <td><i class="fa fa-circle text-white mr-2"></i> File 03</td>
                                                <td><a href="{{url('/'.$vendor->file03)}}" target="_blank"><i class="zmdi zmdi-case-download"></i> <span>Tài liệu 03</span></a></td>
                                            </tr>
                                            @endif

                                            @if($vendor->audio01 != null)
                                            <tr>
                                                <td><i class="fa fa-circle text-light-2 mr-2"></i>Audio 01</td>
                                                <td>
                                                    <audio controls controlsList="nodownload">
                                                        <source src="{{url('/'.$vendor->audio01)}}" type="audio/mpeg">
                                                    </audio>
                                                </td>
                                            </tr>
                                            @endif

                                            @if($vendor->audio02 != null)
                                            <tr>
                                                <td><i class="fa fa-circle text-light-2 mr-2"></i>Audio 02</td>
                                                <td><audio controls controlsList="nodownload">
                                                        <source src="{{url('/'.$vendor->audio02)}}" type="audio/mpeg">
                                                    </audio></td>
                                            </tr>
                                            @endif

                                            @if($vendor->audio03 != null)
                                            <tr>
                                                <td><i class="fa fa-circle text-light-2 mr-2"></i>Audio 03</td>
                                                <td><audio controls controlsList="nodownload">
                                                        <source src="{{url('/'.$vendor->audio03)}}" type="audio/mpeg">
                                                    </audio>
                                                </td>
                                            </tr>
                                            @endif
                                        </tbody>
                                    </table>
                                    {{-- @if($fileInComment && sizeof($fileInComment) > 0) --}}
                                    <div class="comment-files">
                                        <h5>In Comment</h5>
                                        @foreach($fileInComment as $k => $file)
                                        <div class="comment-file">
                                            <a class="cmt-file" title="{{$file->content}}" alt="{{$file->content}}" href="{{$file->path}}" target="_blank">
                                                @if($file->type == 2)
                                                <i class="zmdi zmdi-file-text"></i>
                                                @elseif($file->type == 3)
                                                <i class="zmdi zmdi-speaker"></i>
                                                @elseif($file->type == 4)
                                                <i class="zmdi zmdi-movie"></i>
                                                @elseif($file->type == 5)
                                                <i class="zmdi zmdi-image-o"></i>
                                                @endif
                                                {{get_sub_comment_detail($file->content)}}
                                            </a>
                                        </div>
                                        @endforeach
                                    </div>
                                    {{-- @endif --}}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--End Row-->

        <!--start overlay-->
        <div class="overlay"></div>
        <!--end overlay-->
    </div>
    <!-- End container-fluid-->
</div>
@if(($cur_comment_id && $cur_comment_id > 0) || Auth::user()->role_id > 3 )
<div id="uploadCommentFile" class="upload-file-form hide" style="display: none;">
    <div class="form-container">
        <div class="form-header">
            <div class="form-title">Uploading a new file</div>
            <div class="form-close-btn"><i data-target="uploadCommentFile" class="zmdi zmdi-close btn-close"></i></div>
        </div>
        <div class="form-body">
            <form action="{{ route('ajax_dropzone_store') }}" method="post" enctype="multipart/form-data" id="image-upload" class="dropzone">
                @csrf
                <input type="hidden" name="lesson" value="{{ $cur_lesson_id }}">
                <input type="hidden" name="comment" value="{{ $cur_comment_id }}">
                <input type="hidden" id="r_id" name="reply_id" value="{{ $cur_reply_id }}">
            </form>
            <div class="form-notice">
                <p>Maximum upload file size: 500MB.</p>
            </div>
        </div>
        <div class="form-footer">
            <div class="form-done-btn">
                <button data-target="uploadCommentFile" class="btn btn-close" type="button">Done</button>
            </div>
        </div>
    </div>
    <div style="display:none;" class="hide" id="myDzTemplate">
        <div class="dz-preview dz-file-preview">
            <div class="dz-image"><img data-dz-thumbnail /></div>
            <div class="dz-details">
                <div class="dz-size"><span data-dz-size></span></div>
                <div class="dz-filename"><span data-dz-name></span></div>
            </div>
            <div class="dz-progress">
                <span class="dz-upload" data-dz-uploadprogress></span>
            </div>
            <div class="dz-error-message"><span data-dz-errormessage></span></div>
            <div class="dz-success-mark">
                <svg xmlns="http://www.w3.org/2000/svg" height="54px" viewBox="0 0 54 54" width="54px" fill="#000000">
                    <path d="M0 0h24v24H0z" fill="none" />
                    <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" />
                </svg>
            </div>
            <div class="dz-error-mark">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000">
                    <path d="M0 0h24v24H0z" fill="none" />
                    <circle cx="12" cy="19" r="2" />
                    <path d="M10 3h4v12h-4z" />
                </svg>
            </div>
            <div class="dz-remove" data-dz-remove>
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#000000">
                    <path d="M0 0h24v24H0z" fill="none" />
                    <path d="M14.59 8L12 10.59 9.41 8 8 9.41 10.59 12 8 14.59 9.41 16 12 13.41 14.59 16 16 14.59 13.41 12 16 9.41 14.59 8zM12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z" />
                </svg>
            </div>
        </div>
    </div>
    <input type="hidden" id="u_id" value="{{ Auth::user()->id }}">
    <input type="hidden" id="role_id" value="{{ Auth::user()->role_id }}">
    <input type="hidden" id="full_name" value="{{ Auth::user()->first_name}} {{Auth::user()->last_name}}">
    <div class="bg-overlay"></div>
</div>
@endif
<!--End content-wrapper-->

@push('cjschat')
@if(($cur_comment_id && $cur_comment_id > 0) || Auth::user()->role_id > 3 )
<script type="text/javascript">
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    $(function() {
        
        $('#userCommentDetails').on('mouseover click press hover', '.user-comment-item', function() {
            $(this).find('.btn-delcmt').show().removeClass('hide');
        }).on('mouseleave blur', '.user-comment-item', function() {
            $(this).find('.btn-delcmt').hide().addClass('hide');
        });

        $('.cmt-message-file').on('click', function() {
            console.log('show upload form');
            $('#uploadCommentFile').removeClass('hide').show();
        });

        $('#userCommentDetails').on('click','.btn-delcmt', function() {
            let id = $(this).attr('data-id');
            if(typeof id != "undefined" && id != '' && id != null) {
                globalScripts.delete_comment_detail(id);
            }
        });

        $('.btn-close').on('click', function() {
            let target = $(this).attr('data-target');
            if (typeof target != "undefined") {
                $('#' + target).addClass('hide').css('display', 'none');
                $('#uploadCommentFile .dz-preview').removeAttr('data-id');
                myDropzone.removeAllFiles();
            }
        });

        $('#inputUserComment').on('keyup', function(e) {
            e.preventDefault();
            if (e.key !== undefined) {
                code = e.key;
            } else if (e.keyIdentifier !== undefined) {
                code = e.keyIdentifier;
            } else if (e.keyCode !== undefined) {
                code = e.keyCode;
            }
            if (typeof code != "undefined" && (code == 13 || code == 'Enter')) {
                $('#sendUserComment').trigger('click');
            }
        });

        $('#sendUserComment').on('click', function(e) {
            e.preventDefault();

            let content = $('#inputUserComment').val();
            if (content != '' && content != null) {
                let lesson_id = $(this).attr('data-lesson');
                let comment_id = $(this).attr('data-comment');
                let reply_id = $(this).attr('data-reply');
                let reply_comment_id = $(this).attr('data-reply_comment');
                let reply_comment_content = $('#sendUserComment').attr('data-reply_comment_content');

                let formData = {
                    comment_id: comment_id,
                    lesson_id: lesson_id,
                    content: content,
                    reply_id: reply_id,
                    reply_comment_id: reply_comment_id
                };

                $.ajax({
                    url: "{{ route('add_new_comment') }}",
                    method: "POST",
                    data: formData,
                    success: function(response) {
                        if (response.success != '' && response.time != '') {
                            globalScripts.insert_new_comment(response.id, content, response.time, reply_comment_content, reply_comment_id);
                            $('.chat-box').css("display", "none");
                            $('#sendUserComment').attr('data-reply_comment_content', "");
                            $('#sendUserComment').attr('data-reply_comment', "");
                        }
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        // console.log(xhr.status);
                        // console.log(thrownError);
                    }
                })
                $('#inputUserComment').val('');
            }
        });

        // Upload file
        var CSRF_TOKEN = document.querySelector('meta[name="csrf-token"]').getAttribute("content");

        Dropzone.autoDiscover = false;
        var myDropzone = new Dropzone(".dropzone", {
            maxFiles: 6,
            maxFilesize: 500, // 500MB
            acceptedFiles: ".pdf,.doc,.docx,.xls,.xlsx,.m4a,.flac,.mp3,.wav,.aac,.mp4,.mov,.wmv,.avi,.mkv,.webm,.png,.jpg,.jpeg",
            maxfilesexceeded: function(file) {
                this.removeFile(file);
            },
            previewTemplate: document.querySelector("#myDzTemplate").innerHTML
        });
        myDropzone.on("sending", function(file, xhr, formData) {
            console.log('sending');
            formData.append("_token", CSRF_TOKEN);
        });
        myDropzone.on("success", function(file, response) {
            console.log('success');
            if (response.success == 1) {
                let preview = (typeof file.previewElement.childNodes[1].firstChild.src != "undefined") ? file.previewElement.childNodes[1].firstChild.src : '';
                globalScripts.insert_new_file(file.name, response.path, preview, response.time, response.detail_id);
                globalScripts.count_uploaded_file('upload-file-form');
                file.previewElement.setAttribute("data-id", response.detail_id);
            }
        });
        myDropzone.on('removedfile', function(file) {
            let id = file.previewElement.getAttribute('data-id');
            if (typeof id != "undefined" && id != '' && id != null) {
                globalScripts.delete_file_uploaded(id);
            }
        });

        $('#lessonTabs a').click(function(e) {
            e.preventDefault()
            $(this).tab('show');
            $('#lessonTabs .tab-active').removeClass('tab-active');
            $(this).parent().addClass('tab-active');
        });

        $('.teacher-view-lesson .section-comment-file').on('click press focusin', function() {
            $('.view-lesson, .view-comment-file').removeClass('col-lg-4').removeClass('col-xl-4').removeClass('col-lg-8').removeClass('col-xl-8').addClass('col-lg-6 col-xl-6');
        });

        $(document).mouseup(function(e) {
            if ($('.teacher-view-lesson').length > 0) {
                let commentFile = $(".section-comment-file");
                let uploadFile = $(".upload-file-form");
                if (!commentFile.is(e.target) && commentFile.has(e.target).length === 0 && !uploadFile.is(e.target) && uploadFile.has(e.target).length === 0) {
                    $('.view-lesson, .view-comment-file').removeClass('col-lg-6').removeClass('col-xl-6');
                    $('.view-lesson').addClass('col-lg-8 col-xl-8');
                    $('.view-comment-file').addClass('col-lg-4 col-xl-4');
                }
            }
        });

        // reply
        $(document).on("contextmenu", ".user-comment-item", function(e) {
            e.preventDefault();
            let reply_comment_id = $(this).attr("data-id");
            var content = $(this).find(".comment-detail > span");//
            content.find('a').css("color", "black");
            content = content.html();
            $(".friend-message").html(content);
            $('.chat-box').css("display", "block");
            $("#inputUserComment").focus();
            $('#sendUserComment').attr('data-reply_comment', reply_comment_id);
            $('#sendUserComment').attr('data-reply_comment_content', content);
            $(".friend-message > a").css("color", "black !important");
        });

        $(".close-reply").on("click", function() {
            $('.chat-box').css("display", "none");
            $("#inputUserComment").focus();
            $('#sendUserComment').attr('data-reply_comment', "")
        });

        $("#userCommentDetails").on("click", ".reply-content", function(e) {
            var id = $(this).attr('data-id');
            const replyElement = $("#cmtDetail_" + id);
            
            if (replyElement.length > 0) {
                const scrollPosition = $("#userCommentDetails").scrollTop() + replyElement.offset().top - $("#userCommentDetails").offset().top;
                
                $("#userCommentDetails").animate(
                    {
                        scrollTop: scrollPosition
                    },
                    1000 // Adjust the duration of the scroll animation (in milliseconds)
                );
            }
        });

        // record
        $(".cmt-message-record").on("click", function(){
            $(".user-comment-box").css("display", "none");
            $(".record-block").css("display", "flex");
        });

        // $(document).on("click", ".record-pause", function() {
        //     $(".record-pause").hide();
        //     $(".record-sound").css("display", "none");
        //     $(".result-record").css("display", "flex");
        // })

        $(document).on("click", ".send-record", function() {
            
            //send
            var audioElement = $("#recordingsList audio");
            var audioSrc = audioElement.attr('src');

            var _token = document.querySelector('meta[name="csrf-token"]').getAttribute("content");
            let lesson_id = $("#sendUserComment").attr('data-lesson');
            let comment_id = $("#sendUserComment").attr('data-comment');
            let reply_id = $("#sendUserComment").attr('data-reply');

            var formData = new FormData();
            formData.append('comment', comment_id);
            formData.append('lesson', lesson_id);
            formData.append('reply_id', reply_id);
            formData.append('_token', _token);

            fetch(audioSrc)
                .then(function (response) {
                    if (!response.ok) {
                        throw new Error('Failed to fetch audio');
                    }
                    return response.blob();
                })
                .then(function (blob) {
                    formData.append('file', blob, 'audio.mp3');
                    $(".record-block").html('<div class="uploading-block"><img src="/upload-anim.gif"></div>');
                    // Now that the FormData is properly populated, make the AJAX request
                    $.ajax({
                        url: "/ajax/dropzone/store",
                        type: 'POST',
                        data: formData,
                        processData: false,
                        contentType: false,
                        dataType: 'json',
                        success: function (response) {
                            console.log('Upload successful:', response);
                            // You can handle the response here
                            globalScripts.insert_new_file('audio.mp3', response.path, preview = '', response.time, response.detail_id);
                            $(".user-comment-box").css("display", "flex");
                            $(".result-record").css("display", "none");
                            $(".record-block").css("display", "none");
                        },
                        error: function (error) {
                            console.error('Error uploading audio:', error);
                        }
                    });
                })
                .catch(function (error) {
                    console.error('Error fetching audio:', error);
                });
                
        });

    });
</script>
@endif

@endpush
@push('cjs')

<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('body').bind('cut paste', function(e) {
            // e.preventDefault();
        });
        jQuery("body").on("contextmenu", function(e) {
            // return false;
        });
    });
    jQuery(document).keydown(function(event) {
        if (event.keyCode == 123) {
            // return false;
        }
        if (event.ctrlKey && event.shiftKey && event.keyCode == 67) {
            // return false;
        }
        if (event.ctrlKey && event.shiftKey && event.keyCode == 73) {
            // return false;
        }
    });
    document.onkeydown = function(e) {
        if (e.ctrlKey && (e.keyCode === 67 || e.keyCode === 86 || e.keyCode === 85 || e.keyCode === 117)) {
            // return false;
        } else {
            return true;
        }
    };
    jQuery(document).keypress("u", function(e) {
        if (e.ctrlKey) {
            // return false;
        } else {
            return true;
        }
    });
    document.body.addEventListener('keydown', event => {
        if (event.ctrlKey && 'spa'.indexOf(event.key) !== -1) {
            // event.preventDefault()
        }
    })
    
    function isElementInViewport (el) 
    {
        var rect = el.getBoundingClientRect();

        return (
            rect.top >= 0 &&
            rect.left >= 0 &&
            rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) && 
            rect.right <= (window.innerWidth || document.documentElement.clientWidth)
        );
    }
    const handler = () => 
    {
        const videos = document.querySelectorAll('video');
        for (let i = 0; i < videos.length; i++)
        {
            const video = videos[i];
            const visible = isElementInViewport(video); // Check if the video is in the viewport or not.
            if (visible)
            {
                const dataSrc = video.querySelector('data-src');
                if (dataSrc) // Check if data-src exists or not. If yes, than we have never loaded this video.
                {
                    // Creating souce element and adding respective attributes.
                    const source = document.createElement('source');
                    source.src = dataSrc.getAttribute('src');
                    source.type = dataSrc.getAttribute('type');

                    video.appendChild(source); // Add new source element to video.
                    video.removeChild(dataSrc); // Remove data-src from video. 
                }
            }
        } 
    }

    const user_comment_detail = document.getElementById('userCommentDetails');

    addEventListener('load', handler, false);
    user_comment_detail.addEventListener('scroll', handler, false);
    addEventListener('resize', handler, false);
</script>

{{-- <script src="{{ asset('js/socket.js') }}"></script> --}}
<script src="{{ asset('js/record_init.js') }}"></script>
<script src="{{ asset('js/record.js') }}"></script>
<script src="{{ asset('js/sticker.js') }}"></script>

@endpush

@push('ccss')
<style>
    .reply-content {
        text-align: left;
        background: #8080803d;
        color: #411919;
        cursor: pointer;
        font-style: italic;
    }
    .cmt-message-box {
        margin: 0 auto;
        background-color: #fff;
        border-radius: 5px;
        /* box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); */
        height: fit-content;
    }

    .chat-box {
        background-color: #eaedf0;
        padding: 10px;
        border-radius: 5px;
        margin-bottom: 10px;
        border-left: 2px solid blue;
        color: #081c36;
        display: none;
        position: relative;
    }

    .friend-message {
        display: flex;
        justify-content: flex-start;
        margin-bottom: 10px;
        color: #081c36;
    }

    .friend-message > a{
        white-space: normal;
    }
    .friend-message .message {
        background-color: #f2f2f2;
        padding: 10px 15px;
        border-radius: 5px;
    }

    .input-container {
        display: flex;
        /* margin-top: 10px; */
        margin-bottom: 10px;
    }

    .input-container input {
        flex-grow: 1;
        padding: 10px;
        border: none;
        border-radius: 5px 0 0 5px;
        outline: none;
    }

    .input-container button {
        background-color: #0d6efd;
        border: none;
        border-radius: 0 5px 5px 0;
        color: white;
        padding: 10px 20px;
        cursor: pointer;
    }

    .close-reply {
        position: absolute;
        top: -10px;
        right: 0;
        background: #978e8e;
        padding: 0px 7px;
        border-radius: 50%;
        cursor: pointer;
        color: white;
    }
    .preview-image {
        width: 100px;
        height: 100px;
    }

    .preview-image img {
        width: 100%;
        height: 100%;
    }

    /* m3u8 */
    .video-js.vjs-default-skin {
        width: 100%;
        height: 150px;
    }

    .vjs-volume-panel.vjs-control.vjs-volume-panel-horizontal, button.vjs-picture-in-picture-control.vjs-control.vjs-button, .vjs-progress-control.vjs-control {
        display: none;
    }

    ::selection {
        background: #0074D9 !important; /* Màu nền khi bạn chọn văn bản */
        color: #fff; /* Màu văn bản khi bạn chọn văn bản */
    }

    .comment-detail span, .comment-detail p{
        white-space: pre-wrap;
    }

    .cmt-message-record {
        color: #007bff;
        text-align: center;
        justify-content: center;
        align-items: center;
        cursor: pointer;

        /* display: none; */
    }

    .cmt-message-sticker {
        /* display: none; */
    }
    .cmt-message-record > i {
        font-size: 22px;
    }

    .record-block {
        color: black;
        display: none;
        align-items: center;
        margin-left: 10px;
        margin-bottom: 20px;
    }

    .record-sound {
        width: 200px;
    }

    .record-sound img {
        width: 100%;
    }
    .record-pause i {
        font-size: 25px;
    }
    .record-pause {
        cursor: pointer;
    }
    .result-record {
        display: none;
        flex-direction: column;
    }

    .cancel-record i {
        color: red;
    }

    .cancel-record {
        background: beige;
        padding: 0px 5px;
        border-radius: 10px;
        border: 1px solid;
        cursor: pointer;
    }

    .send-record {
        background: #007bff;
        color: white;
        border: 1px solid grey;
        border-radius: 10px;
        padding: 0px 5px;
        cursor: pointer;
    }

    ol#recordingsList {
        width: 50%;
        list-style-type: none;
        margin: 0px;
        padding: 0px;
    }

    .record-button {
        display: flex;
        justify-content: space-evenly;
    }
    
    .uploading-block {
        width: 50%;
        margin: auto;
    }

    .uploading-block img {
        width: 100%;
        height: 100%;
    }

    .cmt-message-sticker {
        width: 22px;
        height: 22px;
        cursor: pointer;
    }

    .cmt-message-sticker img {
        width: 100%;
        height: 100%;
    }
    
    .user-comment-box {
        align-items: center;
    }

    .user-comment-box .cmt-message-file i.zmdi {
        margin: 0px auto 0 !important;
    }

    .cmt-feature {
        display: flex;
        margin-right: 5px;
    }


</style>

<link href="{{ asset('css/sticker.css') }}" rel="stylesheet" />
@endpush
@endsection
