<?php

namespace App\Console\Commands;

use App\Models\CommentDetail;
use App\Models\Comments;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Storage;

use FFMpeg;
use FFMpeg\Format\Video\X264;

class ResizeVideo extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'resize:video';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $disk = Storage::disk('s3');
        $env = config('app.env');
        
        $commentIDs = Comments::pluck("id");
        
        $comments = CommentDetail::whereIn('comment_id', $commentIDs)
                                    ->whereIn('type', [3,4])
                                    ->where('content', 'not like', "%.3mu8%")
                                    ->select("id", "comment_id", "type", "content", "path")->get();

        foreach($comments as $com){
            
            // pa = "https://telesa.s3.ap-southeast-2.amazonaws.com/chat/2/gUrIuEJDJFpsE9ypjFRE-4.mp4";
            $dir = str_replace("https://telesa.s3.ap-southeast-2.amazonaws.com/", "", $com->path);

            // $dir = "chat/$com->comment_id/$com->content";
            
            $contentNew = pathinfo($dir, PATHINFO_FILENAME) . ".m3u8";
            $dirWithoutExtension = "chat/$env/$com->comment_id/" . $contentNew;

            
            if($disk->exists($dir)) {
                FFMpeg::fromDisk('s3')->open($dir)
                    ->export()
                    ->toDisk('s3')
                    ->inFormat(new X264)
                    ->save("$dirWithoutExtension", 'public');

                $path = $disk->url($dirWithoutExtension);
                $com->update([
                    'content' => $contentNew,
                    'path' => $path 
                ]);

                \Log::info("Comment detail ID: $com->id success!");
            } else {
                dump($dir);
            }
        }
        dd("oke");
        return 0;
    }
}
