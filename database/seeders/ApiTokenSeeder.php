<?php

namespace Database\Seeders;

use App\Models\Workspace;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ApiTokenSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $workspace = Workspace::where('title', 'My App')->firstOrFail();
        $tokens = [
            [
                'workspace_id' => $workspace->id,
                'name' => 'production',
                'token' => Str::random(40),
                'created_at' => now(),
                'revoked_at' => null,
            ],
            [
                'workspace_id' => $workspace->id,
                'name' => 'development',
                'token' => Str::random(40),
                'created_at' => now(),
                'revoked_at' => null,
            ]
        ];

        DB::table('api_tokens')->insert($tokens);
    }
}
