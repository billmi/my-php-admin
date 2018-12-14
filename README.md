base tp5

1.请先导入install.sql文件，基本已经很纯净了

2.修改application下database.php里面的数据库配置

3.通用组件集成在路由
http://YourPath/admin/commonx/index;

4.ngixn重写配置在nginx.conf里,请按合适的进行适当修改配置

已有一个单表维护demo在Member控制器下

登录用户(超级管理员)
admin
123456

普通用户
user123
123456


注意:博主已将权限管理屏蔽,这个按需求重写,或者再精简掉!

感谢您的阅览



