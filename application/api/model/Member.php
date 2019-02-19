<?php

namespace app\api\model;

use think\Model;


class Member extends Model
{

    protected $auto = ['status' => ENABLE_STATUS];

    protected $createTime = 'create_time';

    protected $insert = [
        "status" => ENABLE_STATUS, 'create_time'
    ];
}