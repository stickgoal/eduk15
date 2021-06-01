/*
Navicat MySQL Data Transfer

Source Server         : dev
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : rocket

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2021-06-01 16:18:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for boss_operator
-- ----------------------------
DROP TABLE IF EXISTS `boss_operator`;
CREATE TABLE `boss_operator` (
  `operator_id` int(11) NOT NULL AUTO_INCREMENT,
  `operator_name` varchar(128) NOT NULL COMMENT '操作员名称',
  `password` varchar(256) NOT NULL COMMENT '密码',
  `mobile` varchar(11) NOT NULL COMMENT '手机',
  `email` varchar(11) NOT NULL COMMENT '邮箱',
  `name` varchar(11) NOT NULL COMMENT '真名',
  `raw_add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录添加时间',
  `raw_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`operator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='操作员';

-- ----------------------------
-- Records of boss_operator
-- ----------------------------
INSERT INTO `boss_operator` VALUES ('1', 'zhangsan', 'abc123', '15523836777', 'abc@123.com', 'zhangsan', '2021-06-01 10:47:37', '2021-06-01 10:47:37');

-- ----------------------------
-- Table structure for boss_operator_role
-- ----------------------------
DROP TABLE IF EXISTS `boss_operator_role`;
CREATE TABLE `boss_operator_role` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of boss_operator_role
-- ----------------------------

-- ----------------------------
-- Table structure for boss_permission
-- ----------------------------
DROP TABLE IF EXISTS `boss_permission`;
CREATE TABLE `boss_permission` (
  `perm_id` int(11) NOT NULL AUTO_INCREMENT,
  `perm_name` varchar(255) NOT NULL COMMENT '权限名称，显示用',
  `perm_value` varchar(255) NOT NULL COMMENT '权限值',
  `perm_attachment` varchar(255) NOT NULL COMMENT '权限附加内容',
  PRIMARY KEY (`perm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of boss_permission
-- ----------------------------

-- ----------------------------
-- Table structure for boss_role
-- ----------------------------
DROP TABLE IF EXISTS `boss_role`;
CREATE TABLE `boss_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `role_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of boss_role
-- ----------------------------

-- ----------------------------
-- Table structure for boss_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `boss_role_permission`;
CREATE TABLE `boss_role_permission` (
  `role_perm_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `perm_id` int(11) NOT NULL,
  PRIMARY KEY (`role_perm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of boss_role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for rkt_chapter
-- ----------------------------
DROP TABLE IF EXISTS `rkt_chapter`;
CREATE TABLE `rkt_chapter` (
  `chapter_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL COMMENT '关联课程',
  `title` varchar(256) NOT NULL COMMENT '标题',
  `chapter_order` int(11) NOT NULL COMMENT '顺序,第X讲',
  `raw_add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录添加时间',
  `raw_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`chapter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='课程章';

-- ----------------------------
-- Records of rkt_chapter
-- ----------------------------
INSERT INTO `rkt_chapter` VALUES ('2', '6', '万物皆对象', '1', '2021-03-12 14:28:49', '2021-03-12 14:28:49');
INSERT INTO `rkt_chapter` VALUES ('3', '7', '万物皆对象', '1', '2021-03-12 14:30:31', '2021-03-12 14:30:31');
INSERT INTO `rkt_chapter` VALUES ('6', '11', '万物皆对象', '1', '2021-03-12 14:41:36', '2021-03-12 14:41:36');
INSERT INTO `rkt_chapter` VALUES ('7', '12', '万物皆对象', '1', '2021-03-12 14:42:05', '2021-03-12 14:42:05');
INSERT INTO `rkt_chapter` VALUES ('8', '14', '万物皆对象', '1', '2021-03-15 16:07:01', '2021-03-15 16:07:01');
INSERT INTO `rkt_chapter` VALUES ('9', '17', '万物皆对象', '1', '2021-03-15 16:47:34', '2021-03-15 16:47:34');
INSERT INTO `rkt_chapter` VALUES ('10', '18', '万物皆对象', '1', '2021-03-15 17:48:14', '2021-03-15 17:48:14');

-- ----------------------------
-- Table structure for rkt_collection
-- ----------------------------
DROP TABLE IF EXISTS `rkt_collection`;
CREATE TABLE `rkt_collection` (
  `collection_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `course_name` varchar(256) NOT NULL COMMENT '课程名称',
  `course_image` varchar(1024) NOT NULL COMMENT '课程图片',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `create_time` datetime NOT NULL COMMENT '收藏时间',
  `raw_add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录添加时间',
  `raw_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏';

-- ----------------------------
-- Records of rkt_collection
-- ----------------------------

-- ----------------------------
-- Table structure for rkt_course
-- ----------------------------
DROP TABLE IF EXISTS `rkt_course`;
CREATE TABLE `rkt_course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(256) NOT NULL COMMENT '课程名字',
  `category` varchar(256) NOT NULL COMMENT '分类',
  `price` decimal(17,2) NOT NULL COMMENT '价格',
  `svip_price` decimal(17,2) NOT NULL COMMENT 'svip价格',
  `video_type` varchar(10) NOT NULL COMMENT 'LIVE直播 | RECORED录播',
  `charge_type` varchar(10) NOT NULL COMMENT 'FREE免费|PAID付费|SVIP_FREE SVIP免费',
  `purchase_count` int(11) NOT NULL DEFAULT '0' COMMENT '购买人数',
  `study_count` int(11) NOT NULL DEFAULT '0' COMMENT '学习人数',
  `description` varchar(2048) NOT NULL COMMENT '课程介绍',
  `image` varchar(1024) NOT NULL COMMENT '课程图片',
  `teacher_id` int(11) NOT NULL COMMENT '讲师ID',
  `teacher_name` varchar(64) NOT NULL COMMENT '讲师名字',
  `teacher_desc` varchar(1024) NOT NULL COMMENT '讲师介绍',
  `teacher_avatar` varchar(1024) NOT NULL COMMENT '讲师头像',
  `raw_add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录添加时间',
  `raw_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='课程信息表';

-- ----------------------------
-- Records of rkt_course
-- ----------------------------
INSERT INTO `rkt_course` VALUES ('6', 'Java入门', 'Java', '10.00', '10.00', 'xx', 'PAID', '0', '0', '12321313', 'https://www.baidu.com/logo', '1', 'xxx', '', '', '2021-03-12 14:28:49', '2021-03-25 16:57:55');
INSERT INTO `rkt_course` VALUES ('7', 'Java中级', 'Java', '10.00', '10.00', 'xx', 'PAID', '0', '0', '123123', '', '0', 'zzz', '', '', '2021-03-12 14:30:31', '2021-03-25 16:58:11');
INSERT INTO `rkt_course` VALUES ('11', 'Java入土', 'Java', '10.00', '10.00', 'xx', 'PAID', '0', '0', '123213', '', '0', 'fff', '', '', '2021-03-12 14:41:36', '2021-03-25 16:58:14');
INSERT INTO `rkt_course` VALUES ('12', 'Java跑路之术', 'Java', '10.00', '10.00', 'xx', 'PAID', '0', '0', '123123', '', '0', 'aa', '', '', '2021-03-12 14:42:05', '2021-03-25 16:58:24');
INSERT INTO `rkt_course` VALUES ('14', 'Java与颈椎病', 'Java', '10.00', '10.00', 'xx', 'PAID', '0', '0', '', '', '0', 'ddd', '', '', '2021-03-15 16:07:01', '2021-03-25 16:58:32');
INSERT INTO `rkt_course` VALUES ('17', 'Java与结石', 'Java', '10.00', '10.00', 'xx', 'PAID', '0', '0', '123213', '', '0', 'adsfas', '', '', '2021-03-15 16:47:34', '2021-03-25 16:58:38');
INSERT INTO `rkt_course` VALUES ('18', 'Java入门', 'Java', '10.00', '10.00', 'xx', 'PAID', '0', '0', '', '', '0', 'asdfasdf', '', '', '2021-03-15 17:48:14', '2021-03-25 16:58:06');
INSERT INTO `rkt_course` VALUES ('19', 'demoDatatatata', 'abc', '0.00', '0.00', 'demoData', 'PAID', '0', '0', '阿斯顿发送到发送到范德萨发的撒范德萨爱的色放', '阿斯顿发大水发大水发', '0', 'zhangsan', 'asdfasdfdsafasdfdsaf', 'https://www.baidu.com/logo', '2021-03-18 15:47:27', '2021-03-23 16:00:43');
INSERT INTO `rkt_course` VALUES ('20', 'demoDatatatata', 'abc', '0.00', '0.00', 'live', 'PAID', '0', '0', '一门好课，苟哥十年精心打磨，独具匠心，百年传承', 'http://localhost:8000/20210319104750253912936870-20160922153752027-1272044443.png', '0', 'zhangsan', 'asdfasdfdsafasdfdsaf', 'https://www.baidu.com/logo', '2021-03-19 10:48:17', '2021-03-23 16:00:43');
INSERT INTO `rkt_course` VALUES ('21', 'demoDatatatata', 'abc', '0.00', '0.00', 'live', 'PAID', '0', '0', '一门好课，苟哥十年精心打磨，独具匠心，百年传承', 'http://localhost:8000/20210319104750253912936870-20160922153752027-1272044443.png', '0', 'zhangsan', 'asdfasdfdsafasdfdsaf', 'https://www.baidu.com/logo', '2021-03-19 10:52:31', '2021-03-23 16:00:43');
INSERT INTO `rkt_course` VALUES ('22', 'demoData', 'abc', '0.00', '0.00', 'live', 'PAID', '0', '0', 'asdfadsfasdfasdfasdfadsfadsfadsfasdfdsaf', 'http://localhost:8000/20210319165712546395GlobalFilter.png', '0', 'zhangsan', 'asdfasdfdsafasdfdsaf', 'https://www.baidu.com/logo', '2021-03-19 17:00:08', '2021-03-23 16:00:43');
INSERT INTO `rkt_course` VALUES ('23', 'jpatest', 'asdfadsfsdf', '100.00', '190.00', 'sdafdasdf', 'asdfadsf', '0', '0', 'asdfadsfads', 'asdfasdf', '1', 'adsfa', 'asdfasdfadsfadsf', 'asdf', '2021-03-24 17:45:31', '2021-03-24 17:45:31');
INSERT INTO `rkt_course` VALUES ('24', 'asdfasfd', 'asdfa', '10.00', '10.00', 'asd', 'asdfa', '0', '0', 'asdfasdfadsfadsfa', 'asdfasdf', '123', 'asdf', 'asdfasdfadsfa', 'asdfasdfadsfadsf', '2021-03-25 17:27:48', '2021-03-25 17:27:48');
INSERT INTO `rkt_course` VALUES ('25', '颈椎病康复指南', 'asdfa', '10.00', '10.00', 'asd', 'asdfa', '0', '0', 'asdfasdfadsfadsfa', 'asdfasdf', '2', 'asdf', 'asdfasdfadsfa', 'asdfasdfadsfadsf', '2021-03-26 17:18:31', '2021-03-26 17:18:31');
INSERT INTO `rkt_course` VALUES ('26', 'hello', 'asdfa', '10.00', '10.00', 'asd', 'asdfa', '0', '0', 'asdfasdfadsfadsfa', 'asdfasdf', '1', 'asdf', 'asdfasdfadsfa', 'asdfasdfadsfadsf', '2021-03-26 17:19:24', '2021-03-26 17:19:24');
INSERT INTO `rkt_course` VALUES ('27', '阿斯顿发送到发', 'asdfa', '10.00', '10.00', 'asd', 'asdfa', '0', '0', 'asdfasdfadsfadsfa', 'asdfasdf', '1', 'asdf', 'asdfasdfadsfa', 'asdfasdfadsfadsf', '2021-03-26 17:20:13', '2021-03-26 17:20:13');
INSERT INTO `rkt_course` VALUES ('28', 'asdfasdfa', 'asdfa', '10.00', '10.00', 'asd', 'asdfa', '0', '0', 'asdfasdfadsfadsfa', 'asdfasdf', '1', 'asdf', 'asdfasdfadsfa', 'asdfasdfadsfadsf', '2021-03-26 17:23:18', '2021-03-26 17:23:18');
INSERT INTO `rkt_course` VALUES ('29', 'asdfafds', 'asdfa', '10.00', '10.00', 'asd', 'asdfa', '0', '0', 'asdfasdfadsfadsfa', 'asdfasdf', '1', 'asdf', 'asdfasdfadsfa', 'asdfasdfadsfadsf', '2021-03-26 17:56:03', '2021-03-26 17:56:03');
INSERT INTO `rkt_course` VALUES ('30', 'vue入门', 'asdfa', '10.00', '10.00', 'asd', 'asdfa', '0', '0', 'asdfasdfadsfadsfa', 'asdfasdf', '2', 'asdf', 'asdfasdfadsfa', 'asdfasdfadsfadsf', '2021-03-31 15:46:59', '2021-03-31 15:46:59');

-- ----------------------------
-- Table structure for rkt_lesson
-- ----------------------------
DROP TABLE IF EXISTS `rkt_lesson`;
CREATE TABLE `rkt_lesson` (
  `lesson_id` int(11) NOT NULL AUTO_INCREMENT,
  `chapter_id` int(11) NOT NULL COMMENT '关联章',
  `course_id` int(11) NOT NULL COMMENT '关联课程',
  `title` varchar(256) NOT NULL COMMENT '标题',
  `lesson_order` int(11) NOT NULL COMMENT '节顺序，第X节',
  `status` varchar(10) NOT NULL COMMENT '状态',
  `preview` varchar(1024) NOT NULL COMMENT '预览图，支持从视频中抽取',
  `video_addr` varchar(1024) DEFAULT NULL COMMENT '视频地址',
  `length` int(11) DEFAULT NULL COMMENT '视频长度',
  `attachment` varchar(1024) DEFAULT NULL COMMENT '课件地址',
  `raw_add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录添加时间',
  `raw_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`lesson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程节';

-- ----------------------------
-- Records of rkt_lesson
-- ----------------------------

-- ----------------------------
-- Table structure for rkt_order
-- ----------------------------
DROP TABLE IF EXISTS `rkt_order`;
CREATE TABLE `rkt_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(25) NOT NULL COMMENT '订单号',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `course_name` varchar(256) NOT NULL COMMENT '课程名称',
  `course_image` varchar(1024) NOT NULL COMMENT '课程图片',
  `amount` decimal(17,2) NOT NULL COMMENT '订单金额',
  `user_id` int(11) NOT NULL COMMENT '购买者ID',
  `status` varchar(10) NOT NULL COMMENT '状态：INIT未支付 | PAID 已支付 | CANCEL 已取消',
  `payment_channel` varchar(10) NOT NULL COMMENT '支付渠道：ZFB 支付宝 | WECHAT 微信',
  `payment_no` varchar(64) DEFAULT NULL COMMENT '支付订单号，支付渠道的单号',
  `create_time` datetime NOT NULL COMMENT '订单创建时间',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `callback_time` datetime DEFAULT NULL COMMENT '支付回调时间',
  `finish_time` datetime DEFAULT NULL COMMENT '完成时间',
  `raw_add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录添加时间',
  `raw_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='学习记录';

-- ----------------------------
-- Records of rkt_order
-- ----------------------------
INSERT INTO `rkt_order` VALUES ('1', '202103241123009896911', '6', 'Java入门', 'https://www.baidu.com/logo', '10.00', '1', 'PAID', 'ZFB', null, '2021-03-24 11:23:01', null, '2021-03-24 11:34:45', '2021-03-24 11:34:45', '2021-03-24 11:23:01', '2021-03-24 11:34:45');
INSERT INTO `rkt_order` VALUES ('2', '202103241124260612861', '6', 'Java入门', 'https://www.baidu.com/logo', '10.00', '1', 'INIT', 'ZFB', null, '2021-03-24 11:24:26', null, null, null, '2021-03-24 11:24:26', '2021-03-24 11:24:26');

-- ----------------------------
-- Table structure for rkt_record
-- ----------------------------
DROP TABLE IF EXISTS `rkt_record`;
CREATE TABLE `rkt_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL COMMENT '关联课程',
  `course_name` varchar(256) NOT NULL COMMENT '课程名字',
  `course_image` varchar(1024) NOT NULL COMMENT '课程预览图',
  `percentage` tinyint(4) NOT NULL DEFAULT '0' COMMENT '进度百分比',
  `last_lesson` varchar(10) NOT NULL COMMENT '上次学习',
  `raw_add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录添加时间',
  `raw_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学习记录';

-- ----------------------------
-- Records of rkt_record
-- ----------------------------

-- ----------------------------
-- Table structure for rkt_teacher
-- ----------------------------
DROP TABLE IF EXISTS `rkt_teacher`;
CREATE TABLE `rkt_teacher` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '关联用户表',
  `real_name` varchar(64) NOT NULL COMMENT '真名',
  `teacher_desc` varchar(1024) NOT NULL COMMENT '讲师介绍',
  `raw_add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录添加时间',
  `raw_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='讲师表';

-- ----------------------------
-- Records of rkt_teacher
-- ----------------------------
INSERT INTO `rkt_teacher` VALUES ('1', '1', '张三三三三男松散123', '牛啊三三三男松散阿斯顿发范德萨123', '2021-03-29 16:19:51', '2021-03-31 17:09:04');
INSERT INTO `rkt_teacher` VALUES ('2', '2', 'lisi阿斯顿发送到发送到发大水', 'lihai阿斯顿发的SF阿斯顿发大水发大水发', '2021-03-29 16:49:15', '2021-03-29 17:29:06');
INSERT INTO `rkt_teacher` VALUES ('3', '3', 'wangwu', 'guai', '2021-03-29 16:49:22', '2021-03-29 16:49:22');
INSERT INTO `rkt_teacher` VALUES ('4', '4', 'maoshiba', 'zan', '2021-03-29 16:49:33', '2021-03-29 16:49:33');
INSERT INTO `rkt_teacher` VALUES ('5', '5', '66', '666', '2021-03-29 16:50:36', '2021-03-29 16:50:36');
INSERT INTO `rkt_teacher` VALUES ('6', '6', '12', '12', '2021-03-29 16:50:40', '2021-03-29 16:50:40');
INSERT INTO `rkt_teacher` VALUES ('7', '7', '1000', '10212', '2021-03-29 16:50:46', '2021-03-29 16:50:46');
INSERT INTO `rkt_teacher` VALUES ('8', '8', 'zhangsi', '1213', '2021-03-29 17:04:29', '2021-03-29 17:04:29');
INSERT INTO `rkt_teacher` VALUES ('9', '9', 'zhangwu', '123213', '2021-03-29 17:04:37', '2021-03-29 17:04:37');
INSERT INTO `rkt_teacher` VALUES ('10', '10', 'zhangliu', '123123', '2021-03-29 17:05:02', '2021-03-29 17:05:02');
INSERT INTO `rkt_teacher` VALUES ('11', '1', '阿斯顿发的说法', '阿斯顿发的说法', '2021-03-31 17:08:44', '2021-03-31 17:08:44');
INSERT INTO `rkt_teacher` VALUES ('12', '1', 'asdf', 'asdfasdfa', '2021-04-12 12:13:01', '2021-04-12 12:13:01');
INSERT INTO `rkt_teacher` VALUES ('13', '1', 'asdfasdfasd', 'asdfasdfsadfadsfdsafadsfdsf', '2021-04-12 14:29:58', '2021-04-12 14:29:58');

-- ----------------------------
-- Table structure for rkt_user
-- ----------------------------
DROP TABLE IF EXISTS `rkt_user`;
CREATE TABLE `rkt_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(256) NOT NULL COMMENT '用户名',
  `password` varchar(256) NOT NULL COMMENT '密码',
  `status` varchar(10) NOT NULL COMMENT 'InActive 未激活,Normal正常,Locked锁定,Canceled注销',
  `email` varchar(256) DEFAULT NULL COMMENT 'email',
  `mobile` varchar(11) NOT NULL COMMENT '手机号，与用户名相同，冗余以防用户名有不同的可能',
  `nickname` varchar(256) NOT NULL COMMENT '昵称',
  `gender` char(1) DEFAULT NULL COMMENT '性别',
  `avatar` varchar(1024) DEFAULT NULL COMMENT '头像地址',
  `role` varchar(128) NOT NULL COMMENT '角色：STU学生,TCH讲师',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` int(4) NOT NULL COMMENT '最后登录IP',
  `raw_add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录添加时间',
  `raw_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户信息';

-- ----------------------------
-- Records of rkt_user
-- ----------------------------
INSERT INTO `rkt_user` VALUES ('2', 'zhangsan', 'abc123', 'n', 'n', 'n', 'n', 'n', 'avatar0.31431897544081366', 'n', '2021-04-28 17:41:47', '1', '2021-04-09 17:42:05', '2021-04-09 17:42:18');
