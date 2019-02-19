<?php

namespace app\api\controller;

use app\common\base\ApiBase;
use think\Request;

/**
 * Class Api
 * @package app\api\controller
 * @author Bill
 */
class Api extends ApiBase
{
    /**
     * 重载
     * Api constructor.
     * @param Request|null $request
     */
    public function __construct(Request $request = null)
    {
        parent::__construct($request);
    }

    /**
     * 自初始化
     * @author Bill
     */
    public function _initialize()
    {

    }
}