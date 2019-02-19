<?php

namespace app\common\base;

load_trait('controller/Jump');
header("content-Type: text/html; charset=Utf-8");


/**
 * 业务基类
 * Class BaseService
 * @package app\common\base
 * @author Bill
 */
abstract class BaseService{

    use \traits\controller\Jump;

    protected $_errorMsg;

    public function __construct()
    {

    }

    /**
     * @return mixed
     */
    public function getErrorMsg()
    {
        return $this->_errorMsg;
    }
}