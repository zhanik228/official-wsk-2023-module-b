<?php

namespace App\Console\Commands;

use App\Models\Bill;
use Illuminate\Console\Command;

class GenerateBillsCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:generate-bills-command';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        Bill::create([
           'workspace_id' => 1,
            'service_id' => 1,
            'api_token_id' => 1,
            'usage_service_per_sec' => 24,
            'created_at' => now(),
            'updated_at' => now()
        ]);
    }
}
