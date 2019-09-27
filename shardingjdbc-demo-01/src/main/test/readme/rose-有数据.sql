/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : rose

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2019-09-27 16:08:58
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
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES ('1', '2018-06-23 18:11:17', '2019-01-31 15:30:12', '1', 'fa-folder', '用户管理', '0', '0', '1', '');
INSERT INTO `tb_menu` VALUES ('2', '2018-06-23 18:11:17', '2019-01-31 15:31:26', '2', 'fa-circle-o', '用户管理', '0', '1', '3', 'user/userManage/toUserManage');
INSERT INTO `tb_menu` VALUES ('3', '2018-06-23 18:11:17', '2019-01-31 15:31:32', '2', 'fa-circle-o', '角色管理', '0', '1', '2', 'user/roleManage/toRoleManage');
INSERT INTO `tb_menu` VALUES ('4', '2018-06-23 18:11:17', '2019-01-31 15:31:37', '2', 'fa-circle-o', '菜单管理', '0', '1', '1', 'user/menuManage/toMenuManage');
INSERT INTO `tb_menu` VALUES ('5', '2018-11-09 14:31:04', '2019-01-31 15:29:45', '1', 'fa-folder', '上传下载', '0', '0', '2', null);
INSERT INTO `tb_menu` VALUES ('6', '2018-11-09 14:48:29', '2019-01-31 15:31:12', '2', 'fa-circle-o', '上传下载', '0', '5', '1', 'user/uploadDemo/toUploadDemo');

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
-- Records of tb_menu_role_group_releation
-- ----------------------------
INSERT INTO `tb_menu_role_group_releation` VALUES ('5', '2018-11-09 14:58:25', '2018-11-09 14:58:25', '1', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('6', '2018-11-09 14:58:25', '2018-11-09 14:58:26', '2', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('7', '2018-11-09 14:58:25', '2018-11-09 14:58:26', '3', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('8', '2018-11-09 14:58:25', '2018-11-09 14:58:26', '4', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('9', '2018-11-09 14:58:25', '2018-11-09 14:58:26', '5', '1');
INSERT INTO `tb_menu_role_group_releation` VALUES ('10', '2018-11-09 14:58:25', '2018-11-09 14:58:26', '6', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order_0
-- ----------------------------
INSERT INTO `tb_order_0` VALUES ('1', '3', '19092500010015402000001884', '1', 'aaaaaaaa');
INSERT INTO `tb_order_0` VALUES ('2', '3', '19092500010015781000009017', '1', 'aaaaaaaa');
INSERT INTO `tb_order_0` VALUES ('3', '6', '19092500010015021000002256', '1', 'tb_order_0');
INSERT INTO `tb_order_0` VALUES ('4', '9', '19092500010010245000004344', null, '');
INSERT INTO `tb_order_0` VALUES ('5', '3', '19092500010017514000005307', null, '');
INSERT INTO `tb_order_0` VALUES ('6', '3', '19092500010015141000002013', null, '');
INSERT INTO `tb_order_0` VALUES ('7', '3', '19092500010013727000008113', null, '');
INSERT INTO `tb_order_0` VALUES ('8', '3', '19092500010014261000006025', null, '');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order_1
-- ----------------------------
INSERT INTO `tb_order_1` VALUES ('1', '1', '19092510010014541000005566', '1', 'tb_order_1');
INSERT INTO `tb_order_1` VALUES ('2', '7', '19092510010019874000008786', '1', 'tb_order_1');
INSERT INTO `tb_order_1` VALUES ('3', '10', '19092510010016202000000560', '1', 'tb_order_1');
INSERT INTO `tb_order_1` VALUES ('4', '4', '19092510010016308000003250', null, '');
INSERT INTO `tb_order_1` VALUES ('5', '4', '19092510010011638000005592', null, '');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order_2
-- ----------------------------
INSERT INTO `tb_order_2` VALUES ('1', '2', '19092520010018069000006968', '1', 'aaaaaaaa');
INSERT INTO `tb_order_2` VALUES ('2', '5', '19092520010016283000004776', '1', 'aaaaaaaa');
INSERT INTO `tb_order_2` VALUES ('3', '2', '19092520010014726000007968', '1', 'aaaaaaaa');
INSERT INTO `tb_order_2` VALUES ('4', '2', '19092520010014940000009755', null, 'aaaaaaaa');
INSERT INTO `tb_order_2` VALUES ('5', '2', '19092520010012355000009856', null, '');
INSERT INTO `tb_order_2` VALUES ('6', '2', '19092520010010355000009300', null, '');
INSERT INTO `tb_order_2` VALUES ('7', '2', '19092520010013872000001130', null, '');
INSERT INTO `tb_order_2` VALUES ('8', '2', '19092520010011843000004083', null, '');
INSERT INTO `tb_order_2` VALUES ('9', '2', '19092520010013494000009548', null, '');
INSERT INTO `tb_order_2` VALUES ('10', '2', '19092520010017519000008499', null, '');

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
-- Records of tb_role_group
-- ----------------------------
INSERT INTO `tb_role_group` VALUES ('1', '2018-07-24 11:51:57', '2018-08-26 13:55:34', '超级管理员', '超级管理员', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_sys_user
-- ----------------------------
INSERT INTO `tb_sys_user` VALUES ('1', '2018-07-24 15:35:24', '2018-09-03 09:42:52', '1', 'superAdmin', 'e10adc3949ba59abbe56e057f20f883e', '0');
INSERT INTO `tb_sys_user` VALUES ('2', '2018-09-04 19:00:30', '2018-11-08 15:39:58', '1', 'admin1', 'e10adc3949ba59abbe56e057f20f883e', '0');
INSERT INTO `tb_sys_user` VALUES ('3', '2018-09-04 19:04:15', '2018-11-08 15:39:59', '1', 'admin2', 'e10adc3949ba59abbe56e057f20f883e', '0');
INSERT INTO `tb_sys_user` VALUES ('4', '2018-09-04 19:06:35', '2018-11-08 15:40:01', '1', 'admin3', 'e10adc3949ba59abbe56e057f20f883e', '0');
INSERT INTO `tb_sys_user` VALUES ('20', '2019-09-25 17:32:40', '2019-09-25 17:32:40', '1', '111111', '222222', '1');
INSERT INTO `tb_sys_user` VALUES ('21', '2019-09-25 17:32:56', '2019-09-25 17:32:56', '1', '111111', '222222', '1');

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

-- ----------------------------
-- Records of tb_sys_user_log
-- ----------------------------
