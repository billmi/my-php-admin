<?php
// +----------------------------------------------------------------------
// | TwoThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.twothink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 艺品网络 
// +----------------------------------------------------------------------
namespace app\admin\model;
use think\Model;

/**
 * 菜单模型
 */

class Menu extends Model {
	protected $autoWriteTimestamp = false;
	protected $auto = ['title'];
	// 新增
	protected $insert = ['status'=>1];

	const SYS_TYPE = 1;

	const USER_TYPE = 2;
	//属性修改器
	protected function setTitleAttr($value, $data)
	{
		return htmlspecialchars($value);
	} 
}