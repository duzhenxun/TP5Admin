/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50629
 Source Host           : localhost
 Source Database       : tp5admin

 Target Server Type    : MySQL
 Target Server Version : 50629
 File Encoding         : utf-8

 Date: 10/28/2016 11:06:56 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `zxcms_admin`
-- ----------------------------
DROP TABLE IF EXISTS `zxcms_admin`;
CREATE TABLE `zxcms_admin` (
  `id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `encrypt` varchar(6) NOT NULL DEFAULT '',
  `lastloginip` int(10) NOT NULL DEFAULT '0',
  `lastlogintime` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(40) NOT NULL DEFAULT '',
  `mobile` varchar(11) NOT NULL DEFAULT '',
  `realname` varchar(50) NOT NULL DEFAULT '',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(2:无效,1:有效)',
  `updatetime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `zxcms_admin`
-- ----------------------------
BEGIN;
INSERT INTO `zxcms_admin` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '2130706433', '1477015838', '5552123@qq.com', '18888873646', '阿杜', '', '1', '1477623198'), ('2', 'zhenxun', 'c2785bf6585103658d34413683ac36f8', '', '2130706433', '1476067533', '', '18888873646', '', '', '1', '1476067742'), ('3', 'zhangsan', '01d7f40760960e7bd9443513f22ab9af', '', '0', '0', '', '', '', '', '1', '0');
COMMIT;

-- ----------------------------
--  Table structure for `zxcms_admin_group`
-- ----------------------------
DROP TABLE IF EXISTS `zxcms_admin_group`;
CREATE TABLE `zxcms_admin_group` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `zxcms_admin_group`
-- ----------------------------
BEGIN;
INSERT INTO `zxcms_admin_group` VALUES ('1', '普通管理员', '密码加密只是MD5', '', '0', '1477622552'), ('2', '工作人员', '仅拥有日志管理权限', '18,23,27', '0', '1476067479');
COMMIT;

-- ----------------------------
--  Table structure for `zxcms_admin_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `zxcms_admin_group_access`;
CREATE TABLE `zxcms_admin_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `zxcms_admin_group_access`
-- ----------------------------
BEGIN;
INSERT INTO `zxcms_admin_group_access` VALUES ('2', '2'), ('3', '2');
COMMIT;

-- ----------------------------
--  Table structure for `zxcms_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `zxcms_admin_log`;
CREATE TABLE `zxcms_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `m` varchar(15) NOT NULL,
  `c` varchar(20) NOT NULL,
  `a` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` int(10) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zxcms_app`
-- ----------------------------
DROP TABLE IF EXISTS `zxcms_app`;
CREATE TABLE `zxcms_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) NOT NULL DEFAULT '',
  `price` decimal(10,0) NOT NULL DEFAULT '0',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '图标',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1软件，2游戏，3付费',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `user_id` int(11) NOT NULL COMMENT '发布人ID',
  `position` smallint(5) NOT NULL DEFAULT '0' COMMENT '位置',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '标记说明',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL COMMENT '开始时间',
  `s_time` time DEFAULT NULL,
  `date_total` int(11) DEFAULT NULL,
  `time_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时间类型：1全天，2时间段',
  PRIMARY KEY (`id`),
  KEY `nums` (`total`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zxcms_config`
-- ----------------------------
DROP TABLE IF EXISTS `zxcms_config`;
CREATE TABLE `zxcms_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zxcms_menu`
-- ----------------------------
DROP TABLE IF EXISTS `zxcms_menu`;
CREATE TABLE `zxcms_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) DEFAULT '0',
  `icon` varchar(20) NOT NULL DEFAULT '',
  `c` varchar(20) DEFAULT NULL,
  `a` varchar(20) DEFAULT NULL,
  `data` varchar(50) NOT NULL DEFAULT '',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '999',
  `display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示(1:显示,2:不显示)',
  `updatetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `zxcms_menu`
-- ----------------------------
BEGIN;
INSERT INTO `zxcms_menu` VALUES ('1', '管理设置', '0', 'fa-users', 'Admin', 'admin', '', '', '', '1', '1', '1476175413'), ('2', '管理员管理', '1', '', 'Admin', 'index', '', '', '', '0', '1', '1476175413'), ('3', '详情', '2', '', 'Admin', 'info', '', '', '', '0', '2', '1476175413'), ('4', '添加', '2', '', 'Admin', 'add', '', '', '', '0', '2', '1476175413'), ('5', '修改', '2', '', 'Admin', 'edit', '', '', '', '0', '2', '1476175413'), ('6', '删除', '2', '', 'Admin', 'del', '', '', '', '0', '2', '1476175413'), ('7', '分组管理', '1', '', 'Group', 'index', '', '', '', '0', '1', '1476175413'), ('8', '详情', '7', '', 'Group', 'info', '', '', '', '0', '2', '1476175413'), ('9', '添加', '7', '', 'Group', 'add', '', '', '', '0', '2', '1476175413'), ('10', '修改', '7', '', 'Group', 'edit', '', '', '', '0', '2', '1476175413'), ('11', '删除', '7', '', 'Group', 'del', '', '', '', '0', '2', '1476175413'), ('12', '菜单管理', '18', '', 'Menu', 'index', '', '', '', '0', '1', '1476175413'), ('13', '查看', '12', '', 'Menu', 'info', '', '', '', '0', '2', '1476175413'), ('14', '添加', '12', '', 'Menu', 'add', '', '', '', '0', '2', '1476175413'), ('15', '修改', '12', '', 'Menu', 'edit', '', '', '', '0', '2', '1476175413'), ('16', '删除', '12', '', 'Menu', 'del', '', '', '', '0', '2', '1476175413'), ('18', '系统设置', '0', 'fa-cogs', 'Menu', 'index', '', '', '', '2', '1', '1476175413'), ('22', '权限设置', '2', '', 'Group', 'rule', '', '', '', '999', '2', '1476175413'), ('23', '个人设置', '1', '', 'Admin', 'public_edit_info', '', '', '', '999', '1', '1476175413'), ('27', '日志管理', '18', '', 'Log', 'index', '', '', '', '999', '1', '1476175413'), ('31', '系统首页', '0', 'fa-bank', 'Index', 'index', '', '', '', '0', '1', '1476175413');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
