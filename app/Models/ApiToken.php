<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ApiToken extends Model
{
    use HasFactory;

    public $guarded = false;
    public $timestamps = false;

    public function workspace() {
        return $this->belongsTo(Workspace::class);
    }
}
