<?php

namespace app\api\controller;

use app\api\service\MemberService;
use think\Exception;
use think\Request;

/**
 * Class Index
 * @package app\api\controller
 * @author Bill
 */
class Member extends Api
{


    /**
     * 用户注册
     * @author Bill
     */
    public function register()
    {
        if (Request::instance()->isPost()) {
            if (Request::instance()->isPost()) {
                try {
                    return (new MemberService())->register();
                } catch (Exception $e) {
                    saveLog("register", "action:register,errMsg:用户注册!", 'error');
                    return $this->errReturn("注册请求异常!请重试!");
                }
            }
        }
    }


}