<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class ChatEvent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    private array $content;
    private int $senderId;
    private int $receiverId;
    private string $time;
    private string $name;
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(int $senderId, int $receiverId, array $content, string $time, string $name)
    {
        $this->senderId = $senderId;
        $this->receiverId = $receiverId;
        $this->content = $content;
        $this->time = $time;
        $this->name = $name;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new Channel('public.chat.1');
    }

    public function broadcastAs()
    {
        return 'chat-msg';
    }

    public function broadcastWith()
    {
        return [
            'sender_id' => $this->senderId,
            'reicever_id' => $this->receiverId,
            'content' => $this->content,
            'time' => $this->time,
            'name' => $this->name
        ];
    }
}
