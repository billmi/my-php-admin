<?php

namespace app\admin\controller;

use app\common\controller\Common;

class Index extends Common{

    public function index(){
        return $this->redirect("Publics/login");
    }

}