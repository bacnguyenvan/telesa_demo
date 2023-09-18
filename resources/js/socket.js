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
    console.log("event: ",event);

    var content = event.content;
    const senderId = event.sender_id;
    const receiverId = event.reicever_id;
    const time = event.time;
    const name = event.name;
    const msg = content.message;

    var rId = $('#r_id').val();
    var uId = $('#u_id').val();
    var roleId = $('#role_id').val();
    console.log("sId: ", rId);
    
    
    if (receiverId == uId) {
        
        let html = '';
        if(content.filepath) {
            html = 
            '<div class="user-comment-item cmt-left">' +
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
            '<div class="comment-time cmt-left">' +
                '<span>' + time + '</span>' +
            '</div>'
        } else {
            html = '<div class="user-comment-item cmt-left">' +
                '<div class="comment-username">' +
                '<span>' + name + '</span>' +
                '</div>' +
                    '<div class="comment-detail">' +
                        '<span>' + msg + '</span>' +
                    '</div>' +
                '</div>' +
                '<div class="comment-time cmt-left">' +
                    '<span>' + time + '</span>' +
                '</div>';
        }
        

        $('.user-comment-list').append(html);
        globalScripts.auto_scroll_comment_details();
    }
})