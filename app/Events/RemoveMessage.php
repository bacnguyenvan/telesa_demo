<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class RemoveMessage implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    private int $id;
    private int $senderId;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($senderId, $id)
    {
        $this->senderId = $senderId;
        $this->id = $id;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new Channel('public.chat.remove');
    }

    public function broadcastAs()
    {
        return 'remove-chat-msg';
    }

    public function broadcastWith()
    {
        return [
            'sender_id' => $this->senderId,
            'id' => $this->id
        ];
    }
}
