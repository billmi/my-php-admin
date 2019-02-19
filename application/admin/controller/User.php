<?php

namespace app\admin\controller;
use app\common\controller\UcApi;

/**
 * 后台管理员用户
 */
class User extends Admin{

    /**
     * 用户管理首页
     */
    public function index(){
        $username       =   input('username');
        $map['status']  =   array('egt',0);
        if(is_numeric($username)){
            $map['id|username']=   array('like','%'.$username.'%');
        }else{
            $map['username']    =   array('like', '%'.(string)$username.'%');
        }

        $list   = $this->lists('User', $map);
        int_to_string($list);
        $this->assign('_list', $list);
        $this->assign('meta_title','用户信息');
        return $this->fetch();
    }

    /**
     * 修改密码初始化
     * updatePassword
     * @return mixed
     */
    public function updatePassword(){
        $this->assign('meta_title','修改密码');
        return $this->fetch('updatepassword');
    }

    /**
     * submitPassword
     * 修改密码
     */
    public function submitPassword(){
        //获取参数
        $password   =   input('post.old');
        empty($password) && $this->error('请输入原密码');
        $data['password'] = input('post.password');
        empty($data['password']) && $this->error('请输入新密码');
        $repassword = input('post.repassword');
        empty($repassword) && $this->error('请输入确认密码');

        if($data['password'] !== $repassword){
            $this->error('您输入的新密码与确认密码不一致');
        }

        $Api    =   new UcApi();
        $res    =   $Api->updateInfo(UID, $password, $data);
        if($res['status']){
            $this->success('修改密码成功！');
        }else{
            $this->error($res['info']);
        }
    }

    /**
     * 用户行为列表
     *
     */
    public function action(){
        //获取列表数据
        $Action =   \think\Db::name('Action')->where(array('status'=>array('gt',-1)));
        $list   =   $this->lists($Action);
        int_to_string($list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);
        $this->assign('_list', $list);
        $this->assign('meta_title','用户行为');
        return $this->fetch();
    }

    /**
     * 新增行为
     *
     */
    public function addAction(){
        $this->assign('meta_title','新增行为');
        $this->assign('data',null);
        return $this->fetch('editaction');
    }

    /**
     * 编辑行为
     *
     */
    public function editAction(){
        $id = input('id');
        empty($id) && $this->error('参数不能为空！');
        $data = \think\Db::name('Action')->field(true)->find($id);

        $this->assign('data',$data);
        $this->assign('meta_title', '编辑行为');
        return $this->fetch('editaction');
    }

    /**
     * 更新行为
     *
     */
    public function saveAction(){
    	$validate = validate('action');
    	if(!$validate->check(input())){
    		return $this->error($validate->getError());
    	}
        $res = model('Action')->updates();
        if(!$res){
            $this->error(model('Action')->getError());
        }else{
            $this->success(isset($res['id'])?'更新成功！':'新增成功！', Cookie('__forward__'));
        }
    }

    /**
     * 会员状态修改
     */
    public function changeStatus($id = null,$method=null){

        $id = is_array($id) ? implode(',',$id) : $id;
        if ( empty($id) ) {
            $this->error('请选择要操作的数据!');
        }

        $map['id'] =   array('in',$id);
        switch ( strtolower($method) ){
            case 'forbiduser':
                $this->forbid('User', $map );
                break;
            case 'resumeuser':
                $this->resume('User', $map );
                break;
            case 'deleteuser':
                $this->delete('User', $map );
                break;
            default:
                $this->error('参数非法');
        }
    }

    public function add($username = '', $password = '', $repassword = '', $email = ''){
        if(request()->isPost()){
            /* 检测密码 */
            if($password != $repassword){
                $this->error('密码和重复密码不一致！');
            }

            /* 调用注册接口注册用户 */
            $User   =   new UcApi;
            $uid    =   $User->register($username, $password, $email,'','admin');
            if(0 < $uid){ //注册成功
                $user = array('uid' => $uid, 'nickname' => $username, 'status' => 1);
                if(!db('User',[],false)->insert($user)){
                    $this->error('用户添加失败！');
                } else {
                    $this->success('用户添加成功！',url('index'));
                }
            } else { //注册失败，显示错误信息
                $this->error($uid);
            }
        } else {
            $this->assign('meta_title','新增用户') ;
            return $this->fetch();
        }
    }

    /**
     * 获取用户注册错误信息
     * @param  integer $code 错误编码
     * @return string        错误信息
     */
    private function showRegError($code = 0){
        switch ($code) {
            case -1:  $error = '用户名长度必须在16个字符以内！'; break;
            case -2:  $error = '用户名被禁止注册！'; break;
            case -3:  $error = '用户名被占用！'; break;
            case -4:  $error = '密码长度必须在6-30个字符之间！'; break;
            case -5:  $error = '邮箱格式不正确！'; break;
            case -6:  $error = '邮箱长度必须在1-32个字符之间！'; break;
            case -7:  $error = '邮箱被禁止注册！'; break;
            case -8:  $error = '邮箱被占用！'; break;
            case -9:  $error = '手机格式不正确！'; break;
            case -10: $error = '手机被禁止注册！'; break;
            case -11: $error = '手机号被占用！'; break;
            default:  $error = '未知错误';
        }
        return $error;
    }

}
