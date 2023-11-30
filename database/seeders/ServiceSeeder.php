<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ServiceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $services = [
            [
                'name' => 'Service #1',
                'service_cost_per_sec' => 0.001500,
                'created_at' => now(),
                'updated_at' => now(),
            ]
        ];

        DB::table('services')->insert($services);
    }
}
