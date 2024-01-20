<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserHistoryInteract extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = "user_history_interact";

    public function user()
    {
        return $this->belongsTo("App\Models\User", "user_id");
    }
}
