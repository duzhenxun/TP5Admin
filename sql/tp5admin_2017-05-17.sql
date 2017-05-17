# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.29-log)
# Database: tp5admin
# Generation Time: 2017-05-17 09:21:07 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table zxcms_admin
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `zxcms_admin` WRITE;
/*!40000 ALTER TABLE `zxcms_admin` DISABLE KEYS */;

INSERT INTO `zxcms_admin` (`id`, `username`, `password`, `encrypt`, `lastloginip`, `lastlogintime`, `email`, `mobile`, `realname`, `openid`, `status`, `updatetime`)
VALUES
	(1,'admin','21232f297a57a5a743894a0e4a801fc3','',2130706433,1479969414,'5552123@qq.com','18888873646','阿杜','',1,1477623198),
	(2,'zhenxun','c2785bf6585103658d34413683ac36f8','',2130706433,1476067533,'','18888873646','','',1,1477624790),
	(3,'zhangsan','01d7f40760960e7bd9443513f22ab9af','',0,0,'','','','',1,1477625400),
	(4,'test','098f6bcd4621d373cade4e832627b4f6','',2130706433,1495012830,'','','小演','',1,1479969550);

/*!40000 ALTER TABLE `zxcms_admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table zxcms_admin_group
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `zxcms_admin_group` WRITE;
/*!40000 ALTER TABLE `zxcms_admin_group` DISABLE KEYS */;

INSERT INTO `zxcms_admin_group` (`id`, `name`, `description`, `rules`, `listorder`, `updatetime`)
VALUES
	(1,'普通管理员','密码加密只是MD5','',0,1477622552),
	(2,'工作人员','仅拥有日志管理权限','18,23,27',0,1476067479),
	(3,'后台演示','只能看，不能增删改','31,1,2,3,7,8,23,18,12,13,27',0,1479969527);

/*!40000 ALTER TABLE `zxcms_admin_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table zxcms_admin_group_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `zxcms_admin_group_access`;

CREATE TABLE `zxcms_admin_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `zxcms_admin_group_access` WRITE;
/*!40000 ALTER TABLE `zxcms_admin_group_access` DISABLE KEYS */;

INSERT INTO `zxcms_admin_group_access` (`uid`, `group_id`)
VALUES
	(2,1),
	(3,1),
	(3,2),
	(4,3);

/*!40000 ALTER TABLE `zxcms_admin_group_access` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table zxcms_admin_log
# ------------------------------------------------------------

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
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `zxcms_admin_log` WRITE;
/*!40000 ALTER TABLE `zxcms_admin_log` DISABLE KEYS */;

INSERT INTO `zxcms_admin_log` (`id`, `m`, `c`, `a`, `querystring`, `userid`, `username`, `ip`, `time`)
VALUES
	(1,'admin','Group','index','',4,'test',2130706433,0);

/*!40000 ALTER TABLE `zxcms_admin_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table zxcms_app
# ------------------------------------------------------------

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



# Dump of table zxcms_config
# ------------------------------------------------------------

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



# Dump of table zxcms_menu
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `zxcms_menu` WRITE;
/*!40000 ALTER TABLE `zxcms_menu` DISABLE KEYS */;

INSERT INTO `zxcms_menu` (`id`, `name`, `parentid`, `icon`, `c`, `a`, `data`, `tip`, `group`, `listorder`, `display`, `updatetime`)
VALUES
	(1,'管理设置',0,'fa-users','Admin','admin','','','',1,1,1476175413),
	(2,'管理员管理',1,'','Admin','index','','','',0,1,1476175413),
	(3,'详情',2,'','Admin','info','','','',0,2,1476175413),
	(4,'添加',2,'','Admin','add','','','',0,2,1476175413),
	(5,'修改',2,'','Admin','edit','','','',0,2,1476175413),
	(6,'删除',2,'','Admin','del','','','',0,2,1476175413),
	(7,'分组管理',1,'','Group','index','','','',0,1,1476175413),
	(8,'详情',7,'','Group','info','','','',0,2,1476175413),
	(9,'添加',7,'','Group','add','','','',0,2,1476175413),
	(10,'修改',7,'','Group','edit','','','',0,2,1476175413),
	(11,'删除',7,'','Group','del','','','',0,2,1476175413),
	(12,'菜单管理',18,'','Menu','index','','','',0,1,1476175413),
	(13,'查看',12,'','Menu','info','','','',0,2,1476175413),
	(14,'添加',12,'','Menu','add','','','',0,2,1476175413),
	(15,'修改',12,'','Menu','edit','','','',0,2,1476175413),
	(16,'删除',12,'','Menu','del','','','',0,2,1476175413),
	(18,'系统设置',0,'fa-cogs','Menu','index','','','',2,1,1476175413),
	(22,'权限设置',2,'','Group','rule','','','',999,2,1476175413),
	(23,'个人设置',1,'','Admin','public_edit_info','','','',999,1,1476175413),
	(27,'日志管理',18,'','Log','index','','','',999,1,1476175413),
	(31,'系统首页',0,'fa-bank','Index','index','','','',0,1,1476175413);

/*!40000 ALTER TABLE `zxcms_menu` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
