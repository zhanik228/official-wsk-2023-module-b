<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class WorkspaceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $demo1 = User::where('username', 'demo1')->firstOrFail();

        $workspaces = [
            [
                'user_id' => $demo1->id,
                'title' => 'My App',
                'description' => 'This is workspace 1'
            ]
        ];

        DB::table('workspaces')->insert($workspaces);
    }
}
