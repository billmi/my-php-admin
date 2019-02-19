<?php


namespace app\admin\controller;


/**
 * Class Banner
 * @package app\admin\controller
 * @author Bill
 */
class Banner extends Admin
{

    /**
     * 主体管理
     * @return mixed
     * @author Bill
     */
    public function index()
    {
        $map = [];
        $map['status'] = ["EGT", DEL_STATUS];
        $field = input('field');
        $value = trim(input('value'));
        if ($field && $value) {
            $map[$field] = ['LIKE', '%' . $value . '%'];
        }
        $list = $this->lists('Banner', $map, 'id DESC');
        $this->assign('_list', $list);
        $this->assign('meta_title', '导航广告');
        return $this->fetch();
    }


    /**
     * 编辑
     * @param null $id
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @author Bill
     */
    public function edit($id = null)
    {
        if (request()->isPost()) {
            $data = input('post.');
            $this->editRow('Banner', $data, ['id' => $data['id']]);
        }
        $bannerInfo = db('Banner')->where(['id' => $id])->find();
        $this->assign('meta_title', 'Banner编辑');
        $this->assign('field', ["name" => "pic_id"]);
        return $this->fetch('edit', ['info' => $bannerInfo]);
    }

    /**
     * 状态管理
     * edit
     * @param null $id
     * @return mixed
     * @author Bill
     */
    public function changeStatus()
    {
        $this->setStatus("Banner");
    }

}