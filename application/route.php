<?php


return [
    '__pattern__' => [
        'name' => '\w+',
    ],
    '[hello]'     => [
        ':id'   => ['index/hello', ['method' => 'get'], ['id' => '\d+']],
        ':name' => ['index/hello', ['method' => 'post']],
    ],
    'home/addons/:_addons/:_controller/:_action' => 'home/addons/execute',//插件执行路由
];
