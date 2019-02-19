<?php

namespace app\common\action;

use app\common\base\ActionBase;
use think\Cache;

/**
 * 手机验证码操作
 * Class MobileCodeAction
 * @package app\wap\action
 * @author Bill
 */
class MobileCodeAction extends ActionBase
{
    /**
     * 手机操作分隔符
     */
    const DELIMITER = "_";

    /**
     * @var int 5 * 60
     */
    const DEF_TIME = 300;

    /**
     * @param string $currCode
     * @param string $mobile
     * @param $actionCode
     * @return bool
     * @author Bill
     */
    public function checkMobileCode($currCode = '', $mobile = '', $actionCode)
    {
        $rememberCode = self::getMobileActionCode($mobile, $actionCode);
        if (!$rememberCode) {
            $this->_errMsg = "短信验证码不存在";
            return false;
        }
        if ($currCode != $rememberCode) {
            $this->_errMsg = "短信验证码错误!";
            return false;
        }
        return true;
    }

    /**
     * 用户手机验证行为map
     * @param $code
     * @return mixed
     * @author Bill
     */
    public static function getActionCodeMap($code)
    {
        $actionCodeMap = [
            '1' => "register",         //用户注册
        ];
        return $actionCodeMap[$code];
    }

    /**
     * 获取手机操作验证码
     * @param string $mobile
     * @param string $action
     * @param string $delimiter
     * @return mixed|string
     * @author Bill
     */
    public static function getMobileActionCode($mobile = '', $action = '', $delimiter = self::DELIMITER)
    {
        $cache = Cache::connect(config('cache'));
        $currCode = $cache->get($mobile . $delimiter . $action);
        return $currCode ? $currCode : '';
    }

    /**
     * 清除手机业务验证码
     * @param string $mobile
     * @param string $action
     * @param string $delimiter
     * @return bool
     * @author Bill
     */
    public static function clearMobileActionCode($mobile = '', $action = '', $delimiter = self::DELIMITER)
    {

        $cache = Cache::connect(config('cache'));
        $result = $cache->set($mobile . $delimiter . $action, null);
        return $result ? true : false;
    }

    /**
     * 随机六位数密码
     * @param string $mobile
     * @param string $action
     * @param int $laterTime
     * @param string $delimiter
     * @return mixed
     * @author Bill
     */
    public static function setCode($mobile = "", $action = "", $laterTime = self::DEF_TIME, $delimiter = self::DELIMITER)
    {
        $code = rand(111111, 999999);
        $cache = Cache::connect(config('cache'));
        return $cache->set($mobile . $delimiter . $action, $code, $laterTime);
    }

}