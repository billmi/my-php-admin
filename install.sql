/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : hua

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-02-16 18:20:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `fl_action`
-- ----------------------------
DROP TABLE IF EXISTS `fl_action`;
CREATE TABLE `fl_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of fl_action
-- ----------------------------
INSERT INTO `fl_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `fl_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `fl_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `fl_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `fl_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');

-- ----------------------------
-- Table structure for `fl_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `fl_action_log`;
CREATE TABLE `fl_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of fl_action_log
-- ----------------------------
INSERT INTO `fl_action_log` VALUES ('1', '10', '1', '2130706433', 'Menu', '129', '操作url：/admin/menu/add.html', '1', '1508472230');
INSERT INTO `fl_action_log` VALUES ('2', '10', '1', '2130706433', 'Menu', '129', '操作url：/admin/menu/edit.html', '1', '1508479422');
INSERT INTO `fl_action_log` VALUES ('3', '10', '1', '2130706433', 'Menu', '130', '操作url：/admin/menu/add.html', '1', '1508479860');
INSERT INTO `fl_action_log` VALUES ('4', '1', '1', '2130706433', 'member', '1', '在2017-10-20 17:57登录了后台', '1', '1508493473');
INSERT INTO `fl_action_log` VALUES ('5', '1', '1', '2130706433', 'member', '1', '在2017-10-20 17:58登录了后台', '1', '1508493481');
INSERT INTO `fl_action_log` VALUES ('6', '1', '2', '2130706433', 'member', '2', '在2017-10-20 18:01登录了后台', '1', '1508493702');
INSERT INTO `fl_action_log` VALUES ('7', '1', '2', '2130706433', 'member', '2', '在2017-10-20 18:01登录了后台', '1', '1508493719');
INSERT INTO `fl_action_log` VALUES ('8', '1', '1', '2130706433', 'member', '1', '在2017-10-20 18:32登录了后台', '1', '1508495546');
INSERT INTO `fl_action_log` VALUES ('9', '9', '1', '2130706433', 'channel', '0', '操作url：/admin/channel/del/id/3.html', '1', '1508722890');
INSERT INTO `fl_action_log` VALUES ('10', '9', '1', '2130706433', 'channel', '0', '操作url：/admin/channel/del/id/2.html', '1', '1508722895');
INSERT INTO `fl_action_log` VALUES ('11', '10', '1', '2130706433', 'Menu', '131', '操作url：/admin/menu/add.html', '1', '1550219175');
INSERT INTO `fl_action_log` VALUES ('12', '10', '1', '2130706433', 'Menu', '132', '操作url：/admin/menu/add.html', '1', '1550219221');
INSERT INTO `fl_action_log` VALUES ('13', '10', '1', '2130706433', 'Menu', '131', '操作url：/admin/menu/edit.html', '1', '1550219396');
INSERT INTO `fl_action_log` VALUES ('14', '10', '1', '2130706433', 'Menu', '132', '操作url：/admin/menu/edit.html', '1', '1550219408');
INSERT INTO `fl_action_log` VALUES ('15', '10', '1', '2130706433', 'Menu', '132', '操作url：/admin/menu/edit.html', '1', '1550219448');
INSERT INTO `fl_action_log` VALUES ('16', '10', '1', '2130706433', 'Menu', '133', '操作url：/admin/menu/add.html', '1', '1550219562');
INSERT INTO `fl_action_log` VALUES ('17', '10', '1', '2130706433', 'Menu', '134', '操作url：/admin/menu/add.html', '1', '1550220976');

-- ----------------------------
-- Table structure for `fl_addons`
-- ----------------------------
DROP TABLE IF EXISTS `fl_addons`;
CREATE TABLE `fl_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of fl_addons
-- ----------------------------
INSERT INTO `fl_addons` VALUES ('39', 'editor', '前台编辑器', '用于增强整站长文本的输入和显示', '0', '{\"editor_type\":\"1\",\"editor_wysiwyg\":1,\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1478444756', '0');
INSERT INTO `fl_addons` VALUES ('40', 'devteam', '开发团队信息', '开发团队成员信息', '1', '{\"title\":\"TwoThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1478444759', '0');
INSERT INTO `fl_addons` VALUES ('41', 'editorforadmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"2\",\"editor_markdownpreview\":\"1\",\"editor_height\":\"400px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.2', '1478523762', '0');
INSERT INTO `fl_addons` VALUES ('43', 'systeminfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1478523796', '0');
INSERT INTO `fl_addons` VALUES ('45', 'sitestat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1478523840', '0');
INSERT INTO `fl_addons` VALUES ('46', 'socialcomment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"2118746\",\"comment_short_name_duoshuo\":\"twothink.cn\",\"comment_form_pos_duoshuo\":\"buttom\",\"comment_data_list_duoshuo\":\"10\",\"comment_data_order_duoshuo\":\"asc\"}', 'thinkphp', '0.1', '1478523917', '0');

-- ----------------------------
-- Table structure for `fl_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `fl_auth_group`;
CREATE TABLE `fl_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fl_auth_group
-- ----------------------------
INSERT INTO `fl_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '', '1', '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,100,102,103');
INSERT INTO `fl_auth_group` VALUES ('2', 'admin', '1', '测试用户', '测试用户', '1', '1,2,7,8,9,10,11,12,13,14,15,16,17,18,26,79,88,195,220');

-- ----------------------------
-- Table structure for `fl_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `fl_auth_group_access`;
CREATE TABLE `fl_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fl_auth_group_access
-- ----------------------------
INSERT INTO `fl_auth_group_access` VALUES ('2', '2');

-- ----------------------------
-- Table structure for `fl_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `fl_auth_rule`;
CREATE TABLE `fl_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=222 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fl_auth_rule
-- ----------------------------
INSERT INTO `fl_auth_rule` VALUES ('1', 'admin', '2', 'admin/Index/index', '首页', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('2', 'admin', '2', 'admin/Article/index', '内容', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('3', 'admin', '2', 'admin/User/index', '用户', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('4', 'admin', '2', 'admin/Addons/index', '扩展', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('5', 'admin', '2', 'admin/Config/group', '系统', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('7', 'admin', '1', 'admin/article/add', '新增', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('8', 'admin', '1', 'admin/article/edit', '编辑', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('9', 'admin', '1', 'admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('10', 'admin', '1', 'admin/article/update', '保存', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('11', 'admin', '1', 'admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('12', 'admin', '1', 'admin/article/move', '移动', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('13', 'admin', '1', 'admin/article/copy', '复制', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('14', 'admin', '1', 'admin/article/paste', '粘贴', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('15', 'admin', '1', 'admin/article/permit', '还原', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('16', 'admin', '1', 'admin/article/clear', '清空', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('17', 'admin', '1', 'admin/Article/examine', '审核列表', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('18', 'admin', '1', 'admin/article/recycle', '回收站', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('19', 'admin', '1', 'admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('20', 'admin', '1', 'admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('21', 'admin', '1', 'admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('22', 'admin', '1', 'admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('23', 'admin', '1', 'admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('24', 'admin', '1', 'admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('25', 'admin', '1', 'admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('26', 'admin', '1', 'admin/User/index', '用户信息', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('27', 'admin', '1', 'admin/User/action', '用户行为', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('28', 'admin', '1', 'admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('29', 'admin', '1', 'admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('30', 'admin', '1', 'admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('31', 'admin', '1', 'admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('32', 'admin', '1', 'admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('33', 'admin', '1', 'admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('34', 'admin', '1', 'admin/AuthManager/group', '授权', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('35', 'admin', '1', 'admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('36', 'admin', '1', 'admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('37', 'admin', '1', 'admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('38', 'admin', '1', 'admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('39', 'admin', '1', 'admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('40', 'admin', '1', 'admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('41', 'admin', '1', 'admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('42', 'admin', '1', 'admin/Addons/create', '创建', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('43', 'admin', '1', 'admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('44', 'admin', '1', 'admin/Addons/preview', '预览', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('45', 'admin', '1', 'admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('46', 'admin', '1', 'admin/Addons/config', '设置', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('47', 'admin', '1', 'admin/Addons/disable', '禁用', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('48', 'admin', '1', 'admin/Addons/enable', '启用', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('49', 'admin', '1', 'admin/Addons/install', '安装', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('50', 'admin', '1', 'admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('51', 'admin', '1', 'admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('52', 'admin', '1', 'admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('53', 'admin', '1', 'admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('54', 'admin', '1', 'admin/Addons/index', '插件管理', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('55', 'admin', '1', 'admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('56', 'admin', '1', 'admin/model/add', '新增', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('57', 'admin', '1', 'admin/model/edit', '编辑', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('58', 'admin', '1', 'admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('59', 'admin', '1', 'admin/model/update', '保存数据', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('60', 'admin', '1', 'admin/Model/index', '模型管理', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('61', 'admin', '1', 'admin/Config/edit', '编辑', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('62', 'admin', '1', 'admin/Config/del', '删除', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('63', 'admin', '1', 'admin/Config/add', '新增', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('64', 'admin', '1', 'admin/Config/save', '保存', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('65', 'admin', '1', 'admin/Config/group', '网站设置', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('66', 'admin', '1', 'admin/Config/index', '配置管理', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('67', 'admin', '1', 'admin/Channel/add', '新增', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('68', 'admin', '1', 'admin/Channel/edit', '编辑', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('69', 'admin', '1', 'admin/Channel/del', '删除', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('70', 'admin', '1', 'admin/Channel/index', '导航管理', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('71', 'admin', '1', 'admin/Category/edit', '编辑', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('72', 'admin', '1', 'admin/Category/add', '新增', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('73', 'admin', '1', 'admin/Category/remove', '删除', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('74', 'admin', '1', 'admin/Category/index', '分类管理', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('79', 'admin', '1', 'admin/article/batchOperate', '导入', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('80', 'admin', '1', 'admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('81', 'admin', '1', 'admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('82', 'admin', '1', 'admin/Database/export', '备份', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('83', 'admin', '1', 'admin/Database/optimize', '优化表', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('84', 'admin', '1', 'admin/Database/repair', '修复表', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('86', 'admin', '1', 'admin/Database/import', '恢复', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('87', 'admin', '1', 'admin/Database/del', '删除', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('88', 'admin', '1', 'admin/User/add', '新增用户', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('89', 'admin', '1', 'admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('90', 'admin', '1', 'admin/Attribute/add', '新增', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('91', 'admin', '1', 'admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('92', 'admin', '1', 'admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('93', 'admin', '1', 'admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('94', 'admin', '1', 'admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('95', 'admin', '1', 'admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('100', 'admin', '1', 'admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('102', 'admin', '1', 'admin/Menu/add', '新增', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('103', 'admin', '1', 'admin/Menu/edit', '编辑', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('107', 'admin', '1', 'admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('108', 'admin', '1', 'admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('109', 'admin', '1', 'admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('110', 'admin', '1', 'admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('195', 'admin', '2', 'admin/other', '其他', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('205', 'admin', '1', 'admin/think/add', '新增数据', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('206', 'admin', '1', 'admin/think/edit', '编辑数据', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('207', 'admin', '1', 'admin/Menu/import', '导入', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('208', 'admin', '1', 'admin/Model/generate', '生成', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('209', 'admin', '1', 'admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('210', 'admin', '1', 'admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('211', 'admin', '1', 'admin/Article/sort', '文档排序', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('212', 'admin', '1', 'admin/Config/sort', '排序', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('213', 'admin', '1', 'admin/Menu/sort', '排序', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('214', 'admin', '1', 'admin/Channel/sort', '排序', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('215', 'admin', '1', 'admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('216', 'admin', '1', 'admin/Category/operate/type/merge', '合并', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('217', 'admin', '1', 'admin/article/index', '文档列表', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('218', 'admin', '1', 'admin/think/lists', '数据列表', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('219', 'admin', '2', 'admin/Ymenu/index', 'two助手', '-1', '');
INSERT INTO `fl_auth_rule` VALUES ('220', 'admin', '2', 'admin/Member/index', '会员', '1', '');
INSERT INTO `fl_auth_rule` VALUES ('221', 'admin', '1', 'admin/Member/index', '会员管理', '1', '');

-- ----------------------------
-- Table structure for `fl_channel`
-- ----------------------------
DROP TABLE IF EXISTS `fl_channel`;
CREATE TABLE `fl_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fl_channel
-- ----------------------------
INSERT INTO `fl_channel` VALUES ('1', '0', '首页', 'Index/index', '1', '1379475111', '1379923177', '1', '0');

-- ----------------------------
-- Table structure for `fl_config`
-- ----------------------------
DROP TABLE IF EXISTS `fl_config`;
CREATE TABLE `fl_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fl_config
-- ----------------------------
INSERT INTO `fl_config` VALUES ('1', 'web_site_title', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', 'Flo后台系统', '1');
INSERT INTO `fl_config` VALUES ('2', 'web_site_description', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', 'Flo后台系统', '2');
INSERT INTO `fl_config` VALUES ('3', 'web_site_keyword', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', 'Flo后台系统', '3');
INSERT INTO `fl_config` VALUES ('4', 'web_site_close', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '4');
INSERT INTO `fl_config` VALUES ('9', 'config_type_list', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '4');
INSERT INTO `fl_config` VALUES ('10', 'web_site_icp', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '5');
INSERT INTO `fl_config` VALUES ('13', 'color_style', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格仅对默认主题有效', '1379122533', '1479986226', '1', 'default_color', '8');
INSERT INTO `fl_config` VALUES ('20', 'config_group_list', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', '12');
INSERT INTO `fl_config` VALUES ('21', 'hooks_type', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '16');
INSERT INTO `fl_config` VALUES ('22', 'auth_config', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'auth_on:1\r\nauth_type:2', '22');
INSERT INTO `fl_config` VALUES ('23', 'open_draftbox', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '2');
INSERT INTO `fl_config` VALUES ('24', 'draft_aotosave_interval', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '5');
INSERT INTO `fl_config` VALUES ('25', 'list_rows', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '10', '27');
INSERT INTO `fl_config` VALUES ('26', 'user_allow_register', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '8');
INSERT INTO `fl_config` VALUES ('27', 'codemirror_theme', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '9');
INSERT INTO `fl_config` VALUES ('28', 'data_backup_path', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './static/data/', '14');
INSERT INTO `fl_config` VALUES ('29', 'data_backup_part_size', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '19');
INSERT INTO `fl_config` VALUES ('30', 'data_backup_compress', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '24');
INSERT INTO `fl_config` VALUES ('31', 'data_backup_compress_level', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '29');
INSERT INTO `fl_config` VALUES ('32', 'develop_mode', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '30');
INSERT INTO `fl_config` VALUES ('33', 'allow_visit', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '6');
INSERT INTO `fl_config` VALUES ('34', 'deny_visit', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '10');
INSERT INTO `fl_config` VALUES ('35', 'reply_list_rows', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '10', '13');
INSERT INTO `fl_config` VALUES ('36', 'admin_allow_ip', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '31');
INSERT INTO `fl_config` VALUES ('37', 'app_trace', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '3');
INSERT INTO `fl_config` VALUES ('38', 'app_debug', '4', '应用调试模式', '4', '0:关闭\r\n1:开启', '网站正式部署建议关闭', '1478522232', '1478522395', '1', '1', '15');
INSERT INTO `fl_config` VALUES ('39', 'template.view_path', '1', '模板主题', '0', 'dd', '', '1479883093', '1479883093', '1', 'dd', '17');
INSERT INTO `fl_config` VALUES ('40', 'admin_view_path', '4', '后台模板主题', '1', 'default:默认 ', '添加主题请在配置管理添加', '1479986058', '1479991430', '1', 'default', '6');
INSERT INTO `fl_config` VALUES ('41', 'home_view_path', '4', '前台模板主题', '1', 'default:默认', '添加主题请在配置管理添加', '1479986147', '1479991437', '1', 'default', '7');

-- ----------------------------
-- Table structure for `fl_file`
-- ----------------------------
DROP TABLE IF EXISTS `fl_file`;
CREATE TABLE `fl_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(50) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of fl_file
-- ----------------------------

-- ----------------------------
-- Table structure for `fl_hooks`
-- ----------------------------
DROP TABLE IF EXISTS `fl_hooks`;
CREATE TABLE `fl_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fl_hooks
-- ----------------------------
INSERT INTO `fl_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '', '1');
INSERT INTO `fl_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'returntop', '1');
INSERT INTO `fl_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', '', '1');
INSERT INTO `fl_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'socialcomment,digg', '1');
INSERT INTO `fl_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '', '1');
INSERT INTO `fl_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', '', '1');
INSERT INTO `fl_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'editor', '1');
INSERT INTO `fl_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'editorforadmin', '1');
INSERT INTO `fl_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1479394250', 'sitestat,systeminfo,devteam', '1');
INSERT INTO `fl_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'editor', '1');
INSERT INTO `fl_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '', '1');

-- ----------------------------
-- Table structure for `fl_member`
-- ----------------------------
DROP TABLE IF EXISTS `fl_member`;
CREATE TABLE `fl_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(50) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phone_area` varchar(10) DEFAULT '+86',
  `id_card` varchar(50) DEFAULT NULL,
  `truename` varchar(100) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of fl_member
-- ----------------------------
INSERT INTO `fl_member` VALUES ('1', null, '13511111111', '297876764@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '86', '2', '李四', '0', '2017', '2017');
INSERT INTO `fl_member` VALUES ('2', null, '18589031111', '297876765@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '86', '2', null, '0', '2017', '2017');
INSERT INTO `fl_member` VALUES ('3', null, '13611111111', '297876766@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '86', '3', null, '0', '2017', '2017');
INSERT INTO `fl_member` VALUES ('4', null, '18589032222', '297876767@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '86', '4', null, '1', '2017', '2017');
INSERT INTO `fl_member` VALUES ('5', null, '13711111111', '297876768@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '86', '5', null, '1', '2017', '2017');
INSERT INTO `fl_member` VALUES ('6', null, '13811111111', '297876769@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '86', '6', null, '1', '2017', '2017');
INSERT INTO `fl_member` VALUES ('7', null, '18589033333', '297876770@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '86', '7', null, '1', '2017', '2017');
INSERT INTO `fl_member` VALUES ('8', null, '18589066666', '297876771@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '86', '8', '123', '1', '2017', '2017');

-- ----------------------------
-- Table structure for `fl_menu`
-- ----------------------------
DROP TABLE IF EXISTS `fl_menu`;
CREATE TABLE `fl_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `type` tinyint(4) NOT NULL,
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fl_menu
-- ----------------------------
INSERT INTO `fl_menu` VALUES ('16', '用户', '0', '3', '1', 'User/index', '0', '', '', '1');
INSERT INTO `fl_menu` VALUES ('17', '用户信息', '16', '0', '1', 'User/index', '0', '', '用户管理', '1');
INSERT INTO `fl_menu` VALUES ('18', '新增用户', '17', '0', '1', 'User/add', '0', '添加新用户', '', '1');
INSERT INTO `fl_menu` VALUES ('19', '用户行为', '16', '0', '1', 'User/action', '0', '', '行为管理', '1');
INSERT INTO `fl_menu` VALUES ('20', '新增用户行为', '19', '0', '1', 'User/addaction', '0', '', '', '1');
INSERT INTO `fl_menu` VALUES ('21', '编辑用户行为', '19', '0', '1', 'User/editaction', '0', '', '', '1');
INSERT INTO `fl_menu` VALUES ('22', '保存用户行为', '19', '0', '1', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '1');
INSERT INTO `fl_menu` VALUES ('23', '变更行为状态', '19', '0', '1', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '1');
INSERT INTO `fl_menu` VALUES ('24', '禁用会员', '19', '0', '1', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '1');
INSERT INTO `fl_menu` VALUES ('25', '启用会员', '19', '0', '1', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '1');
INSERT INTO `fl_menu` VALUES ('26', '删除会员', '19', '0', '1', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '1');
INSERT INTO `fl_menu` VALUES ('27', '权限管理', '16', '0', '1', 'AuthManager/index', '0', '', '用户管理', '1');
INSERT INTO `fl_menu` VALUES ('28', '删除', '27', '0', '1', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '1');
INSERT INTO `fl_menu` VALUES ('29', '禁用', '27', '0', '1', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '1');
INSERT INTO `fl_menu` VALUES ('30', '恢复', '27', '0', '1', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '1');
INSERT INTO `fl_menu` VALUES ('31', '新增', '27', '0', '1', 'AuthManager/createGroup', '0', '创建新的用户组', '', '1');
INSERT INTO `fl_menu` VALUES ('32', '编辑', '27', '0', '1', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '1');
INSERT INTO `fl_menu` VALUES ('33', '保存用户组', '27', '0', '1', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '1');
INSERT INTO `fl_menu` VALUES ('34', '授权', '27', '0', '1', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '1');
INSERT INTO `fl_menu` VALUES ('35', '访问授权', '27', '0', '1', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '1');
INSERT INTO `fl_menu` VALUES ('36', '成员授权', '27', '0', '1', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '1');
INSERT INTO `fl_menu` VALUES ('37', '解除授权', '27', '0', '1', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '1');
INSERT INTO `fl_menu` VALUES ('38', '保存成员授权', '27', '0', '1', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '1');
INSERT INTO `fl_menu` VALUES ('39', '分类授权', '27', '0', '1', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '1');
INSERT INTO `fl_menu` VALUES ('40', '保存分类授权', '27', '0', '1', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '1');
INSERT INTO `fl_menu` VALUES ('41', '模型授权', '27', '0', '1', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '1');
INSERT INTO `fl_menu` VALUES ('42', '保存模型授权', '27', '0', '1', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '1');
INSERT INTO `fl_menu` VALUES ('43', '扩展', '0', '7', '1', 'Addons/index', '0', '', '', '1');
INSERT INTO `fl_menu` VALUES ('44', '插件管理', '43', '1', '1', 'Addons/index', '0', '', '扩展', '1');
INSERT INTO `fl_menu` VALUES ('45', '创建', '44', '0', '1', 'Addons/create', '0', '服务器上创建插件结构向导', '', '1');
INSERT INTO `fl_menu` VALUES ('46', '检测创建', '44', '0', '1', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '1');
INSERT INTO `fl_menu` VALUES ('47', '预览', '44', '0', '1', 'Addons/preview', '0', '预览插件定义类文件', '', '1');
INSERT INTO `fl_menu` VALUES ('48', '快速生成插件', '44', '0', '1', 'Addons/build', '0', '开始生成插件结构', '', '1');
INSERT INTO `fl_menu` VALUES ('49', '设置', '44', '0', '1', 'Addons/config', '0', '设置插件配置', '', '1');
INSERT INTO `fl_menu` VALUES ('50', '禁用', '44', '0', '1', 'Addons/disable', '0', '禁用插件', '', '1');
INSERT INTO `fl_menu` VALUES ('51', '启用', '44', '0', '1', 'Addons/enable', '0', '启用插件', '', '1');
INSERT INTO `fl_menu` VALUES ('52', '安装', '44', '0', '1', 'Addons/install', '0', '安装插件', '', '1');
INSERT INTO `fl_menu` VALUES ('53', '卸载', '44', '0', '1', 'Addons/uninstall', '0', '卸载插件', '', '1');
INSERT INTO `fl_menu` VALUES ('54', '更新配置', '44', '0', '1', 'Addons/saveconfig', '0', '更新插件配置处理', '', '1');
INSERT INTO `fl_menu` VALUES ('55', '插件后台列表', '44', '0', '1', 'Addons/adminList', '0', '', '', '1');
INSERT INTO `fl_menu` VALUES ('56', 'URL方式访问插件', '44', '0', '1', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '1');
INSERT INTO `fl_menu` VALUES ('57', '钩子管理', '43', '2', '1', 'Addons/hooks', '0', '', '扩展', '1');
INSERT INTO `fl_menu` VALUES ('68', '系统', '0', '4', '1', 'Config/group', '0', '', '', '1');
INSERT INTO `fl_menu` VALUES ('69', '网站设置', '68', '1', '1', 'Config/group', '0', '', '系统设置', '1');
INSERT INTO `fl_menu` VALUES ('70', '配置管理', '68', '4', '1', 'Config/index', '0', '', '系统设置', '1');
INSERT INTO `fl_menu` VALUES ('71', '编辑', '70', '0', '1', 'Config/edit', '0', '新增编辑和保存配置', '', '1');
INSERT INTO `fl_menu` VALUES ('72', '删除', '70', '0', '1', 'Config/del', '0', '删除配置', '', '1');
INSERT INTO `fl_menu` VALUES ('73', '新增', '70', '0', '1', 'Config/add', '0', '新增配置', '', '1');
INSERT INTO `fl_menu` VALUES ('74', '保存', '70', '0', '1', 'Config/save', '0', '保存配置', '', '1');
INSERT INTO `fl_menu` VALUES ('75', '菜单管理', '68', '5', '1', 'Menu/index', '0', '', '系统设置', '1');
INSERT INTO `fl_menu` VALUES ('76', '导航管理', '68', '6', '1', 'Channel/index', '0', '', '系统设置', '1');
INSERT INTO `fl_menu` VALUES ('77', '新增', '76', '0', '1', 'Channel/add', '0', '', '', '1');
INSERT INTO `fl_menu` VALUES ('78', '编辑', '76', '0', '1', 'Channel/edit', '0', '', '', '1');
INSERT INTO `fl_menu` VALUES ('79', '删除', '76', '0', '1', 'Channel/del', '0', '', '', '1');
INSERT INTO `fl_menu` VALUES ('86', '备份数据库', '68', '0', '1', 'Database/index?type=export', '0', '', '数据备份', '1');
INSERT INTO `fl_menu` VALUES ('87', '备份', '86', '0', '1', 'Database/export', '0', '备份数据库', '', '1');
INSERT INTO `fl_menu` VALUES ('88', '优化表', '86', '0', '1', 'Database/optimize', '0', '优化数据表', '', '1');
INSERT INTO `fl_menu` VALUES ('89', '修复表', '86', '0', '1', 'Database/repair', '0', '修复数据表', '', '1');
INSERT INTO `fl_menu` VALUES ('90', '还原数据库', '68', '0', '1', 'Database/index?type=import', '0', '', '数据备份', '1');
INSERT INTO `fl_menu` VALUES ('91', '恢复', '90', '0', '1', 'Database/import', '0', '数据库恢复', '', '1');
INSERT INTO `fl_menu` VALUES ('92', '删除', '90', '0', '1', 'Database/del', '0', '删除备份文件', '', '1');
INSERT INTO `fl_menu` VALUES ('93', '其他', '0', '5', '1', 'other', '1', '', '', '1');
INSERT INTO `fl_menu` VALUES ('96', '新增', '75', '0', '1', 'Menu/add', '0', '', '系统设置', '1');
INSERT INTO `fl_menu` VALUES ('98', '编辑', '75', '0', '1', 'Menu/edit', '0', '', '', '1');
INSERT INTO `fl_menu` VALUES ('106', '行为日志', '16', '0', '1', 'Action/actionlog', '0', '', '行为管理', '1');
INSERT INTO `fl_menu` VALUES ('108', '修改密码', '16', '0', '1', 'User/updatePassword', '1', '', '', '1');
INSERT INTO `fl_menu` VALUES ('109', '修改昵称', '16', '0', '1', 'User/updateNickname', '1', '', '', '1');
INSERT INTO `fl_menu` VALUES ('110', '查看行为日志', '106', '0', '1', 'action/edit', '1', '', '', '1');
INSERT INTO `fl_menu` VALUES ('112', '新增数据', '58', '0', '1', 'think/add', '1', '', '', '1');
INSERT INTO `fl_menu` VALUES ('113', '编辑数据', '58', '0', '1', 'think/edit', '1', '', '', '1');
INSERT INTO `fl_menu` VALUES ('114', '导入', '75', '0', '1', 'Menu/import', '0', '', '', '1');
INSERT INTO `fl_menu` VALUES ('115', '生成', '58', '0', '1', 'Model/generate', '0', '', '', '1');
INSERT INTO `fl_menu` VALUES ('116', '新增钩子', '57', '0', '1', 'Addons/addHook', '0', '', '', '1');
INSERT INTO `fl_menu` VALUES ('117', '编辑钩子', '57', '0', '1', 'Addons/edithook', '0', '', '', '1');
INSERT INTO `fl_menu` VALUES ('119', '排序', '70', '0', '1', 'Config/sort', '1', '', '', '1');
INSERT INTO `fl_menu` VALUES ('120', '排序', '75', '0', '1', 'Menu/sort', '1', '', '', '1');
INSERT INTO `fl_menu` VALUES ('121', '排序', '76', '0', '1', 'Channel/sort', '1', '', '', '1');
INSERT INTO `fl_menu` VALUES ('122', '数据列表', '58', '0', '1', 'think/lists', '1', '', '', '1');
INSERT INTO `fl_menu` VALUES ('123', '审核列表', '3', '0', '1', 'Article/examine', '1', '', '', '1');
INSERT INTO `fl_menu` VALUES ('129', '会员', '0', '0', '2', 'Member/index', '0', '会员', '会员', '1');
INSERT INTO `fl_menu` VALUES ('130', '会员管理', '129', '0', '2', 'Member/index', '0', '会员信息管理', '会员管理', '1');
INSERT INTO `fl_menu` VALUES ('131', '其他组', '0', '0', '2', 'Other/index', '0', '其他组', '其他组', '1');
INSERT INTO `fl_menu` VALUES ('132', '其他管理', '132', '0', '2', 'Member/index', '0', '其他管理', '其他管理', '1');
INSERT INTO `fl_menu` VALUES ('133', '其他管理', '131', '0', '2', 'Other/index', '0', '其他管理', '其他管理', '1');
INSERT INTO `fl_menu` VALUES ('134', '其他二分', '131', '0', '2', 'Test/test#', '0', '其他二分', '其他二分', '1');

-- ----------------------------
-- Table structure for `fl_picture`
-- ----------------------------
DROP TABLE IF EXISTS `fl_picture`;
CREATE TABLE `fl_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fl_picture
-- ----------------------------
INSERT INTO `fl_picture` VALUES ('1', '/static/uploads/picture/20171020\\7edb7fe94f5fbbe155440ae708a79989.jpg', '', '5b5cc4e7025764d8e1b5d28411b99ccc', '2630d844e4ec60de68919e7f34863ce581c1025d', '1', '1508464711');

-- ----------------------------
-- Table structure for `fl_user`
-- ----------------------------
DROP TABLE IF EXISTS `fl_user`;
CREATE TABLE `fl_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of fl_user
-- ----------------------------
INSERT INTO `fl_user` VALUES ('1', 'admin', '741762d3efb271dd64c9321d02e03b50', 'admin@admin.com', '', '1508408915', '2130706433', '1550219071', '2130706433', '1508744534', '1');
INSERT INTO `fl_user` VALUES ('2', 'user123', '741762d3efb271dd64c9321d02e03b50', '297876771@qq.com', '', '1508472335', '2130706433', '1550225099', '2130706433', '1508472335', '1');
