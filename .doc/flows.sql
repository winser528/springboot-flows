/*
SQLyog v10.2 
MySQL - 5.7.9 : Database - zjzcn
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`flows` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `flows`;

/*Table structure for table `hibernate_sequence` */

DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `hibernate_sequence` */

insert  into `hibernate_sequence`(`next_val`) values (1);

/*Table structure for table `tb_channel` */

DROP TABLE IF EXISTS `tb_channel`;

CREATE TABLE `tb_channel` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_channel` */

/*Table structure for table `tb_content` */

DROP TABLE IF EXISTS `tb_content`;

CREATE TABLE `tb_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_content` */

/*Table structure for table `tb_log` */

DROP TABLE IF EXISTS `tb_log`;

CREATE TABLE `tb_log` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `logType` int(11) DEFAULT NULL COMMENT '日志类型: 0-操作日志,1-异常日志',
  `ip` varchar(20) DEFAULT NULL COMMENT '操作IP',
  `name` varchar(100) DEFAULT NULL COMMENT '操作名',
  `content` varchar(1000) DEFAULT NULL COMMENT '操作内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

/*Data for the table `tb_log` */

insert  into `tb_log`(`id`,`create_time`,`username`,`logType`,`ip`,`name`,`content`) values (6,'2014-03-15 22:09:10','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 7975\n'),(7,'2014-03-15 22:25:01','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 8144\n'),(15,'2014-03-16 18:04:13',NULL,1,'127.0.0.1','系统异常','异常码:20140316180413351'),(16,'2014-03-16 18:04:24',NULL,1,'127.0.0.1','系统异常','异常码:20140316180424159'),(17,'2014-03-16 18:06:34','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 6116\n'),(18,'2014-03-16 18:08:52',NULL,0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 6119\n'),(19,'2014-03-16 18:08:56','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 7877\n'),(20,'2014-03-16 18:26:50','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 8822\n'),(21,'2014-03-16 20:26:33',NULL,0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 3216\n'),(22,'2014-03-16 20:26:38','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 6676\n'),(23,'2014-03-16 20:31:16','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 7455\n'),(24,'2014-03-16 20:33:57','admin',1,'127.0.0.1','系统异常','异常码:20140316203357230'),(25,'2014-03-16 20:35:22','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 3632\n'),(26,'2014-03-16 20:42:22',NULL,0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 1694\n'),(27,'2014-03-16 20:42:30','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 9272\n'),(28,'2014-03-16 20:48:23','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 4763\n'),(29,'2014-03-16 21:44:38','admin',1,'127.0.0.1','系统异常','异常码:20140316214438238'),(30,'2014-03-16 21:46:10','zjz',0,'127.0.0.1','用户登陆','username = zjz\ncaptcha = 1375\n'),(31,'2014-03-16 21:47:57','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 3495\n'),(32,'2014-03-16 21:57:24','zjz',0,'127.0.0.1','用户登陆','username = zjz\ncaptcha = 5889\n'),(33,'2014-03-16 21:57:24','zjz',0,'127.0.0.1','用户登陆','username = zjz\ncaptcha = 5889\n'),(34,'2014-03-16 21:57:34','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 3619\n'),(35,'2014-03-16 21:59:17','zjz',0,'127.0.0.1','用户登陆','username = zjz\ncaptcha = 6545\n'),(36,'2014-03-16 21:59:17','zjz',0,'127.0.0.1','用户登陆','username = zjz\ncaptcha = 6545\n'),(37,'2014-03-17 11:00:44','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 7151\n'),(38,'2014-03-17 11:01:24','zjz',0,'127.0.0.1','用户登陆','username = zjz\ncaptcha = 1445\n'),(39,'2014-03-17 11:01:24','zjz',0,'127.0.0.1','用户登陆','username = zjz\ncaptcha = 1445\n'),(40,'2014-03-17 11:04:02','zjz',0,'127.0.0.1','用户登陆','username = zjz\ncaptcha = 4284\n'),(41,'2014-03-17 11:04:02','zjz',0,'127.0.0.1','用户登陆','username = zjz\ncaptcha = 4284\n'),(42,'2014-03-17 12:20:02','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 3674\n'),(43,'2014-03-17 12:20:02','admin',1,'127.0.0.1','系统异常','异常码:20140317122002339'),(44,'2014-03-17 12:21:57','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 2236\n'),(45,'2014-03-17 14:02:33','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 7495\n'),(46,'2014-03-17 14:03:28','admin',0,'127.0.0.1','角色-保存','ids = \nroleName = 1234\nisSuper = 0\nremark = \n'),(48,'2014-03-17 16:17:15','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 4188\n'),(49,'2014-03-17 16:20:18','admin',0,'127.0.0.1','用户-保存','id = \nusername = 1234\nname = 1234\nemail = 1234@1221.com\ngender = 0\nisDisabled = 0\nremark = \n'),(50,'2014-03-17 16:25:20','admin',0,'127.0.0.1','用户-保存','id = \nusername = 123222\nname = 122222\nemail = 123@12.22\ngender = 0\nisDisabled = 0\nremark = \n'),(51,'2014-03-17 16:25:57','admin',0,'127.0.0.1','用户-保存','id = \nusername = 234q\nname = qwe\nemail = qwe@12.23\ngender = 0\nisDisabled = 0\nremark = \n'),(52,'2014-03-17 16:27:46','admin',0,'127.0.0.1','角色-保存','ids = \nroleName = qwe\nisSuper = 0\nremark = \n'),(53,'2014-03-17 16:28:48','admin',0,'127.0.0.1','用户-保存','id = \nusername = qwedf\nname = qwe\nemail = qwer@123.dd\ngender = \nisDisabled = 0\nremark = \n'),(54,'2014-03-17 16:30:22','admin',0,'127.0.0.1','用户-保存','id = \nusername = 123we\nname = 1234\nemail = wer@22.222\ngender = \nisDisabled = 0\nremark = \n'),(55,'2014-03-17 16:30:46','admin',0,'127.0.0.1','用户-保存','id = \nusername = 2345\nname = 234\nemail = 2345@123.345\ngender = 0\nisDisabled = 0\nremark = \n'),(56,'2014-03-17 16:37:32','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 5214\n'),(57,'2014-03-17 16:43:04','admin',0,'127.0.0.1','用户-更新','id = 2\nname = zjz\nemail = 123@12.2\ngender = \nisDisabled = 0\nremark = \n'),(58,'2014-03-17 16:43:15','admin',0,'127.0.0.1','用户-更新','id = 5\nname = qwe\nemail = qwe@12.23\ngender = 0\nisDisabled = 0\nremark = \n'),(59,'2014-03-17 21:50:18',NULL,0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 8636\n'),(60,'2014-03-17 21:50:40','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 4387\n'),(61,'2014-03-17 22:03:48','admin',0,'127.0.0.1','用户-更新','id = 5\nname = qwe\nemail = qwe@12.23\ngender = 0\nisDisabled = 1\nremark = \n'),(62,'2014-03-18 09:04:41','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 2628\n'),(63,'2014-03-18 09:07:19','admin',0,'127.0.0.1','角色-保存','ids = 9957D7CEAF4A4729AF53B32070142424,\nroleName = 123\nisSuper = 0\nremark = 234\n'),(64,'2014-03-18 09:15:53','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 7915\n'),(65,'2014-03-18 09:23:20','admin',0,'127.0.0.1','角色-保存','urls = 3C6EAC53938D4BB4ADC4D3BA41222BC0,\nname = 1234\nisSuper = 0\nremark = 1234\n'),(66,'2014-03-18 10:08:03','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 9263\n'),(67,'2014-03-18 10:12:43','admin',0,'127.0.0.1','用户-更新','id = 1\nname = admin\nemail = zjzcn@126.com\ngender = \nisDisabled = 0\nremark = 1234\n'),(69,'2014-03-18 13:02:19','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 4263\n'),(71,'2014-03-19 14:08:54','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 6857\n'),(74,'2014-03-19 18:53:37',NULL,0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 6883\n'),(75,'2014-03-19 18:53:42','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 3765\n'),(76,'2014-03-20 15:02:13','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 3562\n'),(77,'2014-03-20 20:15:55',NULL,0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 9944\n'),(78,'2014-03-20 20:16:00','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 5141\n'),(79,'2014-03-21 08:56:48','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 9891\n'),(80,'2014-03-21 11:10:52','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 3668\n'),(82,'2014-03-21 11:22:03','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 5995\n'),(83,'2014-03-21 11:53:53','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 2895\n'),(84,'2014-03-21 12:11:21','admin',0,'127.0.0.1','用户-保存','id = \nusername = 12342\nname = 12342\nemail = 123@123.3\ngender = \nisDisabled = 0\nremark = \n'),(85,'2014-03-21 12:40:00','admin',0,'127.0.0.1','用户-更新','id = 1\nname = admin\nemail = zjzcn@126.com\ngender = 0\nisDisabled = 0\nremark = 1234\n'),(86,'2014-03-21 12:49:31','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 5765\n'),(87,'2014-03-21 13:39:37','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 5191\n'),(88,'2014-03-21 13:40:49','admin',0,'127.0.0.1','角色-保存','urls = \nname = 12345\nremark = 234\nisSuper = 0\n'),(89,'2014-03-21 14:56:25','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 9282\n'),(90,'2014-03-24 21:14:27','admin',0,'127.0.0.1','用户登陆','username = admin\ncaptcha = 5243\n'),(91,'2015-03-19 18:06:20','admin',0,'0:0:0:0:0:0:0:1','用户登陆','username = admin\ncaptcha = 2559\n'),(92,'2015-03-19 19:05:33','admin',0,'0:0:0:0:0:0:0:1','用户登陆','username = admin\ncaptcha = 6124\n'),(93,'2015-03-19 20:00:14','admin',0,'0:0:0:0:0:0:0:1','用户登陆','username = admin\ncaptcha = 9224\n'),(94,'2015-04-05 13:57:40','admin',0,'0:0:0:0:0:0:0:1','用户登陆','username = admin\ncaptcha = 5273\n'),(95,'2015-04-05 16:45:06','admin',0,'0:0:0:0:0:0:0:1','用户登陆','username = admin\ncaptcha = 3857\n');

/*Table structure for table `tb_org` */

DROP TABLE IF EXISTS `tb_org`;

CREATE TABLE `tb_org` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(255) DEFAULT NULL COMMENT '部门编码',
  `name` varchar(255) DEFAULT NULL COMMENT '部门名称',
  `description` varchar(2048) DEFAULT NULL COMMENT '部门描述',
  `pid` int(20) DEFAULT NULL COMMENT '上级部门',
  `type` varchar(255) DEFAULT NULL COMMENT 'org/position',
  PRIMARY KEY (`id`),
  KEY `FKs37mngep8ikj0jlwil8o8nt1f` (`pid`),
  CONSTRAINT `FKs37mngep8ikj0jlwil8o8nt1f` FOREIGN KEY (`pid`) REFERENCES `tb_org` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `tb_org` */

insert  into `tb_org`(`id`,`code`,`name`,`description`,`pid`,`type`) values (1,'1','XX有限公司',NULL,NULL,'O'),(2,'2','公司总经理',NULL,1,'P'),(3,'3','人事部',NULL,2,'O'),(4,'4','IT部',NULL,2,'O'),(5,'5','销售部',NULL,2,'O'),(6,'6','人事部经理',NULL,3,'P'),(7,'7','IT部经理',NULL,4,'P'),(8,'8','销售部经理',NULL,5,'P'),(9,'9','码农',NULL,7,'P'),(10,'10','高级码农',NULL,7,'P');

/*Table structure for table `tb_role` */

DROP TABLE IF EXISTS `tb_role`;

CREATE TABLE `tb_role` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `is_super` int(1) DEFAULT '0' COMMENT '角色名称',
  `remark` varchar(1000) DEFAULT NULL COMMENT '角色介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `tb_role` */

insert  into `tb_role`(`id`,`name`,`is_super`,`remark`) values (1,'超级管理员',1,'超级管理员111'),(2,'系统管理员',0,NULL),(3,'系统操作员',0,NULL),(4,'普通用户',0,NULL),(5,'测试',0,NULL);

/*Table structure for table `tb_role_perm` */

DROP TABLE IF EXISTS `tb_role_perm`;

CREATE TABLE `tb_role_perm` (
  `role_id` int(12) DEFAULT NULL,
  `perm_url` varchar(100) DEFAULT NULL,
  KEY `FK_e7a3x5a80gq7nt5vr7stnia82` (`role_id`),
  CONSTRAINT `FK_e7a3x5a80gq7nt5vr7stnia82` FOREIGN KEY (`role_id`) REFERENCES `tb_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_role_perm` */

insert  into `tb_role_perm`(`role_id`,`perm_url`) values (1,'role_list'),(2,'role_list'),(2,'user_list'),(5,'self_doChangePwd'),(5,'user_save'),(5,'user_add'),(5,'role_update'),(5,'user_doAllocRole'),(5,'role_save'),(5,'role_list'),(5,'user_allocRole'),(5,'self_doChangeInfo'),(5,'user_list'),(5,'user_exist'),(5,'role_edit'),(5,'role_add'),(5,'user_delete'),(5,'log_list'),(5,'user_update'),(5,'user_resetPwd'),(5,'log_delete'),(5,'user_edit'),(5,'self_changePwd'),(5,'role_delete'),(5,'self_changeInfo'),(1,'self_doChangePwd'),(1,'user_save'),(1,'user_add'),(1,'user_doAllocRole'),(1,'role_save'),(1,'user_allocRole'),(1,'self_doChangeInfo'),(1,'user_list'),(1,'user_exist'),(1,'role_add'),(1,'user_delete'),(1,'user_update'),(1,'user_resetPwd'),(1,'user_edit'),(1,'self_changePwd'),(1,'self_changeInfo');

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_time` varchar(20) NOT NULL COMMENT '创建时间',
  `org_id` int(20) DEFAULT NULL COMMENT '所属部门',
  `name` varchar(100) DEFAULT NULL COMMENT '用户名',
  `username` varchar(100) DEFAULT NULL COMMENT '登陆名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `gender` int(1) DEFAULT '0' COMMENT '性别:0-女,1-男',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `is_disabled` int(1) DEFAULT '1' COMMENT '用户状态: 0-可用, 1-禁用',
  PRIMARY KEY (`id`),
  KEY `FKtokvgh1gdwd9unshc5rjaomgg` (`org_id`),
  CONSTRAINT `FKtokvgh1gdwd9unshc5rjaomgg` FOREIGN KEY (`org_id`) REFERENCES `tb_org` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `tb_user` */

insert  into `tb_user`(`id`,`create_time`,`org_id`,`name`,`username`,`password`,`gender`,`email`,`mobile`,`is_disabled`) values (1,'',1,'admin','admin','21232F297A57A5A743894A0E4A801FC3',0,'test@test.com',NULL,0),(2,'',1,'test','test','96E79218965EB72C92A549DD5A330112',1,'123@12.2',NULL,0),(3,'',NULL,'1234','1234','E10ADC3949BA59ABBE56E057F20F883E',0,'1234@1221.com',NULL,0),(5,'',NULL,'qwe','234q','E10ADC3949BA59ABBE56E057F20F883E',0,'qwe@12.23',NULL,0),(6,'2014-03-21 12:11:20',NULL,'12342','12342','E10ADC3949BA59ABBE56E057F20F883E',1,'123@123.3',NULL,0);

/*Table structure for table `tb_user_role` */

DROP TABLE IF EXISTS `tb_user_role`;

CREATE TABLE `tb_user_role` (
  `user_id` int(12) DEFAULT NULL,
  `role_id` int(12) DEFAULT NULL,
  KEY `FK_1txpcisco2l99tl5qqshr6ptp` (`role_id`),
  KEY `FK_qrc2efy4dx7j5okwcg0hit512` (`user_id`),
  CONSTRAINT `FK_1txpcisco2l99tl5qqshr6ptp` FOREIGN KEY (`role_id`) REFERENCES `tb_role` (`id`),
  CONSTRAINT `FK_qrc2efy4dx7j5okwcg0hit512` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_user_role` */

insert  into `tb_user_role`(`user_id`,`role_id`) values (1,1),(2,2);

/*Table structure for table `wf_cc_order` */

DROP TABLE IF EXISTS `wf_cc_order`;

CREATE TABLE `wf_cc_order` (
  `order_Id` varchar(32) DEFAULT NULL COMMENT '流程实例ID',
  `actor_Id` varchar(100) DEFAULT NULL COMMENT '参与者ID',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `creator` varchar(50) DEFAULT NULL COMMENT '发起人',
  `create_Time` varchar(50) DEFAULT NULL COMMENT '创建时间',
  `finish_Time` varchar(50) DEFAULT NULL COMMENT '完成时间',
  KEY `IDX_CCORDER_ORDER` (`order_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抄送实例表';

/*Data for the table `wf_cc_order` */

/*Table structure for table `wf_hist_order` */

DROP TABLE IF EXISTS `wf_hist_order`;

CREATE TABLE `wf_hist_order` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `process_Id` varchar(32) NOT NULL COMMENT '流程定义ID',
  `order_State` tinyint(1) NOT NULL COMMENT '状态',
  `creator` varchar(100) DEFAULT NULL COMMENT '发起人',
  `create_Time` varchar(50) NOT NULL COMMENT '发起时间',
  `end_Time` varchar(50) DEFAULT NULL COMMENT '完成时间',
  `expire_Time` varchar(50) DEFAULT NULL COMMENT '期望完成时间',
  `priority` tinyint(1) DEFAULT NULL COMMENT '优先级',
  `parent_Id` varchar(32) DEFAULT NULL COMMENT '父流程ID',
  `order_No` varchar(100) DEFAULT NULL COMMENT '流程实例编号',
  `variable` varchar(2000) DEFAULT NULL COMMENT '附属变量json存储',
  PRIMARY KEY (`id`),
  KEY `IDX_HIST_ORDER_PROCESSID` (`process_Id`),
  KEY `IDX_HIST_ORDER_NO` (`order_No`),
  KEY `FK_HIST_ORDER_PARENTID` (`parent_Id`),
  CONSTRAINT `wf_hist_order_ibfk_1` FOREIGN KEY (`process_Id`) REFERENCES `wf_process` (`id`),
  CONSTRAINT `wf_hist_order_ibfk_2` FOREIGN KEY (`parent_Id`) REFERENCES `wf_hist_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史流程实例表';

/*Data for the table `wf_hist_order` */

insert  into `wf_hist_order`(`id`,`process_Id`,`order_State`,`creator`,`create_Time`,`end_Time`,`expire_Time`,`priority`,`parent_Id`,`order_No`,`variable`) values ('08d0bcfe936040a8a0f8354421339ce0','376d3e6e40f14bd6948352f5183465bc',1,'admin','2015-04-12 16:41:02',NULL,NULL,NULL,NULL,'20150412-16:41:02-751-281','{\"taskId\":\"\",\"approveBoss.operator\":\"admin\",\"apply.operator\":\"admin\",\"submit\":\"提交\",\"approveDept.operator\":\"admin\",\"reason\":\"22222222222\",\"processId\":\"376d3e6e40f14bd6948352f5183465bc\",\"day\":3,\"orderId\":\"\"}'),('118f7b5b46fe44c3bd18ebc4d63466ad','376d3e6e40f14bd6948352f5183465bc',0,'admin','2015-04-12 09:47:59','2015-04-12 10:25:46',NULL,NULL,NULL,'20150412-09:47:59-598-75','{\"taskId\":\"\",\"approveBoss.operator\":\"admin\",\"apply.operator\":\"admin\",\"submit\":\"提交\",\"approveDept.operator\":\"admin\",\"reason\":\"22222222222\",\"processId\":\"376d3e6e40f14bd6948352f5183465bc\",\"day\":3,\"orderId\":\"\"}'),('343a03d5364c4af3948fd0b907ef2d59','376d3e6e40f14bd6948352f5183465bc',0,'admin','2015-04-12 10:32:38','2015-04-12 10:33:11',NULL,NULL,NULL,'20150412-10:32:38-071-887','{\"taskId\":\"\",\"approveBoss.operator\":\"admin\",\"apply.operator\":\"admin\",\"submit\":\"提交\",\"approveDept.operator\":\"admin\",\"reason\":\"5tttttttttttttttttttttt\",\"processId\":\"376d3e6e40f14bd6948352f5183465bc\",\"day\":5,\"orderId\":\"\"}'),('6854b07429604b99a0ef2bc1fa9e7b23','376d3e6e40f14bd6948352f5183465bc',1,'admin','2015-04-12 16:40:37',NULL,NULL,NULL,NULL,'20150412-16:40:37-135-532','{\"taskId\":\"\",\"approveBoss.operator\":\"admin\",\"apply.operator\":\"admin\",\"submit\":\"提交\",\"approveDept.operator\":\"admin\",\"reason\":\"22222222222\",\"processId\":\"376d3e6e40f14bd6948352f5183465bc\",\"day\":3,\"orderId\":\"\"}');

/*Table structure for table `wf_hist_task` */

DROP TABLE IF EXISTS `wf_hist_task`;

CREATE TABLE `wf_hist_task` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `order_Id` varchar(32) NOT NULL COMMENT '流程实例ID',
  `task_Name` varchar(100) NOT NULL COMMENT '任务名称',
  `display_Name` varchar(200) NOT NULL COMMENT '任务显示名称',
  `task_Type` tinyint(1) NOT NULL COMMENT '任务类型',
  `perform_Type` tinyint(1) DEFAULT NULL COMMENT '参与类型',
  `task_State` tinyint(1) NOT NULL COMMENT '任务状态',
  `operator` varchar(100) DEFAULT NULL COMMENT '任务处理人',
  `create_Time` varchar(50) NOT NULL COMMENT '任务创建时间',
  `finish_Time` varchar(50) DEFAULT NULL COMMENT '任务完成时间',
  `expire_Time` varchar(50) DEFAULT NULL COMMENT '任务期望完成时间',
  `action_Url` varchar(200) DEFAULT NULL COMMENT '任务处理url',
  `parent_Task_Id` varchar(32) DEFAULT NULL COMMENT '父任务ID',
  `variable` varchar(2000) DEFAULT NULL COMMENT '附属变量json存储',
  PRIMARY KEY (`id`),
  KEY `IDX_HIST_TASK_ORDER` (`order_Id`),
  KEY `IDX_HIST_TASK_TASKNAME` (`task_Name`),
  KEY `IDX_HIST_TASK_PARENTTASK` (`parent_Task_Id`),
  CONSTRAINT `wf_hist_task_ibfk_1` FOREIGN KEY (`order_Id`) REFERENCES `wf_hist_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史任务表';

/*Data for the table `wf_hist_task` */

insert  into `wf_hist_task`(`id`,`order_Id`,`task_Name`,`display_Name`,`task_Type`,`perform_Type`,`task_State`,`operator`,`create_Time`,`finish_Time`,`expire_Time`,`action_Url`,`parent_Task_Id`,`variable`) values ('336df85679de49e99e5fae86eb2a4ebf','343a03d5364c4af3948fd0b907ef2d59','apply','请假申请',0,0,0,'admin','2015-04-12 10:32:38','2015-04-12 10:32:38',NULL,'/flow/leave/apply','start','{\"taskId\":\"\",\"S-ACTOR\":\"admin\",\"approveBoss.operator\":\"admin\",\"apply.operator\":\"admin\",\"submit\":\"提交\",\"approveDept.operator\":\"admin\",\"reason\":\"5tttttttttttttttttttttt\",\"processId\":\"376d3e6e40f14bd6948352f5183465bc\",\"day\":5,\"orderId\":\"\"}'),('35e0304e4c274702b832ec7432c118f2','343a03d5364c4af3948fd0b907ef2d59','approveDept','部门经理审批',0,0,0,'admin','2015-04-12 10:32:38','2015-04-12 10:32:59',NULL,'/flow/leave/approveDept','336df85679de49e99e5fae86eb2a4ebf','{\"taskId\":\"35e0304e4c274702b832ec7432c118f2\",\"nextOperator\":\"\",\"submit\":\"提交\",\"ccOperatorName\":\"\",\"ccOperator\":\"\",\"processId\":\"376d3e6e40f14bd6948352f5183465bc\",\"nextOperatorName\":\"\",\"method\":\"0\",\"approveDept.suggest\":\"wwwwwwwwwwwww\",\"orderId\":\"343a03d5364c4af3948fd0b907ef2d59\"}'),('48d1be43010b43359e1f4b31f9086918','08d0bcfe936040a8a0f8354421339ce0','apply','请假申请',0,0,0,'admin','2015-04-12 16:41:02','2015-04-12 16:41:02',NULL,'/flow/leave/apply','start','{\"taskId\":\"\",\"S-ACTOR\":\"admin\",\"approveBoss.operator\":\"admin\",\"apply.operator\":\"admin\",\"submit\":\"提交\",\"approveDept.operator\":\"admin\",\"reason\":\"22222222222\",\"processId\":\"376d3e6e40f14bd6948352f5183465bc\",\"day\":3,\"orderId\":\"\"}'),('59f21c24fead4f9eafc454db9f139206','118f7b5b46fe44c3bd18ebc4d63466ad','approveDept','部门经理审批',0,0,0,'admin','2015-04-12 09:49:44','2015-04-12 10:11:22',NULL,'/flow/leave/approveDept','f14baa4ad2814f5ab786ecb462a72af6','{\"taskId\":\"59f21c24fead4f9eafc454db9f139206\",\"nextOperator\":\"\",\"submit\":\"提交\",\"ccOperatorName\":\"\",\"ccOperator\":\"\",\"processId\":\"376d3e6e40f14bd6948352f5183465bc\",\"nextOperatorName\":\"\",\"method\":\"0\",\"approveDept.suggest\":\"ddkkkkkkkkkkkkkkkkkkkkk\",\"orderId\":\"118f7b5b46fe44c3bd18ebc4d63466ad\"}'),('5bfe74b39f0f427da7663ad816ee06fb','343a03d5364c4af3948fd0b907ef2d59','approveBoss','总经理审批',0,0,0,'admin','2015-04-12 10:32:59','2015-04-12 10:33:10',NULL,'/flow/leave/approveBoss','35e0304e4c274702b832ec7432c118f2','{\"taskId\":\"5bfe74b39f0f427da7663ad816ee06fb\",\"approveBoss.suggest\":\"hhhhhhhhhhhhhhh\",\"submit\":\"提交\",\"processId\":\"376d3e6e40f14bd6948352f5183465bc\",\"method\":\"0\",\"orderId\":\"343a03d5364c4af3948fd0b907ef2d59\"}'),('5d02f8de2584410598035ec53d716f58','118f7b5b46fe44c3bd18ebc4d63466ad','approveBoss','总经理审批',0,0,0,'admin','2015-04-12 10:11:23','2015-04-12 10:25:45',NULL,'/flow/leave/approveBoss','59f21c24fead4f9eafc454db9f139206','{\"taskId\":\"5d02f8de2584410598035ec53d716f58\",\"approveBoss.suggest\":\"ssssssssssss\",\"submit\":\"提交\",\"processId\":\"376d3e6e40f14bd6948352f5183465bc\",\"method\":\"0\",\"orderId\":\"118f7b5b46fe44c3bd18ebc4d63466ad\"}'),('6bd145ca7f53413fa54ad3a6acb45fe4','6854b07429604b99a0ef2bc1fa9e7b23','apply','请假申请',0,0,0,'admin','2015-04-12 16:40:37','2015-04-12 16:40:37',NULL,'/flow/leave/apply','start','{\"taskId\":\"\",\"S-ACTOR\":\"admin\",\"approveBoss.operator\":\"admin\",\"apply.operator\":\"admin\",\"submit\":\"提交\",\"approveDept.operator\":\"admin\",\"reason\":\"22222222222\",\"processId\":\"376d3e6e40f14bd6948352f5183465bc\",\"day\":3,\"orderId\":\"\"}'),('f14baa4ad2814f5ab786ecb462a72af6','118f7b5b46fe44c3bd18ebc4d63466ad','apply','请假申请',0,0,0,'admin','2015-04-12 09:47:59','2015-04-12 09:49:44',NULL,'/flow/leave/apply','start','{\"taskId\":\"\",\"S-ACTOR\":\"admin\",\"approveBoss.operator\":\"admin\",\"apply.operator\":\"admin\",\"submit\":\"提交\",\"approveDept.operator\":\"admin\",\"reason\":\"22222222222\",\"processId\":\"376d3e6e40f14bd6948352f5183465bc\",\"day\":3,\"orderId\":\"\"}'),('f79c935411c647c3b7545cb563f6a9af','08d0bcfe936040a8a0f8354421339ce0','approveDept','部门经理审批',0,0,0,'admin','2015-04-12 16:41:02','2015-04-12 17:32:00',NULL,'/flow/leave/approveDept','48d1be43010b43359e1f4b31f9086918','{\"taskId\":\"f79c935411c647c3b7545cb563f6a9af\",\"nextOperator\":\"\",\"submit\":\"提交\",\"ccOperatorName\":\"\",\"ccOperator\":\"\",\"processId\":\"376d3e6e40f14bd6948352f5183465bc\",\"nextOperatorName\":\"\",\"method\":\"0\",\"approveDept.suggest\":\"1111\",\"orderId\":\"08d0bcfe936040a8a0f8354421339ce0\"}');

/*Table structure for table `wf_hist_task_actor` */

DROP TABLE IF EXISTS `wf_hist_task_actor`;

CREATE TABLE `wf_hist_task_actor` (
  `task_Id` varchar(32) NOT NULL COMMENT '任务ID',
  `actor_Id` varchar(100) NOT NULL COMMENT '参与者ID',
  KEY `IDX_HIST_TASKACTOR_TASK` (`task_Id`),
  CONSTRAINT `wf_hist_task_actor_ibfk_1` FOREIGN KEY (`task_Id`) REFERENCES `wf_hist_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史任务参与者表';

/*Data for the table `wf_hist_task_actor` */

insert  into `wf_hist_task_actor`(`task_Id`,`actor_Id`) values ('f14baa4ad2814f5ab786ecb462a72af6','admin'),('59f21c24fead4f9eafc454db9f139206','admin'),('5d02f8de2584410598035ec53d716f58','admin'),('336df85679de49e99e5fae86eb2a4ebf','admin'),('35e0304e4c274702b832ec7432c118f2','admin'),('5bfe74b39f0f427da7663ad816ee06fb','admin'),('6bd145ca7f53413fa54ad3a6acb45fe4','admin'),('48d1be43010b43359e1f4b31f9086918','admin'),('f79c935411c647c3b7545cb563f6a9af','admin');

/*Table structure for table `wf_order` */

DROP TABLE IF EXISTS `wf_order`;

CREATE TABLE `wf_order` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `parent_Id` varchar(32) DEFAULT NULL COMMENT '父流程ID',
  `process_Id` varchar(32) NOT NULL COMMENT '流程定义ID',
  `creator` varchar(100) DEFAULT NULL COMMENT '发起人',
  `create_Time` varchar(50) NOT NULL COMMENT '发起时间',
  `expire_Time` varchar(50) DEFAULT NULL COMMENT '期望完成时间',
  `last_Update_Time` varchar(50) DEFAULT NULL COMMENT '上次更新时间',
  `last_Updator` varchar(100) DEFAULT NULL COMMENT '上次更新人',
  `priority` tinyint(1) DEFAULT NULL COMMENT '优先级',
  `parent_Node_Name` varchar(100) DEFAULT NULL COMMENT '父流程依赖的节点名称',
  `order_No` varchar(100) DEFAULT NULL COMMENT '流程实例编号',
  `variable` varchar(2000) DEFAULT NULL COMMENT '附属变量json存储',
  `version` int(3) DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`),
  KEY `IDX_ORDER_PROCESSID` (`process_Id`),
  KEY `IDX_ORDER_NO` (`order_No`),
  KEY `FK_ORDER_PARENTID` (`parent_Id`),
  CONSTRAINT `wf_order_ibfk_1` FOREIGN KEY (`process_Id`) REFERENCES `wf_process` (`id`),
  CONSTRAINT `wf_order_ibfk_2` FOREIGN KEY (`parent_Id`) REFERENCES `wf_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程实例表';

/*Data for the table `wf_order` */

insert  into `wf_order`(`id`,`parent_Id`,`process_Id`,`creator`,`create_Time`,`expire_Time`,`last_Update_Time`,`last_Updator`,`priority`,`parent_Node_Name`,`order_No`,`variable`,`version`) values ('08d0bcfe936040a8a0f8354421339ce0',NULL,'376d3e6e40f14bd6948352f5183465bc','admin','2015-04-12 16:41:02',NULL,'2015-04-12 17:32:00','admin',NULL,NULL,'20150412-16:41:02-751-281','{\"taskId\":\"\",\"approveBoss.operator\":\"admin\",\"apply.operator\":\"admin\",\"submit\":\"提交\",\"approveDept.operator\":\"admin\",\"reason\":\"22222222222\",\"processId\":\"376d3e6e40f14bd6948352f5183465bc\",\"day\":3,\"orderId\":\"\"}',1),('6854b07429604b99a0ef2bc1fa9e7b23',NULL,'376d3e6e40f14bd6948352f5183465bc','admin','2015-04-12 16:40:37',NULL,'2015-04-12 16:40:37','admin',NULL,NULL,'20150412-16:40:37-135-532','{\"taskId\":\"\",\"approveBoss.operator\":\"admin\",\"apply.operator\":\"admin\",\"submit\":\"提交\",\"approveDept.operator\":\"admin\",\"reason\":\"22222222222\",\"processId\":\"376d3e6e40f14bd6948352f5183465bc\",\"day\":3,\"orderId\":\"\"}',0);

/*Table structure for table `wf_process` */

DROP TABLE IF EXISTS `wf_process`;

CREATE TABLE `wf_process` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `name` varchar(100) DEFAULT NULL COMMENT '流程名称',
  `display_Name` varchar(200) DEFAULT NULL COMMENT '流程显示名称',
  `type` varchar(100) DEFAULT NULL COMMENT '流程类型',
  `instance_Url` varchar(200) DEFAULT NULL COMMENT '实例url',
  `state` tinyint(1) DEFAULT NULL COMMENT '流程是否可用',
  `content` longblob COMMENT '流程模型定义',
  `version` int(2) DEFAULT NULL COMMENT '版本',
  `create_Time` varchar(50) DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `IDX_PROCESS_NAME` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程定义表';

/*Data for the table `wf_process` */

insert  into `wf_process`(`id`,`name`,`display_Name`,`type`,`instance_Url`,`state`,`content`,`version`,`create_Time`,`creator`) values ('03a458f6e34c4b898f3a8a86373b6741','borrow','借款申请流程',NULL,'/snaker/flow/all',1,'<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<!--\n  ~ /* Copyright 2013-2014 the original author or authors.\n  ~  *\n  ~  * Licensed under the Apache License, Version 2.0 (the \"License\");\n  ~  * you may not use this file except in compliance with the License.\n  ~  * You may obtain a copy of the License at\n  ~  *\n  ~  *     http://www.apache.org/licenses/LICENSE-2.0\n  ~  *\n  ~  * Unless required by applicable law or agreed to in writing, software\n  ~  * distributed under the License is distributed on an \"AS IS\" BASIS,\n  ~  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\n  ~  * See the License for the specific language governing permissions and\n  ~  * limitations under the License.\n  ~  */\n  -->\n\n<process displayName=\"借款申请流程\" instanceUrl=\"/snaker/flow/all\" name=\"borrow\">\n<start displayName=\"start1\" layout=\"42,118,-1,-1\" name=\"start1\">\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"apply\"/>\n</start>\n<end displayName=\"end1\" layout=\"479,118,-1,-1\" name=\"end1\"/>\n<task assignee=\"apply.operator\" autoExecute=\"Y\" displayName=\"借款申请\" form=\"/flow/borrow/apply\" layout=\"126,116,-1,-1\" name=\"apply\" performType=\"ANY\" taskType=\"Major\">\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"approval\"/>\n</task>	\n<task assignee=\"approval.operator\" autoExecute=\"Y\" displayName=\"审批\" form=\"/snaker/flow/approval\" layout=\"252,116,-1,-1\" name=\"approval\" performType=\"ANY\" taskType=\"Major\">\n<transition g=\"\" name=\"transition3\" offset=\"0,0\" to=\"decision1\"/>\n</task>\n<decision displayName=\"decision1\" expr=\"#result\" layout=\"384,118,-1,-1\" name=\"decision1\">\n<transition displayName=\"同意\" g=\"\" name=\"agree\" offset=\"0,0\" to=\"end1\"/>\n<transition displayName=\"不同意\" g=\"408,68;172,68\" name=\"disagree\" offset=\"0,0\" to=\"apply\"/>\n</decision>\n</process>\n',0,'2015-04-11 09:10:35',NULL),('376d3e6e40f14bd6948352f5183465bc','leave','请假流程测试',NULL,'/snaker/flow/all',1,'<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<!--\n  ~ /* Copyright 2013-2014 the original author or authors.\n  ~  *\n  ~  * Licensed under the Apache License, Version 2.0 (the \"License\");\n  ~  * you may not use this file except in compliance with the License.\n  ~  * You may obtain a copy of the License at\n  ~  *\n  ~  *     http://www.apache.org/licenses/LICENSE-2.0\n  ~  *\n  ~  * Unless required by applicable law or agreed to in writing, software\n  ~  * distributed under the License is distributed on an \"AS IS\" BASIS,\n  ~  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\n  ~  * See the License for the specific language governing permissions and\n  ~  * limitations under the License.\n  ~  */\n  -->\n\n<process displayName=\"请假流程测试\" instanceUrl=\"/snaker/flow/all\" name=\"leave\">\n<start displayName=\"start1\" layout=\"24,124,-1,-1\" name=\"start1\">\n<transition g=\"\" name=\"transition1\" offset=\"0,0\" to=\"apply\"/>\n</start>\n<end displayName=\"end1\" layout=\"570,124,-1,-1\" name=\"end1\"/>\n<task assignee=\"apply.operator\" displayName=\"请假申请\" form=\"/flow/leave/apply\" layout=\"117,122,-1,-1\" name=\"apply\" performType=\"ANY\">\n<transition g=\"\" name=\"transition2\" offset=\"0,0\" to=\"approveDept\"/>\n</task>\n<task assignee=\"approveDept.operator\" displayName=\"部门经理审批\" form=\"/flow/leave/approveDept\" layout=\"272,122,-1,-1\" name=\"approveDept\" performType=\"ANY\">\n<transition g=\"\" name=\"transition3\" offset=\"0,0\" to=\"decision1\"/>\n</task>\n<decision displayName=\"decision1\" expr=\"#day &gt; 2 ? \'transition5\' : \'transition4\'\" layout=\"426,124,-1,-1\" name=\"decision1\">\n<transition displayName=\"&lt;=2天\" g=\"\" name=\"transition4\" offset=\"0,0\" to=\"end1\"/>\n<transition displayName=\"&gt;2天\" g=\"\" name=\"transition5\" offset=\"0,0\" to=\"approveBoss\"/>\n</decision>\n<task assignee=\"approveBoss.operator\" displayName=\"总经理审批\" form=\"/flow/leave/approveBoss\" layout=\"404,231,-1,-1\" name=\"approveBoss\" performType=\"ANY\">\n<transition g=\"\" name=\"transition6\" offset=\"0,0\" to=\"end1\"/>\n</task>\n</process>\n',0,'2015-04-11 09:10:35',NULL);

/*Table structure for table `wf_surrogate` */

DROP TABLE IF EXISTS `wf_surrogate`;

CREATE TABLE `wf_surrogate` (
  `id` varchar(100) NOT NULL COMMENT '主键ID',
  `process_Name` varchar(100) DEFAULT NULL COMMENT '流程名称',
  `operator` varchar(100) DEFAULT NULL COMMENT '授权人',
  `surrogate` varchar(100) DEFAULT NULL COMMENT '代理人',
  `odate` varchar(64) DEFAULT NULL COMMENT '操作时间',
  `sdate` varchar(64) DEFAULT NULL COMMENT '开始时间',
  `edate` varchar(64) DEFAULT NULL COMMENT '结束时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `IDX_SURROGATE_OPERATOR` (`operator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='委托代理表';

/*Data for the table `wf_surrogate` */

/*Table structure for table `wf_task` */

DROP TABLE IF EXISTS `wf_task`;

CREATE TABLE `wf_task` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `order_Id` varchar(32) NOT NULL COMMENT '流程实例ID',
  `task_Name` varchar(100) NOT NULL COMMENT '任务名称',
  `display_Name` varchar(200) NOT NULL COMMENT '任务显示名称',
  `task_Type` tinyint(1) NOT NULL COMMENT '任务类型',
  `perform_Type` tinyint(1) DEFAULT NULL COMMENT '参与类型',
  `operator` varchar(100) DEFAULT NULL COMMENT '任务处理人',
  `create_Time` varchar(50) DEFAULT NULL COMMENT '任务创建时间',
  `finish_Time` varchar(50) DEFAULT NULL COMMENT '任务完成时间',
  `expire_Time` varchar(50) DEFAULT NULL COMMENT '任务期望完成时间',
  `action_Url` varchar(200) DEFAULT NULL COMMENT '任务处理的url',
  `parent_Task_Id` varchar(100) DEFAULT NULL COMMENT '父任务ID',
  `variable` varchar(2000) DEFAULT NULL COMMENT '附属变量json存储',
  `version` tinyint(1) DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`),
  KEY `IDX_TASK_ORDER` (`order_Id`),
  KEY `IDX_TASK_TASKNAME` (`task_Name`),
  KEY `IDX_TASK_PARENTTASK` (`parent_Task_Id`),
  CONSTRAINT `wf_task_ibfk_1` FOREIGN KEY (`order_Id`) REFERENCES `wf_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务表';

/*Data for the table `wf_task` */

insert  into `wf_task`(`id`,`order_Id`,`task_Name`,`display_Name`,`task_Type`,`perform_Type`,`operator`,`create_Time`,`finish_Time`,`expire_Time`,`action_Url`,`parent_Task_Id`,`variable`,`version`) values ('0f424afc48194e7d9e39d9e757284a95','6854b07429604b99a0ef2bc1fa9e7b23','approveDept','部门经理审批',0,0,NULL,'2015-04-12 16:40:37',NULL,NULL,'/flow/leave/approveDept','6bd145ca7f53413fa54ad3a6acb45fe4','{\"taskId\":\"\",\"S-ACTOR\":\"admin\",\"approveBoss.operator\":\"admin\",\"apply.operator\":\"admin\",\"submit\":\"提交\",\"approveDept.operator\":\"admin\",\"reason\":\"22222222222\",\"processId\":\"376d3e6e40f14bd6948352f5183465bc\",\"day\":3,\"orderId\":\"\"}',0),('4b4bff5c16e84a87b22aa0f9a50a94a2','08d0bcfe936040a8a0f8354421339ce0','approveBoss','总经理审批',0,0,NULL,'2015-04-12 17:32:00',NULL,NULL,'/flow/leave/approveBoss','f79c935411c647c3b7545cb563f6a9af','{\"taskId\":\"f79c935411c647c3b7545cb563f6a9af\",\"approveBoss.operator\":\"admin\",\"ccOperatorName\":\"\",\"submit\":\"提交\",\"reason\":\"22222222222\",\"processId\":\"376d3e6e40f14bd6948352f5183465bc\",\"nextOperator\":\"\",\"S-ACTOR\":\"admin\",\"apply.operator\":\"admin\",\"approveDept.operator\":\"admin\",\"ccOperator\":\"\",\"nextOperatorName\":\"\",\"method\":\"0\",\"day\":3,\"approveDept.suggest\":\"1111\",\"orderId\":\"08d0bcfe936040a8a0f8354421339ce0\"}',0);

/*Table structure for table `wf_task_actor` */

DROP TABLE IF EXISTS `wf_task_actor`;

CREATE TABLE `wf_task_actor` (
  `task_Id` varchar(32) NOT NULL COMMENT '任务ID',
  `actor_Id` varchar(100) NOT NULL COMMENT '参与者ID',
  KEY `IDX_TASKACTOR_TASK` (`task_Id`),
  CONSTRAINT `wf_task_actor_ibfk_1` FOREIGN KEY (`task_Id`) REFERENCES `wf_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务参与者表';

/*Data for the table `wf_task_actor` */

insert  into `wf_task_actor`(`task_Id`,`actor_Id`) values ('0f424afc48194e7d9e39d9e757284a95','admin'),('4b4bff5c16e84a87b22aa0f9a50a94a2','admin');

/*Table structure for table `wf_workitem` */

DROP TABLE IF EXISTS `wf_workitem`;

CREATE TABLE `wf_workitem` (
  `task_id` varchar(255) NOT NULL,
  `process_id` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `order_no` varchar(255) DEFAULT NULL,
  `process_name` varchar(255) DEFAULT NULL,
  `instance_url` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `order_create_time` varchar(255) DEFAULT NULL,
  `order_expire_time` varchar(255) DEFAULT NULL,
  `order_variable` varchar(255) DEFAULT NULL,
  `task_name` varchar(255) DEFAULT NULL,
  `task_key` varchar(255) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `task_create_time` varchar(255) DEFAULT NULL,
  `task_end_time` varchar(255) DEFAULT NULL,
  `task_expire_time` varchar(255) DEFAULT NULL,
  `action_url` varchar(255) DEFAULT NULL,
  `task_type` int(11) DEFAULT NULL,
  `perform_type` int(11) DEFAULT NULL,
  `task_variable` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wf_workitem` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
