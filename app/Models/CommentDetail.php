<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CommentDetail extends Model {

    protected $table = 'comment_detail';

    use HasFactory;

    public function reply()
    {
        return $this->hasOne(CommentDetail::class,'id','reply_comment_id');
    }
}
