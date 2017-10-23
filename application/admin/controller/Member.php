<?php


namespace app\admin\controller;


/**
 * Class Member
 * @package app\admin\controller
 * @author Bill
 */
class Member extends Admin{

    /**
     * 会员管理首页
     * index
     * @return mixed
     * @author Bill
     */
    public function index(){
        $map = [];
        $map['status'] = ["EGT",DEL_STATUS];
        $field = input('field');
        $value = trim(input('value'));
        if($field && $value){
            $map[$field] = ['LIKE','%'.$value.'%'];
        }
        $list   = $this->lists('Member', $map,'id DESC');
        $this->assign('_list', $list);
        $this->assign('meta_title','会员管理');
        return $this->fetch();
    }

    /**
     * 会员编辑
     * edit
     * @param null $id
     * @return mixed
     * @author Bill
     */
    public function edit($id = null){
        if(request()->isPost()){
            $data = input('post.');
            $this->editRow(   'Member' , $data,['id'=>$data['id']]);
        }
        $memberInfo = db('Member')->where(['id' => $id])->find();
        $this->assign('meta_title','用户编辑') ;
        return $this->fetch('edit',['info' => $memberInfo]);
    }

    /**
     * 状态管理
     * edit
     * @param null $id
     * @return mixed
     * @author Bill
     */
    public function changeStatus(){
        $this->setStatus("Member");
    }

}