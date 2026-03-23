-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: ssmlyz86
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ssmlyz86`
--

/*!40000 DROP DATABASE IF EXISTS `ssmlyz86`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ssmlyz86` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `ssmlyz86`;

--
-- Table structure for table `cheliangxinxi`
--

DROP TABLE IF EXISTS `cheliangxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cheliangxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `chepaihao` varchar(200) NOT NULL COMMENT '车牌号',
  `cheliangpinpai` varchar(200) NOT NULL COMMENT '车辆品牌',
  `weixianpinleixing` varchar(200) DEFAULT NULL COMMENT '危险品类型',
  `yanse` varchar(200) DEFAULT NULL COMMENT '颜色',
  `huandangfangshi` varchar(200) DEFAULT NULL COMMENT '换挡方式',
  `cheliangzhaopian` varchar(200) DEFAULT NULL COMMENT '车辆照片',
  `dengjiriqi` date DEFAULT NULL COMMENT '登记日期',
  `cheliangxiangqing` longtext COMMENT '车辆详情',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chepaihao` (`chepaihao`)
) ENGINE=InnoDB AUTO_INCREMENT=1667808991474 DEFAULT CHARSET=utf8 COMMENT='车辆信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cheliangxinxi`
--

LOCK TABLES `cheliangxinxi` WRITE;
/*!40000 ALTER TABLE `cheliangxinxi` DISABLE KEYS */;
INSERT INTO `cheliangxinxi` VALUES (21,'2022-11-07 08:13:44','车牌号1','车辆品牌1','危险品类型1','颜色1','手动挡','upload/cheliangxinxi_cheliangzhaopian1.jpg','2022-11-07','车辆详情1'),(22,'2022-11-07 08:13:44','车牌号2','车辆品牌2','危险品类型2','颜色2','手动挡','upload/cheliangxinxi_cheliangzhaopian2.jpg','2022-11-07','车辆详情2'),(23,'2022-11-07 08:13:44','车牌号3','车辆品牌3','危险品类型3','颜色3','手动挡','upload/cheliangxinxi_cheliangzhaopian3.jpg','2022-11-07','车辆详情3'),(24,'2022-11-07 08:13:44','车牌号4','车辆品牌4','危险品类型4','颜色4','手动挡','upload/cheliangxinxi_cheliangzhaopian4.jpg','2022-11-07','车辆详情4'),(25,'2022-11-07 08:13:44','车牌号5','车辆品牌5','危险品类型5','颜色5','手动挡','upload/cheliangxinxi_cheliangzhaopian5.jpg','2022-11-07','车辆详情5'),(26,'2022-11-07 08:13:44','车牌号6','车辆品牌6','危险品类型6','颜色6','手动挡','upload/cheliangxinxi_cheliangzhaopian6.jpg','2022-11-07','车辆详情6'),(27,'2022-11-07 08:13:44','车牌号7','车辆品牌7','危险品类型7','颜色7','手动挡','upload/cheliangxinxi_cheliangzhaopian7.jpg','2022-11-07','车辆详情7'),(28,'2022-11-07 08:13:44','车牌号8','车辆品牌8','危险品类型8','颜色8','手动挡','upload/cheliangxinxi_cheliangzhaopian8.jpg','2022-11-07','车辆详情8'),(1667808991473,'2022-11-07 08:16:30','京W45612','丰田','水电费省道','省道发送到','自动挡','upload/1667808985275.jpg','2022-11-06','<p>省道发送到省道发送到发送到发送到发送到发送到发送到</p>');
/*!40000 ALTER TABLE `cheliangxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'picture1','upload/picture1.jpg'),(2,'picture2','upload/picture2.jpg'),(3,'picture3','upload/picture3.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiashiyuan`
--

DROP TABLE IF EXISTS `jiashiyuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiashiyuan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhanghao` varchar(200) NOT NULL COMMENT '账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) NOT NULL COMMENT '姓名',
  `nianling` int(11) DEFAULT NULL COMMENT '年龄',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `touxiang` varchar(200) DEFAULT NULL COMMENT '头像',
  `jiazhaoyouxiaoqi` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `zhanghao` (`zhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1667808936888 DEFAULT CHARSET=utf8 COMMENT='驾驶员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiashiyuan`
--

LOCK TABLES `jiashiyuan` WRITE;
/*!40000 ALTER TABLE `jiashiyuan` DISABLE KEYS */;
INSERT INTO `jiashiyuan` VALUES (11,'2022-11-07 08:13:44','账号1','123456','姓名1',1,'男','13823888881','upload/jiashiyuan_touxiang1.jpg','驾照有效期1'),(12,'2022-11-07 08:13:44','账号2','123456','姓名2',2,'男','13823888882','upload/jiashiyuan_touxiang2.jpg','驾照有效期2'),(13,'2022-11-07 08:13:44','账号3','123456','姓名3',3,'男','13823888883','upload/jiashiyuan_touxiang3.jpg','驾照有效期3'),(14,'2022-11-07 08:13:44','账号4','123456','姓名4',4,'男','13823888884','upload/jiashiyuan_touxiang4.jpg','驾照有效期4'),(15,'2022-11-07 08:13:44','账号5','123456','姓名5',5,'男','13823888885','upload/jiashiyuan_touxiang5.jpg','驾照有效期5'),(16,'2022-11-07 08:13:44','账号6','123456','姓名6',6,'男','13823888886','upload/jiashiyuan_touxiang6.jpg','驾照有效期6'),(17,'2022-11-07 08:13:44','账号7','123456','姓名7',7,'男','13823888887','upload/jiashiyuan_touxiang7.jpg','驾照有效期7'),(18,'2022-11-07 08:13:44','账号8','123456','姓名8',8,'男','13823888888','upload/jiashiyuan_touxiang8.jpg','驾照有效期8'),(1667808936887,'2022-11-07 08:15:36','11','11','地方',11,'男','15111122211','upload/1667808934272.jpg','3年');
/*!40000 ALTER TABLE `jiashiyuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jingbaojiemian`
--

DROP TABLE IF EXISTS `jingbaojiemian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jingbaojiemian` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题',
  `dianhua` varchar(200) DEFAULT NULL COMMENT '电话',
  `jingbaoyuanyin` varchar(200) DEFAULT NULL,
  `jingbaoshijian` datetime DEFAULT NULL COMMENT '警报时间',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `sfsh` varchar(200) DEFAULT '待审核' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1667809090569 DEFAULT CHARSET=utf8 COMMENT='警报界面';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jingbaojiemian`
--

LOCK TABLES `jingbaojiemian` WRITE;
/*!40000 ALTER TABLE `jingbaojiemian` DISABLE KEYS */;
INSERT INTO `jingbaojiemian` VALUES (71,'2022-11-07 08:13:44','标题1','电话1','警报原因1','2022-11-07 16:13:44','账号1','姓名1','是',''),(72,'2022-11-07 08:13:44','标题2','电话2','警报原因2','2022-11-07 16:13:44','账号2','姓名2','是',''),(73,'2022-11-07 08:13:44','标题3','电话3','警报原因3','2022-11-07 16:13:44','账号3','姓名3','是',''),(74,'2022-11-07 08:13:44','标题4','电话4','警报原因4','2022-11-07 16:13:44','账号4','姓名4','是',''),(75,'2022-11-07 08:13:44','标题5','电话5','警报原因5','2022-11-07 16:13:44','账号5','姓名5','是',''),(76,'2022-11-07 08:13:44','标题6','电话6','警报原因6','2022-11-07 16:13:44','账号6','姓名6','是',''),(77,'2022-11-07 08:13:44','标题7','电话7','警报原因7','2022-11-07 16:13:44','账号7','姓名7','是',''),(78,'2022-11-07 08:13:44','标题8','电话8','警报原因8','2022-11-07 16:13:44','账号8','姓名8','是',''),(1667809090568,'2022-11-07 08:18:10','水电费省道省道','阿萨德按时','水电费省道发送到发送到发送到','2022-11-07 16:18:45','11','地方','是','收到1122');
/*!40000 ALTER TABLE `jingbaojiemian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,1667808936887,'11','jiashiyuan','驾驶员','ss8jpycoms7mbzkfehy07i2t38gsdcjv','2022-11-07 08:15:40','2022-11-07 09:19:02'),(2,1,'admin','users','管理员','6ya35ow4fk2k5aj8gp1e7oqbayfxvokk','2022-11-07 08:15:58','2022-11-07 09:18:15');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','管理员','2022-11-07 08:13:44');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weixianpinxinxi`
--

DROP TABLE IF EXISTS `weixianpinxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixianpinxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `weixianpinbianhao` varchar(200) DEFAULT NULL COMMENT '危险品编号',
  `weixianpinmingcheng` varchar(200) DEFAULT NULL COMMENT '危险品名称',
  `weixianpinleixing` varchar(200) DEFAULT NULL COMMENT '危险品类型',
  `guige` varchar(200) DEFAULT NULL COMMENT '规格',
  `shuliang` int(11) DEFAULT NULL COMMENT '数量',
  `zhuyishixiang` longtext,
  `fengmian` varchar(200) DEFAULT NULL,
  `xiangqing` longtext COMMENT '详情',
  `dengjiriqi` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `weixianpinbianhao` (`weixianpinbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=1667809011737 DEFAULT CHARSET=utf8 COMMENT='危险品信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixianpinxinxi`
--

LOCK TABLES `weixianpinxinxi` WRITE;
/*!40000 ALTER TABLE `weixianpinxinxi` DISABLE KEYS */;
INSERT INTO `weixianpinxinxi` VALUES (31,'2022-11-07 08:13:44','1111111111','危险品名称1','危险品类型1','规格1',1,'注意事项1','upload/weixianpinxinxi_fengmian1.jpg','详情1','2022-11-07'),(32,'2022-11-07 08:13:44','2222222222','危险品名称2','危险品类型2','规格2',2,'注意事项2','upload/weixianpinxinxi_fengmian2.jpg','详情2','2022-11-07'),(33,'2022-11-07 08:13:44','3333333333','危险品名称3','危险品类型3','规格3',3,'注意事项3','upload/weixianpinxinxi_fengmian3.jpg','详情3','2022-11-07'),(34,'2022-11-07 08:13:44','4444444444','危险品名称4','危险品类型4','规格4',4,'注意事项4','upload/weixianpinxinxi_fengmian4.jpg','详情4','2022-11-07'),(35,'2022-11-07 08:13:44','5555555555','危险品名称5','危险品类型5','规格5',5,'注意事项5','upload/weixianpinxinxi_fengmian5.jpg','详情5','2022-11-07'),(36,'2022-11-07 08:13:44','6666666666','危险品名称6','危险品类型6','规格6',6,'注意事项6','upload/weixianpinxinxi_fengmian6.jpg','详情6','2022-11-07'),(37,'2022-11-07 08:13:44','7777777777','危险品名称7','危险品类型7','规格7',7,'注意事项7','upload/weixianpinxinxi_fengmian7.jpg','详情7','2022-11-07'),(38,'2022-11-07 08:13:44','8888888888','危险品名称8','危险品类型8','规格8',8,'注意事项8','upload/weixianpinxinxi_fengmian8.jpg','详情8','2022-11-07'),(1667809011736,'2022-11-07 08:16:50','1667809034288','第一危险品','地方省道','省道发送到',30,'水电费省道发送到发送到水电费省道发送到发送到水电费省道发送到发送到水电费省道发送到发送到','upload/1667809004820.jpg','<p>水电费省道发送到发送到水电费省道发送到发送到水电费省道发送到发送到水电费省道发送到发送到水电费省道发送到发送到水电费省道发送到发送到水电费省道发送到发送到水电费省道发送到发送到水电费省道发送到发送到水电费省道发送到发送到水电费省道发送到发送到水电费省道发送到发送到水电费省道发送到发送到水电费省道发送到发送到水电费省道发送到发送到</p>','2022-11-07');
/*!40000 ALTER TABLE `weixianpinxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yingjiyuan`
--

DROP TABLE IF EXISTS `yingjiyuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yingjiyuan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `fanganbianhao` varchar(200) DEFAULT NULL COMMENT '方案编号',
  `fanganbiaoti` varchar(200) DEFAULT NULL COMMENT '方案标题',
  `fanganjianjie` longtext COMMENT '方案简介',
  `fanganneirong` longtext COMMENT '方案内容',
  `dengjishijian` datetime DEFAULT NULL COMMENT '登记时间',
  `zhanghao` varchar(200) DEFAULT NULL,
  `xingming` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fanganbianhao` (`fanganbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=1667809083659 DEFAULT CHARSET=utf8 COMMENT='应急预案';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yingjiyuan`
--

LOCK TABLES `yingjiyuan` WRITE;
/*!40000 ALTER TABLE `yingjiyuan` DISABLE KEYS */;
INSERT INTO `yingjiyuan` VALUES (61,'2022-11-07 08:13:44','1111111111','方案标题1','方案简介1','方案内容1','2022-11-07 16:13:44','账号1','姓名1'),(62,'2022-11-07 08:13:44','2222222222','方案标题2','方案简介2','方案内容2','2022-11-07 16:13:44','账号2','姓名2'),(63,'2022-11-07 08:13:44','3333333333','方案标题3','方案简介3','方案内容3','2022-11-07 16:13:44','账号3','姓名3'),(64,'2022-11-07 08:13:44','4444444444','方案标题4','方案简介4','方案内容4','2022-11-07 16:13:44','账号4','姓名4'),(65,'2022-11-07 08:13:44','5555555555','方案标题5','方案简介5','方案内容5','2022-11-07 16:13:44','账号5','姓名5'),(66,'2022-11-07 08:13:44','6666666666','方案标题6','方案简介6','方案内容6','2022-11-07 16:13:44','账号6','姓名6'),(67,'2022-11-07 08:13:44','7777777777','方案标题7','方案简介7','方案内容7','2022-11-07 16:13:44','账号7','姓名7'),(68,'2022-11-07 08:13:44','8888888888','方案标题8','方案简介8','方案内容8','2022-11-07 16:13:44','账号8','姓名8'),(1667809083658,'2022-11-07 08:18:02','1667809116225','省道发送到发送到','省道省道省道省道省道省道','<p>按时打算打算水电费省道发送到水电费打算</p>','2022-11-07 16:18:36','11','地方');
/*!40000 ALTER TABLE `yingjiyuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yunshucheci`
--

DROP TABLE IF EXISTS `yunshucheci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yunshucheci` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yunshucheci` varchar(200) DEFAULT NULL COMMENT '运输车次',
  `weixianpinbianhao` varchar(200) DEFAULT NULL COMMENT '危险品编号',
  `weixianpinmingcheng` varchar(200) DEFAULT NULL COMMENT '危险品名称',
  `shuliang` int(11) DEFAULT NULL COMMENT '数量',
  `qidian` varchar(200) DEFAULT NULL,
  `zhongdian` varchar(200) DEFAULT NULL COMMENT '终点',
  `yunshulujing` longtext,
  `yunshuzhuangtai` varchar(200) DEFAULT NULL COMMENT '运输状态',
  `zhanghao` varchar(200) DEFAULT NULL,
  `xingming` varchar(200) DEFAULT NULL,
  `chepaihao` varchar(200) DEFAULT NULL,
  `cheliangpinpai` varchar(200) DEFAULT NULL,
  `yunshushijian` datetime DEFAULT NULL COMMENT '运输时间',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `tupian` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `yunshucheci` (`yunshucheci`)
) ENGINE=InnoDB AUTO_INCREMENT=1667809046930 DEFAULT CHARSET=utf8 COMMENT='运输车次';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yunshucheci`
--

LOCK TABLES `yunshucheci` WRITE;
/*!40000 ALTER TABLE `yunshucheci` DISABLE KEYS */;
INSERT INTO `yunshucheci` VALUES (41,'2022-11-07 08:13:44','1111111111','危险品编号1','危险品名称1',1,'起点1','终点1','运输路径1','已发车','账号1','姓名1','车牌号1','车辆品牌1','2022-11-07 16:13:44','备注1','upload/yunshucheci_tupian1.jpg'),(42,'2022-11-07 08:13:44','2222222222','危险品编号2','危险品名称2',2,'起点2','终点2','运输路径2','已发车','账号2','姓名2','车牌号2','车辆品牌2','2022-11-07 16:13:44','备注2','upload/yunshucheci_tupian2.jpg'),(43,'2022-11-07 08:13:44','3333333333','危险品编号3','危险品名称3',3,'起点3','终点3','运输路径3','已发车','账号3','姓名3','车牌号3','车辆品牌3','2022-11-07 16:13:44','备注3','upload/yunshucheci_tupian3.jpg'),(44,'2022-11-07 08:13:44','4444444444','危险品编号4','危险品名称4',4,'起点4','终点4','运输路径4','已发车','账号4','姓名4','车牌号4','车辆品牌4','2022-11-07 16:13:44','备注4','upload/yunshucheci_tupian4.jpg'),(45,'2022-11-07 08:13:44','5555555555','危险品编号5','危险品名称5',5,'起点5','终点5','运输路径5','已发车','账号5','姓名5','车牌号5','车辆品牌5','2022-11-07 16:13:44','备注5','upload/yunshucheci_tupian5.jpg'),(46,'2022-11-07 08:13:44','6666666666','危险品编号6','危险品名称6',6,'起点6','终点6','运输路径6','已发车','账号6','姓名6','车牌号6','车辆品牌6','2022-11-07 16:13:44','备注6','upload/yunshucheci_tupian6.jpg'),(47,'2022-11-07 08:13:44','7777777777','危险品编号7','危险品名称7',7,'起点7','终点7','运输路径7','已发车','账号7','姓名7','车牌号7','车辆品牌7','2022-11-07 16:13:44','备注7','upload/yunshucheci_tupian7.jpg'),(48,'2022-11-07 08:13:44','8888888888','危险品编号8','危险品名称8',8,'起点8','终点8','运输路径8','已发车','账号8','姓名8','车牌号8','车辆品牌8','2022-11-07 16:13:44','备注8','upload/yunshucheci_tupian8.jpg'),(1667809046929,'2022-11-07 08:17:25','1667809054941','1667809034288','第一危险品',50,'北京','上海','水电费省道发送到发送到发送到发送到发送到发多少','已发车','11','地方','京W45612','丰田','2022-11-07 16:17:34','地方打算发送到水电费','upload/1667809037757.jpg');
/*!40000 ALTER TABLE `yunshucheci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yunshuxinxi`
--

DROP TABLE IF EXISTS `yunshuxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yunshuxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yunshucheci` varchar(200) DEFAULT NULL COMMENT '运输车次',
  `weixianpinbianhao` varchar(200) DEFAULT NULL COMMENT '危险品编号',
  `weixianpinmingcheng` varchar(200) DEFAULT NULL COMMENT '危险品名称',
  `shuliang` int(11) DEFAULT NULL COMMENT '数量',
  `qidian` varchar(200) DEFAULT NULL,
  `zhongdian` varchar(200) DEFAULT NULL COMMENT '终点',
  `zhuangtai` varchar(200) DEFAULT NULL,
  `yunshulujing` longtext,
  `zhanghao` varchar(200) DEFAULT NULL,
  `xingming` varchar(200) DEFAULT NULL,
  `chepaihao` varchar(200) DEFAULT NULL,
  `cheliangpinpai` varchar(200) DEFAULT NULL,
  `kaishishijian` datetime DEFAULT NULL COMMENT '开始时间',
  `jieshushijian` datetime DEFAULT NULL,
  `sudu` varchar(200) DEFAULT NULL,
  `tupian` varchar(200) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `longitude` float DEFAULT NULL COMMENT '经度',
  `latitude` float DEFAULT NULL COMMENT '纬度',
  `fulladdress` varchar(200) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1667809070564 DEFAULT CHARSET=utf8 COMMENT='运输信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yunshuxinxi`
--

LOCK TABLES `yunshuxinxi` WRITE;
/*!40000 ALTER TABLE `yunshuxinxi` DISABLE KEYS */;
INSERT INTO `yunshuxinxi` VALUES (51,'2022-11-07 08:13:44','运输车次1','危险品编号1','危险品名称1',1,'起点1','终点1','运输完成','运输路径1','账号1','姓名1','车牌号1','车辆品牌1','2022-11-07 16:13:44','2022-11-07 16:13:44','速度1','upload/yunshuxinxi_tupian1.jpg',1,1,1,'宇宙银河系地球1号'),(52,'2022-11-07 08:13:44','运输车次2','危险品编号2','危险品名称2',2,'起点2','终点2','运输完成','运输路径2','账号2','姓名2','车牌号2','车辆品牌2','2022-11-07 16:13:44','2022-11-07 16:13:44','速度2','upload/yunshuxinxi_tupian2.jpg',2,2,2,'宇宙银河系地球2号'),(53,'2022-11-07 08:13:44','运输车次3','危险品编号3','危险品名称3',3,'起点3','终点3','运输完成','运输路径3','账号3','姓名3','车牌号3','车辆品牌3','2022-11-07 16:13:44','2022-11-07 16:13:44','速度3','upload/yunshuxinxi_tupian3.jpg',3,3,3,'宇宙银河系地球3号'),(54,'2022-11-07 08:13:44','运输车次4','危险品编号4','危险品名称4',4,'起点4','终点4','运输完成','运输路径4','账号4','姓名4','车牌号4','车辆品牌4','2022-11-07 16:13:44','2022-11-07 16:13:44','速度4','upload/yunshuxinxi_tupian4.jpg',4,4,4,'宇宙银河系地球4号'),(55,'2022-11-07 08:13:44','运输车次5','危险品编号5','危险品名称5',5,'起点5','终点5','运输完成','运输路径5','账号5','姓名5','车牌号5','车辆品牌5','2022-11-07 16:13:44','2022-11-07 16:13:44','速度5','upload/yunshuxinxi_tupian5.jpg',5,5,5,'宇宙银河系地球5号'),(56,'2022-11-07 08:13:44','运输车次6','危险品编号6','危险品名称6',6,'起点6','终点6','运输完成','运输路径6','账号6','姓名6','车牌号6','车辆品牌6','2022-11-07 16:13:44','2022-11-07 16:13:44','速度6','upload/yunshuxinxi_tupian6.jpg',6,6,6,'宇宙银河系地球6号'),(57,'2022-11-07 08:13:44','运输车次7','危险品编号7','危险品名称7',7,'起点7','终点7','运输完成','运输路径7','账号7','姓名7','车牌号7','车辆品牌7','2022-11-07 16:13:44','2022-11-07 16:13:44','速度7','upload/yunshuxinxi_tupian7.jpg',7,7,7,'宇宙银河系地球7号'),(58,'2022-11-07 08:13:44','运输车次8','危险品编号8','危险品名称8',8,'起点8','终点8','运输完成','运输路径8','账号8','姓名8','车牌号8','车辆品牌8','2022-11-07 16:13:44','2022-11-07 16:13:44','速度8','upload/yunshuxinxi_tupian8.jpg',8,8,8,'宇宙银河系地球8号'),(1667809070563,'2022-11-07 08:17:49','1667809054941','1667809034288','第一危险品',50,'北京','上海','运输完成','水电费省道发送到发送到发送到发送到发送到发多少','11','地方','京W45612','丰田','2022-11-07 16:18:22','2022-11-07 16:18:22','','upload/1667809037757.jpg',NULL,116.338,39.9406,'北京市西城区展览路街道北京动物园');
/*!40000 ALTER TABLE `yunshuxinxi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-06 19:03:28
