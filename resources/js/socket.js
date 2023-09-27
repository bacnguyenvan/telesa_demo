import Echo from 'laravel-echo';

window.Pusher = require('pusher-js');

window.Echo = new Echo({
    broadcaster: 'pusher',
    key: process.env.MIX_PUSHER_APP_KEY,
    cluster: process.env.MIX_PUSHER_APP_CLUSTER ?? 'mt1',
    wsHost: window.location.hostname,
    wsPort: 6001,
    forceTLS: false,
    enabledTransports: ['ws', 'wss'],
});


// P2P
const channel = window.Echo.channel('public.chat.1');

channel.subscribed(() => {
    console.log('subscribed');
}).listen('.chat-msg', (event) => { // chat-msg: broadcastAs
    console.log("event chat: ", event);

    var content = event.content;
    const senderId = event.sender_id;
    const receiverId = event.reicever_id;
    const time = event.time;
    const name = event.name;
    const msg = content.message;
    const commentId = event.comment_id;
    const type = event.type;

    var uId = $('#u_id').val();
    var roleId = $('#role_id').val();
    var repId = $('#r_id').val();

    if (receiverId == uId) {
        
        let html = '';
        if(content.filepath) {
            html = 
            '<div id=cmtDetail_' + commentId + ' class="user-comment-item cmt-left">' +
                '<div class="comment-username">' +
                    '<span> ' + name + ' </span>' +
                '</div>' +
                '<div class="comment-detail">' +
                    '<div class="preview-image">' +
                        '<a href="'+ content.filepath + '" target="_blank">' +
                            '<div class="bg-preview-image" style="background-image: url(' + content.filepath + ')">' +
                            '</div>' +
                        '</a>' +
                    '</div>' +
                    '<span>' +
                        '<a href="' + content.filepath + '" target="_blank">' + content.filename + '</a>' +
                    '</span>' +
                '</div>' +
            '</div>' +
            '<div id=cmtTime_' + commentId + ' class="comment-time cmt-left">' +
                '<span>' + time + '</span>' +
            '</div>'
        } else {
            html = '<div id=cmtDetail_' + commentId + ' class="user-comment-item cmt-left">' +
                '<div class="comment-username">' +
                '<span>' + name + '</span>' +
                '</div>' +
                    '<div class="comment-detail">' +
                        '<span>' + msg + '</span>' +
                    '</div>' +
                '</div>' +
                '<div id=cmtTime_' + commentId + ' class="comment-time cmt-left">' +
                    '<span>' + time + '</span>' +
                '</div>';
        }
        
        
        $('.user-comment-list').append(html);
        globalScripts.auto_scroll_comment_details();
    }

    if(roleId > 3) {
        if(senderId != repId && uId != senderId) window.location.reload();
    }

    if(type > 1) {
        var comment_content = 
        '<div class="comment-file">' +
            '<a class="cmt-file" title="' + content.filename + '" alt="' + content.filename + '" href="' + content.filepath + '" target="_blank">';

        if(type == 2) {
            comment_content += '<i class="zmdi zmdi-movie"></i>';
        }else if(type == 3) {
            comment_content += '<i class="zmdi zmdi-speaker"></i>';
        }else if(type == 4) {
            comment_content += '<i class="zmdi zmdi-movie"></i>';
        }else if(type == 5) {
            comment_content += '<i class="zmdi zmdi-image-o"></i>';
        }
                
        comment_content += content.filename +
            '</a>' +
        '</div>';

        $(".comment-files").append(comment_content);
    }

})

// remove message
const channelRemoveMessage = window.Echo.channel('public.chat.remove');
channelRemoveMessage.subscribed(() => {
    console.log('subscribed channelRemoveMessage');
}).listen('.remove-chat-msg', (event) => {
    console.log("event remove: ", event);
    
    $('#cmtDetail_' + event.id).remove();
    $('#cmtTime_' + event.id).remove();
});
