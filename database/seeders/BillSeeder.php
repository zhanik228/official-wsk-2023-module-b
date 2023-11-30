<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class BillSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $bills = [
            [
                'workspace_id' => 1,
                'service_id' => 1,
                'api_token_id' => 1,
                'usage_service_per_sec' => 24,
                'created_at' => now(),
                'updated_at' => now()
            ]
        ];

        DB::table('bills')->insert($bills);
    }
}
