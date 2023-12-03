<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\CommentDetail;
use Illuminate\Support\Facades\Log;

class RemoveOldFile extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'remove:old-file';

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
        $dayCondition = Date('Y-m-d', strtotime("-14 days"));

        $data = CommentDetail::whereIn('type', ['3','4','5'])
                                ->whereDate('created_time', "<=", $dayCondition)
                                ->whereNotNull('content')
                                ->orderby('id', 'desc')
                                ->get();

        foreach($data as $item)
        {
            Log::channel('report')->info("ID: $item->id, content: $item->content, path: $item->path . \n");

            $item->update([
                'content' => NULL,
                'path'  => NULL
            ]);
        }

        return 0;
    }
}
