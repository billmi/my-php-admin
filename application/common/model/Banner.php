<?php

namespace app\common\model;

use think\Model;

class Banner extends Model
{
    // 定义时间戳字段名
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';
    // 新增
    protected $insert = ['status' => 1];
    // 更新
    protected $update = ['update_time'];
}
