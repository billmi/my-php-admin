<?php


namespace app\api\service;


use app\api\validate\MobileValidate;
use app\common\action\MobileCodeAction;
use app\common\base\BaseService;


/**
 * 手机验证码业务服务
 * Class MobileService
 * @package app\api\service
 * @author Bill
 */
class MobileCodeService extends BaseService
{

    /**
     * 发送验证码
     * @author Bill
     */
    public function sendMobileCode()
    {
        $mobile = input("mobile", "");
        $action = input("action", "");

        $data = [];
        $data['mobile'] = $mobile;
        $data['action'] = $action;

        $mobileCodeVali = new MobileValidate();

        if (!$mobileCodeVali->scene("send_code")->check($data)) {
            return $this->errReturn($mobileCodeVali->getError());
        }

        if (!is_mobile_code($mobile)) {
            return $this->errReturn("请正确填写手机号码!");
        }

//验证码模板
//        if ($action == 1) {
//            $template = '42830'; //聚合接口代码
//            $content = '您正在进行找回密码操作，您的验证码是' . $code;
//        }

        if (!MobileCodeAction::setCode($mobile, $action)) {
            return $this->errReturn("验证码发送失败!");
        }
        return $this->successReturn("验证码发送成功!");
    }


}