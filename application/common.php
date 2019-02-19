<?php


// 应用公共文件 
include('common/common/function.php');


/**
 * 文件记录日志(TODO::>>后期移)
 * @param $file
 * @param $text
 * @param int $level
 * @author Bill
 */
function saveLog($file, $text, $level = 0)
{
    $text = '[' . date('Y-m-d h:i:s', time()) . '][' . $level . ']' . $text . "\n";
    file_put_contents(__DIR__ . '/../runtime/log/' . $file . '_' . date('Ymd') . '.log', $text, FILE_APPEND);
}

/**
 * 检测是否手机号码
 * @param string $mobileCode
 * @return bool
 * @author Bill
 */
function is_mobile_code($mobileCode = ''){
    if(empty($mobileCode))
        return false;
    if(!preg_match('/^1[34578]{1}\d{9}$/',$mobileCode))
        return false;
    return true;

}