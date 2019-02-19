<?php

namespace app\common\util;

/**
 * 错误码管理
 * Class ErrorCode
 * @package app\common\util
 */
class ErrorCode{

    const ERROR_CODE   = 0;

    const SUCCESS_CODE = 1;

    const HTTP_SUCCESS_CODE = 200;

    const BAD_REQUEST = 400;

    const NO_AUTH = 401;

    const REQUEST_FORBIDDEN = 403;

    const NOT_FOUND = 404;

    /**
     * 获取错误信息
     * @param int $code
     * @return mixed
     * @author Bill
     */
    public static function getMsg($code){
        static $errorMap = [
            '0' => "请求失败!",
            '1' => "请求成功!",

            '100' => "登录异常!",
            //--httpCode
            '200' => "请求成功",
            '400' => "Bad Request!",
            '401' => "Unauthorized!",
            '403' => "Forbidden!",
            //--httpCode end
        ];
        return $errorMap[$code];
    }
}