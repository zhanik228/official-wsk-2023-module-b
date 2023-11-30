<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bill extends Model
{
    use HasFactory;

    protected $appends = ['total'];

    public function getTotalAttribute() {
        return floatval($this->service->service_cost_per_sec) *
            floatval($this->usage_service_per_sec);
    }

    public function service() {
        return $this->belongsTo(Service::class);
    }

    public function workspace() {
        return $this->belongsTo(Workspace::class);
    }

    public function token() {
        return $this->belongsTo(ApiToken::class, 'api_token_id');
    }
}
