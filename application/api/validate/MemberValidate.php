<?php

namespace app\api\validate;

use think\Validate;

/**
 * 会员验证
 * Class MemberValidate
 * @package app\api\validate
 * @author Bill
 */
class MemberValidate extends Validate
{

    protected $rule = [
        'mobile' => 'require|length:11',
        'action' => 'require|number',
        'password' => 'require|length:6,15|alphaDash',
        'mobile_msg_code' => 'require|length:6'
    ];

    protected $message = [
        'mobile.require' => '手机号码不能为空!',
        'mobile.length' => '手机格式不正确!',
        'action.require' => '操作码不能为空!',
        'action.number' => '操作码必须是数字!',
        'password.require' => '密码不能为空!',
        'password.length' => '密码长度请在6-15个字符之间!',
        'password.alphaDash' => '密码只能包含字母,数字,下划线!',
        'mobile_msg_code.require' => '请填写验证码!',
        'mobile_msg_code.length' => '验证码应为6位!',
    ];

    protected $scene = [
        'register' => ['mobile', 'action','password'],
    ];
}