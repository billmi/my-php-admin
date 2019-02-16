<?php

namespace app\api\controller;

/**
 * Class Index
 * @package app\api\controller
 * @author Bill
 */
class Index extends Api
{
    public function Index()
    {
        $list = $this->lists("member");
        $data["data"] = $list;
        return $this->jsonReturn($data);
    }
}