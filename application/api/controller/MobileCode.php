<?php

namespace app\api\controller;


use app\api\service\MobileCodeService;
use app\api\validate\MobileValidate;
use think\Cache;
use think\Exception;
use think\Request;

class MobileCode extends Api
{
    /**
     * 需要检测不存在
     * @var array
     */
    private $_actionNotExist = [12, 13];

    /**
     * 需要检测存在
     * @var array
     */
    private $_actionExist = [
        1
    ];


    /**
     * 短信发送
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @author Bill
     */
    public function sendCode()
    {
        if (Request::instance()->isPost()) {
            try {
                return (new MobileCodeService())->sendMobileCode();
            } catch (Exception $e) {
                saveLog("mobilecode", "action:mobilecode,errMsg:手机短信验证码!", 'error');
                return $this->excepReturn("短信发送失败!请重试!");
            }
        }
    }

    /**
     * 手机号检测
     * @param string $mobile
     * @param string $action
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @author Bill
     */
    private function _checkMobileExist($mobile = '', $action = '')
    {
        $checkExist = true;
        $where['mobile'] = $mobile;
        $userMoble = model("Member")->where($where)->find();
        if (!$userMoble)
            $checkExist = false;

        if (in_array($action, $this->_actionExist)) {
            if (!$checkExist)
                $this->error("手机号码不存在!");
        }

        if (in_array($action, $this->_actionNotExist)) {
            if ($checkExist)
                $this->error("手机号码已存在!");
        }
    }
}
