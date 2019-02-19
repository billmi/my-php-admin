<?php
namespace app\common\base;


load_trait('controller/Jump');

/**
 * 动作行为类
 * Class ActionBase
 * @package app\common\base
 * @author Bill
 */
abstract class ActionBase{
    use \traits\controller\Jump;

    protected $_errMsg;

    public function getErrorMsg(){
        return $this->_errMsg;
    }

    public function __construct()
    {

    }
}