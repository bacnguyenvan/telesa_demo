<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

use FFMpeg;
use FFMpeg\Format\Video\X264;
use App\Models\CommentDetail;
use Illuminate\Support\Facades\Storage;

class SendFileJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $dirConvert;
    protected $dir;
    protected $cd_id;
    protected $fileConvert;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($dirConvert, $dir, $cd_id, $fileConvert)
    {
        $this->dirConvert = $dirConvert;
        $this->dir = $dir;
        $this->cd_id = $cd_id;
        $this->fileConvert = $fileConvert;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $disk = Storage::disk('s3');

        // convert
        FFMpeg::fromDisk('s3')->open($this->dir)
            ->export()
            ->toDisk('s3')
            ->inFormat(new X264)
            ->save("$this->dirConvert", 'public');

        $path = $disk->url($this->dirConvert);
        $disk->delete($this->dir);
        
        CommentDetail::find($this->cd_id)->update([
            'path' => $path,
            'content' => $this->fileConvert
        ]);

        return "oke";
    }
}
