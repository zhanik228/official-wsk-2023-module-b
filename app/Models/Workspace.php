<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Workspace extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'title',
        'description',
        'created_at',
        'updated_at'
    ];

    public function quota() {
        return $this->hasOne(Quota::class);
    }

    public function bills() {
        return $this->hasMany(Bill::class);
    }

    public function currentBills() {
        return $this->hasMany(Bill::class)
            ->whereMonth('created_at', now()->month)
            ->whereYear('created_at', now()->year);
    }
}
