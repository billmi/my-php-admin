<?php

namespace app\admin\validate;

use think\Validate;

class Banner extends Validate
{
    // 验证规则
    protected $rule = [
        'title' => 'require',
        'url' => 'require',
        'pic_id' => 'require'
    ];

    protected $message = [
        'title.require' => '请填写标题!',
        'url.require' => '请上传图片!',
        'pic_id.require' => '请上传图片!',
    ];

}