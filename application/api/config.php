<?php
return [

    // +----------------------------------------------------------------------
    // | 编辑器图片上传相关配置
    // +----------------------------------------------------------------------
    'editor_upload' => array(
        'mimes' => '', //允许上传的文件MiMe类型
        'maxSize' => 2 * 1024 * 1024, //上传的文件大小限制 (0-不做限制)
        'exts' => 'jpg,gif,png,jpeg', //允许上传的文件后缀
        'autoSub' => true, //自动子目录保存文件
        'subName' => array('date', 'Y-m-d'), //子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组
        'rootPath' => './static/uploads/editor/', //保存根路径
        'savePath' => '', //保存路径
        'saveName' => array('uniqid', ''), //上传文件命名规则，[0]-函数名，[1]-参数，多个参数使用数组
        'saveExt' => '', //文件保存后缀，空则使用原后缀
        'replace' => false, //存在同名是否覆盖
        'hash' => true, //是否生成hash编码
        'callback' => false, //检测文件是否存在回调函数，如果存在返回文件信息数组
    ),
    
    // 默认跳转页面对应的模板文件
// 	'dispatch_error_tmpl'     =>  APP_PATH .'admin'. DS .'view' . DS . 'public' . DS . 'error.html', // 默认错误跳转对应的模板文件
// 	'dispatch_success_tmpl'   =>  APP_PATH .'admin'. DS .'view' . DS . 'public' . DS . 'success.html', // 默认成功跳转对应的模板文件

//    'allow_origin' => [
//        "".  // url
//    ],

    //缓存配置
    'cache' => [
        // 驱动方式
        'type' => 'redis',
        'host' => '127.0.0.1',
        'port' => '6379',
        // 缓存前缀
        'prefix' => 'flo:',
        'expire' => 0,
        'select' => 0,
//        'password'=>''
    ],

    'domain' => "http://flo.cc"
];
