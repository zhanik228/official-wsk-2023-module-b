<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('bills', function (Blueprint $table) {
            $table->id();
            $table->foreignIdFor(\App\Models\Workspace::class)->constrained();
            $table->foreignIdFor(\App\Models\Service::class)->constrained();
            $table->foreignIdFor(\App\Models\ApiToken::class)->constrained();
            $table->float('usage_service_per_sec', 11, 3);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('bills');
    }
};
