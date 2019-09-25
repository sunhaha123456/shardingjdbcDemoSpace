/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : rose

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2019-09-24 15:56:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dir_level` int(1) DEFAULT NULL COMMENT '目录深度',
  `icon_cls` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '菜单图标',
  `menu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '菜单名称',
  `menu_state` int(1) DEFAULT '0' COMMENT '菜单状态',
  `parent_id` int(20) DEFAULT NULL COMMENT '上级目录id',
  `sort` int(20) DEFAULT NULL COMMENT '排序',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '跳转链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tb_menu_role_group_releation
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu_role_group_releation`;
CREATE TABLE `tb_menu_role_group_releation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `menu_id` int(20) DEFAULT NULL COMMENT '菜单id',
  `role_group_id` int(20) DEFAULT NULL COMMENT '角色组id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tb_order_0
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_0`;
CREATE TABLE `tb_order_0` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL,
  `order_no` varchar(100) DEFAULT '' COMMENT '订单编号',
  `order_sum_amount` decimal(19,0) DEFAULT NULL COMMENT '订单总金额',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_order_1
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_1`;
CREATE TABLE `tb_order_1` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL,
  `order_no` varchar(100) DEFAULT '' COMMENT '订单编号',
  `order_sum_amount` decimal(19,0) DEFAULT NULL COMMENT '订单总金额',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_order_2
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_2`;
CREATE TABLE `tb_order_2` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL,
  `order_no` varchar(100) DEFAULT '' COMMENT '订单编号',
  `order_sum_amount` decimal(19,0) DEFAULT NULL COMMENT '订单总金额',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_role_group
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_group`;
CREATE TABLE `tb_role_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色名称',
  `role_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色备注',
  `role_state` int(1) DEFAULT '0' COMMENT '角色状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tb_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_user`;
CREATE TABLE `tb_sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role_group_id` int(20) DEFAULT NULL COMMENT '角色组id',
  `uname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户名',
  `upwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码',
  `user_state` int(1) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tb_sys_user_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_sys_user_log`;
CREATE TABLE `tb_sys_user_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `args` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '参数',
  `ip` varchar(100) DEFAULT NULL COMMENT 'ip地址',
  `ret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '返回',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'url地址',
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
