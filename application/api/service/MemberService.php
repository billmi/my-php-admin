<?php


namespace app\api\service;

use app\api\model\Member;
use app\api\validate\MemberValidate;
use app\common\action\MobileCodeAction;
use app\common\base\BaseService;
use think\Exception;


/**
 * 用户业务层
 * Class MemberService
 * @package app\api\service
 * @author Bill
 */
class MemberService extends BaseService
{
    /**
     * 用户注册
     * @author Bill
     */
    public function register()
    {
        $data = input("post.");
        $mobile = input("mobile", "");
        if (!is_mobile_code($mobile))
            return $this->errReturn("请正确填写手机号码!");

        $memberInfo = db("member")->where(['mobile' => $data['mobile']])->find();

        if (!empty($memberInfo))
            return $this->errReturn("用户已存在!");

        $memDataVali = new MemberValidate();
        if (!$memDataVali->scene('register')->check($data))
            return $this->errReturn($memDataVali->getError());

        $action = $data['action'];

        $mobileCodeAction = new MobileCodeAction();
        if (!$mobileCodeAction->checkMobileCode($data['mobile_msg_code'], $mobile, $action))
            return $this->errReturn($mobileCodeAction->getErrorMsg());

        $member = new Member();
        $member->mobile = $data['mobile'];
        $member->password = md5($data['password']);
        $member->save();

        $newId = $member->id;
        if (!$newId)
            return $this->successReturn("注册失败!请稍后重试!");


        $mobileCodeAction->clearMobileActionCode($mobile, $action);
        return $this->errReturn("注册成功!");

    }
}