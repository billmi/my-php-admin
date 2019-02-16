<?php

namespace app\api\validate;

use think\Validate;

/**
 * 手机验证码参数验证器
 * Class MobileValidate
 * @package app\wap\validate
 * @author Bill
 */
class MobileValidate extends Validate
{

    protected $rule = [
        'mobile' => 'require|length:11',
        'action' => 'require|number'
    ];

    protected $message = [
        'mobile.require' => '手机号码不能为空!',
        'mobile.length' => '手机格式不正确!',
        'action.require' => '操作码不能为空!',
        'action.number' => '操作码必须是数字!',
    ];

    protected $scene = [
        'send_code' => ['mobile', 'action'],
    ];
}