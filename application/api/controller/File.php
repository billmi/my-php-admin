<?php

namespace app\api\controller;

use think\Request;

/**
 * 文件控制器
 * 主要用于下载模型的文件上传和下载
 */
class File extends Api
{
    /* 文件上传 */
    public function upload()
    {
        $return = array('status' => 1, 'info' => '上传成功', 'data' => '');
        //TODO: 用户登录检测
        /* 调用文件上传组件上传文件 */
        $file = request()->file('download');
        if (empty($file)) {
            $this->error('请选择上传文件');
        }
        $File = model('file');
        $info = $File->upload($file, config('download_upload'));
        /* 记录文件信息 */
        if ($info) {
            $return['data'] = think_encrypt(json_encode($info));
            $return['info'] = $info['name'];
        } else {
            $return['status'] = 0;
            $return['info'] = $File->getError();
        }
        /* 返回JSON数据 */
        return json($return);
    }

    /* 下载文件 */
    public function download($id = null)
    {
        if (empty($id) || !is_numeric($id)) {
            $this->error('参数错误！');
        }

        $logic = model('Download', 'Logic');
        if (!$logic->download($id)) {
            $this->error($logic->getError());
        }

    }

    /**
     * 图片上传
     * @author Bill
     */
    public function uploadPicture()
    {
        if (Request::instance()->isPost()) {
            //TODO: 接口权限检测,前期不做

            /* 调用文件上传组件上传文件 */
            $file = request()->file('pic_file');

            if (empty($file)) {
                return $this->errReturn("请选择上传文件!");
            }

            $Picture = model('picture');
            $info = $Picture->upload($file, config('picture_upload'));
            //TODO:上传到远程服务器

            if (!$info)
                return $this->errReturn($Picture->getError());

            $reData = [];
            $reData['path'] = config("domain")  . $info['path'];
            return $this->successReturn("图片上传成功!", $reData['path']);
        }
    }
}
