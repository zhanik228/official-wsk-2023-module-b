<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class QuotaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $quotas = [
            [
                'workspace_id' => 1,
                'limit' => 24,
                'created_at' => now(),
                'updated_at' => now()
            ]
        ];

        DB::table('quotas')->insert($quotas);
    }
}
