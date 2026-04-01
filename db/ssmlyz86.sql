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
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */

--
-- Current Database: `ssmlyz86`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='车辆信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cheliangxinxi`
--

LOCK TABLES `cheliangxinxi` WRITE;
/*!40000 ALTER TABLE `cheliangxinxi` DISABLE KEYS */;
INSERT INTO `cheliangxinxi` VALUES 
(1,'2024-03-15 08:00:00','京A88888','东风重卡','易燃液体','白色','自动挡','upload/truck1.jpg','2023-06-15','东风天龙KL危化品运输车，配备GPS定位系统、防碰撞预警、车道偏离预警等安全设备，适合运输各类液体危险品'),
(2,'2024-03-15 08:10:00','京B66666','解放重卡','剧毒化学品','蓝色','自动挡','upload/truck2.jpg','2023-07-20','解放J6P危险品运输车，配备紧急切断装置、轮胎压力监测系统、侧翻预警系统，适用于剧毒化学品运输'),
(3,'2024-03-15 08:20:00','京C12345','重汽豪沃','爆炸品','红色','手动挡','upload/truck3.jpg','2023-05-10','重汽豪沃T7H爆炸品专用运输车，配备隔热冷却系统、防静电装置、卫星定位系统'),
(4,'2024-03-15 08:30:00','京D55555','陕汽德龙','易燃气体','黄色','自动挡','upload/truck4.jpg','2023-08-25','陕汽德龙X3000液化气运输车，配备泄漏报警装置、紧急切断装置、阻火器'),
(5,'2024-03-15 08:40:00','京E77777','福田欧曼','腐蚀性物质','银色','自动挡','upload/truck5.jpg','2023-09-12','福田欧曼GTL腐蚀性物质运输车，配备防腐内衬、泄漏收集装置、酸碱中和设备'),
(6,'2024-03-15 08:50:00','冀A99999','解放J6','放射性物质','黑色','自动挡','upload/truck6.jpg','2023-04-18','解放J6P放射性物质专用运输车，配备辐射监测仪、屏蔽装置、专用容器'),
(7,'2024-03-15 09:00:00','冀B11111','东风天龙','氧化剂','绿色','手动挡','upload/truck7.jpg','2023-10-05','东风天龙KL氧化剂运输车，配备温度监测、自动灭火系统、紧急泄漏处理设备'),
(8,'2024-03-15 09:10:00','冀C33333','重汽汕德卡','感染性物质','橙色','自动挡','upload/truck8.jpg','2023-11-22','重汽汕德卡C7H医疗废物运输车，配备密闭车厢、紫外线消毒灯、冷藏系统');
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
  `jiazhaoyouxiaoqi` varchar(200) DEFAULT NULL COMMENT '驾照有效期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zhanghao` (`zhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='驾驶员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiashiyuan`
--

LOCK TABLES `jiashiyuan` WRITE;
/*!40000 ALTER TABLE `jiashiyuan` DISABLE KEYS */;
INSERT INTO `jiashiyuan` VALUES 
(1,'2024-01-10 08:00:00','driver001','123456','张伟',38,'男','13812340001','upload/driver1.jpg','2026-05-15'),
(2,'2024-01-10 08:10:00','driver002','123456','李强',42,'男','13812340002','upload/driver2.jpg','2025-08-20'),
(3,'2024-01-10 08:20:00','driver003','123456','王磊',35,'男','13812340003','upload/driver3.jpg','2027-03-10'),
(4,'2024-01-10 08:30:00','driver004','123456','刘洋',45,'男','13812340004','upload/driver4.jpg','2025-12-25'),
(5,'2024-01-10 08:40:00','driver005','123456','陈刚',31,'男','13812340005','upload/driver5.jpg','2026-09-08'),
(6,'2024-01-10 08:50:00','driver006','123456','赵军',40,'男','13812340006','upload/driver6.jpg','2025-04-18'),
(7,'2024-01-10 09:00:00','driver007','123456','孙鹏',36,'男','13812340007','upload/driver7.jpg','2026-11-30'),
(8,'2024-01-10 09:10:00','driver008','123456','周涛',44,'男','13812340008','upload/driver8.jpg','2025-07-22');
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
  `jingbaoyuanyin` varchar(200) DEFAULT NULL COMMENT '警报原因',
  `jingbaoshijian` datetime DEFAULT NULL COMMENT '警报时间',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `sfsh` varchar(200) DEFAULT '待审核' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='警报界面';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jingbaojiemian`
--

LOCK TABLES `jingbaojiemian` WRITE;
/*!40000 ALTER TABLE `jingbaojiemian` DISABLE KEYS */;
INSERT INTO `jingbaojiemian` VALUES 
(71,'2024-03-20 14:30:00','京A88888超速告警','13812340001','车辆超速行驶，当前速度105km/h，超过限定速度30%','2024-03-20 14:28:00','driver001','张伟','已处理','已通知驾驶员注意减速慢行，加强监控'),
(72,'2024-03-21 09:15:00','京B66666偏离路线','13812340002','车辆偏离预定路线，已偏离5公里','2024-03-21 09:12:00','driver002','李强','已处理','检查GPS定位，确认重新规划路线'),
(73,'2024-03-22 16:45:00','京C12345紧急刹车','13812340003','车辆急刹车，疑似紧急避让','2024-03-22 16:43:00','driver003','王磊','已处理','已与驾驶员通话确认情况，安全通过'),
(74,'2024-03-23 11:20:00','京D55555疲劳驾驶预警','13812340004','驾驶员连续驾驶超过4小时','2024-03-23 11:18:00','driver004','刘洋','已处理','已通知驾驶员到服务区休息'),
(75,'2024-03-24 08:05:00','京E77777温度异常','13812340005','货物温度传感器异常，检测到温度超标','2024-03-24 08:03:00','driver005','陈刚','已处理','已停车检查，确认货物安全'),
(76,'2024-03-25 13:50:00','冀A99999碰撞预警','13812340006','车辆与前车距离过近，触发碰撞预警','2024-03-25 13:48:00','driver006','赵军','已处理','已提醒驾驶员注意车距'),
(77,'2024-03-26 17:30:00','冀B11111违规停车','13812340007','车辆在禁止停车区域停留超过10分钟','2024-03-26 17:28:00','driver007','孙鹏','已处理','已通知驶离，前往正规停车点'),
(78,'2024-03-27 10:40:00','冀C33333电子围栏告警','13812340008','车辆进入禁止通行区域','2024-03-27 10:38:00','driver008','周涛','已处理','确认是导航误导，已重新规划路线');
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
INSERT INTO `token` VALUES (1,1,'admin','users','管理员','ss8jpycoms7mbzkfehy07i2t38gsdcjv','2024-03-28 08:00:00','2024-03-29 08:00:00'),(2,1,'driver001','jiashiyuan','驾驶员','6ya35ow4fk2k5aj8gp1e7oqbayfxvokk','2024-03-28 08:05:00','2024-03-29 08:05:00');
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
INSERT INTO `users` VALUES (1,'admin','admin','管理员','2024-01-01 08:00:00');
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
  `zhuyishixiang` longtext COMMENT '注意事项',
  `fengmian` varchar(200) DEFAULT NULL COMMENT '封面',
  `xiangqing` longtext COMMENT '详情',
  `dengjiriqi` date DEFAULT NULL COMMENT '登记日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `weixianpinbianhao` (`weixianpinbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='危险品信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixianpinxinxi`
--

LOCK TABLES `weixianpinxinxi` WRITE;
/*!40000 ALTER TABLE `weixianpinxinxi` DISABLE KEYS */;
INSERT INTO `weixianpinxinxi` VALUES 
(31,'2024-02-01 09:00:00','WB00001','液化石油气','易燃气体','50吨','50','远离明火和热源，防止暴晒；禁止与氧化剂混运；泄漏时迅速撤离','upload/wx1.jpg','液化石油气，主要成分为丙烷、丁烷等烃类混合物，具有易燃、易爆特性。广泛用于工业燃料、民用燃气等领域。运输需采用专用压力容器罐车。','2024-02-01'),
(32,'2024-02-01 09:10:00','WB00002','浓硫酸','腐蚀性物质','30立方米','30','防止震动、撞击和倾倒；皮肤接触立即用大量清水冲洗；禁止与金属、有机物接触','upload/wx2.jpg','浓硫酸，浓度98%，强腐蚀性、强氧化性。用于石油精炼、冶金、化工等领域。运输需使用耐酸罐体，配备防腐设备。','2024-02-01'),
(33,'2024-02-01 09:20:00','WB00003','TNT炸药','爆炸品','10吨','10','防止撞击、摩擦和明火；远离热源和电源；执行严格的安全操作规程','upload/wx3.jpg','梯恩梯（TNT），黄色晶体，高度爆炸性。用于矿山开采、工程爆破等领域。运输需公安部门审批，配备专用防爆车辆。','2024-02-01'),
(34,'2024-02-01 09:30:00','WB00004','液氨','有毒气体','25吨','25','密闭操作，加强通风；配备泄漏应急处理设备；作业人员需佩戴防毒面具','upload/wx4.jpg','液氨，无色有刺激性气味气体，易溶于水。用于化肥生产、冷链物流等领域。运输需配备氨气检测仪和防护装备。','2024-02-01'),
(35,'2024-02-01 09:40:00','WB00005','乙醇','易燃液体','40吨','40','容器密封，防止泄漏；远离火源和高温设备；注意防静电','upload/wx5.jpg','乙醇，无色透明液体，易燃。用于医药消毒、化工原料、燃料添加剂等领域。运输需使用专用槽罐车，保持阴凉通风。','2024-02-01'),
(36,'2024-02-01 09:50:00','WB00006','氰化钠','剧毒化学品','5吨','5','严格执行五双管理制度；配备专用防护装备；泄漏时用漂白粉覆盖处理','upload/wx6.jpg','氰化钠，白色结晶粉末，剧毒。用于金矿提取、电镀等领域。运输需公安部门审批，配备专业押运人员。','2024-02-01'),
(37,'2024-02-01 10:00:00','WB00007','硝酸铵','氧化剂','60吨','60','防止与可燃物混合；禁止撞击和高温；储存于阴凉干燥处','upload/wx7.jpg','硝酸铵，白色结晶，氧化剂。与可燃物混合形成爆炸性混合物。用于农业肥料、民用炸药等领域。运输储存需严格管理。','2024-02-01'),
(38,'2024-02-01 10:10:00','WB00008','医疗废物','感染性物质','20吨','20','采用专用密闭容器运输；禁止与其他货物混装；运输后需彻底消毒','upload/wx8.jpg','医疗废物，包括使用过的一次性注射器、输液器、废弃药品等。可能携带病原微生物。需专用冷藏车辆运输，送指定处理厂处置。','2024-02-01');
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
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fanganbianhao` (`fanganbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='应急预案';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yingjiyuan`
--

LOCK TABLES `yingjiyuan` WRITE;
/*!40000 ALTER TABLE `yingjiyuan` DISABLE KEYS */;
INSERT INTO `yingjiyuan` VALUES 
(61,'2024-03-01 10:00:00','YJYB2024001','危险品运输泄漏应急处置预案','针对危险品运输过程中发生泄漏事故的应急处置方案','一、事故特点分析：\n1. 危险品泄漏可能导致中毒、火灾、爆炸等次生事故\n2. 泄漏物可能污染土壤、水源\n3. 事故发生在道路等开放空间，处置难度大\n\n二、应急响应程序：\n1. 驾驶员立即停车，关闭发动机\n2. 拉起警戒线，禁止明火\n3. 拨打119、110报警，同时报告公司监控中心\n4. 穿戴防护装备，检查泄漏情况\n5. 采取堵漏、围堰、覆盖等措施控制泄漏\n6. 疏散周围人员至安全区域\n7. 配合专业救援队伍进行处置\n\n三、注意事项：\n1. 切勿独自盲目处置\n2. 保持上风方向操作\n3. 泄漏物禁止直接接触\n4. 事后需进行环境和土壤检测','2024-03-01 10:00:00','admin','系统管理员'),
(62,'2024-03-01 10:10:00','YJYB2024002','交通事故应急救援预案','危险品运输车辆发生交通事故时的应急处置方案','一、事故分级：\n1. 轻微事故：无人员伤亡，货物完好\n2. 较大事故：造成人员伤亡或货物泄漏\n3. 重大事故：引发火灾、爆炸等次生灾害\n\n二、处置流程：\n1. 保护现场，开启危险警示灯\n2. 拨打120、122报警\n3. 检查货物状态，报告监控中心\n4. 如有泄漏，按泄漏处置预案执行\n5. 配合交警和消防部门工作\n6. 做好事故现场证据保全\n\n三、特殊要求：\n1. 不得擅自离开现场\n2. 禁止移动事故车辆\n3. 保护危险品标志和证件','2024-03-01 10:10:00','admin','系统管理员'),
(63,'2024-03-01 10:20:00','YJYB2024003','车辆火灾应急处置预案','运输车辆发生火灾时的紧急疏散和灭火方案','一、火灾类型：\n1. 电气火灾：线路短路、设备故障\n2. 货物火灾：危险品自燃或被引燃\n3. 轮胎火灾：制动过热引发\n\n二、应急措施：\n1. 立即停车，关闭总电源\n2. 取出车载灭火器扑救初期火灾\n3. 危险品火灾需使用专用灭火剂\n4. 疏散周围车辆和人员\n5. 拨打119报警，说明危险品类型\n6. 车辆无法控制时，立即撤离至安全地带\n\n三、灭火器材配置：\n1. 干粉灭火器4具（4kg/具）\n2. 二氧化碳灭火器2具\n3. 消防沙若干','2024-03-01 10:20:00','admin','系统管理员'),
(64,'2024-03-01 10:30:00','YJYB2024004','恶劣天气安全行车预案','暴雨、大雾、冰雪等恶劣天气下的安全行车措施','一、暴雨天气：\n1. 降低车速，保持安全距离\n2. 避开低洼积水路段\n3. 开启雾灯和示廓灯\n4. 必要时在安全地点停车等待\n\n二、大雾天气：\n1. 开启雾灯、近光灯和示廓灯\n2. 降低车速至50km/h以下\n3. 加大跟车距离\n4. 禁止超车和变道\n\n三、冰雪天气：\n1. 安装防滑链\n2. 车速控制在30km/h以下\n3. 避免紧急制动和急转向\n4. 上坡时提前减档，保持动力\n\n四、应急联络：\n如遇紧急情况，立即联系公司调度中心','2024-03-01 10:30:00','admin','系统管理员'),
(65,'2024-03-01 10:40:00','YJYB2024005','恐怖袭击防范应急预案','针对恐怖袭击和恶意破坏行为的防范和应对方案','一、防范措施：\n1. 加强驾驶员安全培训\n2. 安装GPS监控和报警系统\n3. 规划安全运输路线\n4. 配备必要的防护器材\n\n二、识别可疑情况：\n1. 车辆被跟踪或拦截\n2. 有人试图强行上车\n3. 收到恐怖威胁信息\n4. 发现可疑物品\n\n三、应急处置：\n1. 锁闭车门车窗\n2. 按动紧急报警按钮\n3. 迅速驶向最近的安全区域\n4. 拨打110报警\n5. 保护货物和自身安全\n\n四、事后处置：\n配合公安机关调查取证','2024-03-01 10:40:00','admin','系统管理员'),
(66,'2024-03-01 10:50:00','YJYB2024006','疲劳驾驶预防管理办法','预防和处置驾驶员疲劳驾驶的管理规定','一、疲劳驾驶危害：\n1. 反应迟钝，判断力下降\n2. 操作失误风险增加\n3. 极易引发交通事故\n\n二、预防措施：\n1. 单次连续驾驶不超过4小时\n2. 24小时内累计驾驶不超过8小时\n3. 夜间驾驶不超过6小时\n4. 保持充足睡眠\n\n三、监测手段：\n1. GPS监控行驶时间和速度\n2. 车载DSM驾驶员监控系统\n3. 定期发送休息提醒\n\n四、应急处置：\n1. 发现疲劳迹象立即停车休息\n2. 到最近服务区或安全地点休整\n3. 饮用咖啡等提神饮料\n4. 严重疲劳需换人或休息','2024-03-01 10:50:00','admin','系统管理员'),
(67,'2024-03-01 11:00:00','YJYB2024007','危险品车辆故障救援预案','运输车辆发生机械故障时的应急处置方案','一、常见故障类型：\n1. 轮胎爆胎或漏气\n2. 发动机故障\n3. 制动系统异常\n4. 电气系统故障\n\n二、应急处置：\n1. 开启危险警示灯\n2. 缓慢靠边停车\n3. 放置三角警示牌（距车150米）\n4. 拨打救援电话\n5. 做好安全警戒\n\n三、特殊要求：\n1. 危险品车辆禁止路边随意维修\n2. 需使用专业救援队伍\n3. 远离火源和热源\n4. 保持通讯畅通','2024-03-01 11:00:00','admin','系统管理员'),
(68,'2024-03-01 11:10:00','YJYB2024008','人员伤亡急救处置预案','交通事故造成人员伤亡时的急救处置方案','一、急救原则：\n1. 先救命，后治伤\n2. 快速止血，固定骨折\n3. 保持呼吸道通畅\n4. 避免二次伤害\n\n二、急救步骤：\n1. 评估现场安全性\n2. 检查意识、呼吸、脉搏\n3. 拨打120急救电话\n4. 进行心肺复苏（如需要）\n5. 止血、包扎、固定\n6. 等待专业救援\n\n三、注意事项：\n1. 脊柱受伤者勿随意搬动\n2. 烧伤者勿撕脱衣物\n3. 昏迷者保持侧卧位\n4. 保持伤者体温\n\n四、联络方式：\n公司急救电话：400-XXX-XXXX','2024-03-01 11:10:00','admin','系统管理员');
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
  `qidian` varchar(200) DEFAULT NULL COMMENT '起点',
  `zhongdian` varchar(200) DEFAULT NULL COMMENT '终点',
  `yunshulujing` longtext COMMENT '运输路径',
  `yunshuzhuangtai` varchar(200) DEFAULT NULL COMMENT '运输状态',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `chepaihao` varchar(200) DEFAULT NULL COMMENT '车牌号',
  `cheliangpinpai` varchar(200) DEFAULT NULL COMMENT '车辆品牌',
  `yunshushijian` datetime DEFAULT NULL COMMENT '运输时间',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yunshucheci` (`yunshucheci`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='运输车次';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yunshucheci`
--

LOCK TABLES `yunshucheci` WRITE;
/*!40000 ALTER TABLE `yunshucheci` DISABLE KEYS */;
INSERT INTO `yunshucheci` VALUES 
(41,'2024-03-20 06:00:00','YSCC2024032001','WB00001','液化石油气','50','燕山石化仓库','北京大兴燃气站','京港澳高速-南六环-京开高速','已发车','driver001','张伟','京A88888','东风重卡','2024-03-20 06:30:00','正常运输中','upload/ys1.jpg'),
(42,'2024-03-20 07:00:00','YSCC2024032002','WB00002','浓硫酸','30','天津化工厂','河北保定化工厂','京津高速-京港澳高速','已到达','driver002','李强','京B66666','解放重卡','2024-03-20 07:30:00','货物已签收','upload/ys2.jpg'),
(43,'2024-03-21 08:00:00','YSCC2024032101','WB00003','TNT炸药','10','河北迁安矿业','山西大同煤矿','京哈高速-京港澳高速-京昆高速','已发车','driver003','王磊','京C12345','重汽豪沃','2024-03-21 08:30:00','需公安护送','upload/ys3.jpg'),
(44,'2024-03-21 09:00:00','YSCC2024032102','WB00004','液氨','25','山东齐鲁石化','河南郑州化工园','京沪高速-连霍高速-京港澳高速','运输中','driver004','刘洋','京D55555','陕汽德龙','2024-03-21 09:30:00','途经服务区休整','upload/ys4.jpg'),
(45,'2024-03-22 06:00:00','YSCC2024032201','WB00005','乙醇','40','江苏南京化工','浙江宁波港','京沪高速-杭州湾跨海大桥','已到达','driver005','陈刚','京E77777','福田欧曼','2024-03-22 07:00:00','已卸货完成','upload/ys5.jpg'),
(46,'2024-03-22 08:00:00','YSCC2024032202','WB00006','氰化钠','5','辽宁葫芦岛','吉林长春化工园','京哈高速-长深高速','运输中','driver006','赵军','冀A99999','解放J6','2024-03-22 08:30:00','已通过检查站','upload/ys6.jpg'),
(47,'2024-03-23 07:00:00','YSCC2024032301','WB00007','硝酸铵','60','内蒙古包头','山西太原化肥厂','京藏高速-二广高速','已发车','driver007','孙鹏','冀B11111','东风天龙','2024-03-23 07:30:00','正常运输','upload/ys7.jpg'),
(48,'2024-03-23 10:00:00','YSCC2024032302','WB00008','医疗废物','20','北京协和医院','北京医疗废物处理中心','市区道路-五环路-处理中心','运输中','driver008','周涛','冀C33333','重汽汕德卡','2024-03-23 10:30:00','冷藏运输中','upload/ys8.jpg');
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
  `qidian` varchar(200) DEFAULT NULL COMMENT '起点',
  `zhongdian` varchar(200) DEFAULT NULL COMMENT '终点',
  `zhuangtai` varchar(200) DEFAULT NULL COMMENT '状态',
  `yunshulujing` longtext COMMENT '运输路径',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `chepaihao` varchar(200) DEFAULT NULL COMMENT '车牌号',
  `cheliangpinpai` varchar(200) DEFAULT NULL COMMENT '车辆品牌',
  `kaishishijian` datetime DEFAULT NULL COMMENT '开始时间',
  `jieshushijian` datetime DEFAULT NULL COMMENT '结束时间',
  `sudu` varchar(200) DEFAULT NULL COMMENT '速度',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  `userid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `longitude` float DEFAULT NULL COMMENT '经度',
  `latitude` float DEFAULT NULL COMMENT '纬度',
  `fulladdress` varchar(200) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='运输信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yunshuxinxi`
--

LOCK TABLES `yunshuxinxi` WRITE;
/*!40000 ALTER TABLE `yunshuxinxi` DISABLE KEYS */;
INSERT INTO `yunshuxinxi` VALUES 
(51,'2024-03-20 06:30:00','YSCC2024032001','WB00001','液化石油气',50,'燕山石化仓库','北京大兴燃气站','运输中','京港澳高速-南六环-京开高速','driver001','张伟','京A88888','东风重卡','2024-03-20 06:30:00',NULL,'72','upload/ys1.jpg',1,116.4074,39.9042,'北京市朝阳区东四环'),
(52,'2024-03-20 07:30:00','YSCC2024032002','WB00002','浓硫酸',30,'天津化工厂','河北保定化工厂','运输完成','京津高速-京港澳高速','driver002','李强','京B66666','解放重卡','2024-03-20 07:30:00','2024-03-20 11:30:00','65','upload/ys2.jpg',2,116.338,39.9406,'北京市西城区南礼士路'),
(53,'2024-03-21 08:30:00','YSCC2024032101','WB00003','TNT炸药',10,'河北迁安矿业','山西大同煤矿','运输中','京哈高速-京港澳高速-京昆高速','driver003','王磊','京C12345','重汽豪沃','2024-03-21 08:30:00',NULL,'68','upload/ys3.jpg',3,115.789,39.123,'河北省廊坊市广阳区'),
(54,'2024-03-21 09:30:00','YSCC2024032102','WB00004','液氨',25,'山东齐鲁石化','河南郑州化工园','运输中','京沪高速-连霍高速-京港澳高速','driver004','刘洋','京D55555','陕汽德龙','2024-03-21 09:30:00',NULL,'75','upload/ys4.jpg',4,116.588,40.123,'山东省德州市德城区'),
(55,'2024-03-22 07:00:00','YSCC2024032201','WB00005','乙醇',40,'江苏南京化工','浙江宁波港','运输完成','京沪高速-杭州湾跨海大桥','driver005','陈刚','京E77777','福田欧曼','2024-03-22 07:00:00','2024-03-22 14:00:00','80','upload/ys5.jpg',5,121.520,31.230,'上海市嘉定区安亭镇'),
(56,'2024-03-22 08:30:00','YSCC2024032202','WB00006','氰化钠',5,'辽宁葫芦岛','吉林长春化工园','运输中','京哈高速-长深高速','driver006','赵军','冀A99999','解放J6','2024-03-22 08:30:00',NULL,'70','upload/ys6.jpg',6,123.456,41.789,'辽宁省锦州市古塔区'),
(57,'2024-03-23 07:30:00','YSCC2024032301','WB00007','硝酸铵',60,'内蒙古包头','山西太原化肥厂','运输中','京藏高速-二广高速','driver007','孙鹏','冀B11111','东风天龙','2024-03-23 07:30:00',NULL,'62','upload/ys7.jpg',7,111.758,40.823,'内蒙古自治区呼和浩特市回民区'),
(58,'2024-03-23 10:30:00','YSCC2024032302','WB00008','医疗废物',20,'北京协和医院','北京医疗废物处理中心','运输中','市区道路-五环路-处理中心','driver008','周涛','冀C33333','重汽汕德卡','2024-03-23 10:30:00',NULL,'45','upload/ys8.jpg',8,116.456,39.987,'北京市海淀区中关村');
/*!40000 ALTER TABLE `yunshuxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shishijiankong`
--

DROP TABLE IF EXISTS `shishijiankong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shishijiankong` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `chepaihao` varchar(200) DEFAULT NULL COMMENT '车牌号',
  `fence_longitude` float DEFAULT NULL COMMENT '电子围栏中心经度',
  `fence_latitude` float DEFAULT NULL COMMENT '电子围栏中心纬度',
  `fence_radius` int(11) DEFAULT '5000' COMMENT '电子围栏半径（米）',
  `fence_type` varchar(200) DEFAULT 'circle' COMMENT '围栏类型：circle-圆形，rectangle-矩形',
  `status` int(11) DEFAULT '1' COMMENT '是否启用：0-禁用，1-启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='实时监控配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shishijiankong`
--

LOCK TABLES `shishijiankong` WRITE;
/*!40000 ALTER TABLE `shishijiankong` DISABLE KEYS */;
INSERT INTO `shishijiankong` VALUES 
(1,NOW(),'京A88888',116.397428,39.90923,5000,'circle',1),
(2,NOW(),'京B66666',116.338,39.9406,5000,'circle',1),
(3,NOW(),'京C12345',115.789,39.123,5000,'circle',1),
(4,NOW(),'京D55555',116.588,40.123,5000,'circle',1),
(5,NOW(),'京E77777',121.520,31.230,5000,'circle',1),
(6,NOW(),'冀A99999',123.456,41.789,5000,'circle',1),
(7,NOW(),'冀B11111',111.758,40.823,5000,'circle',1),
(8,NOW(),'冀C33333',116.456,39.987,5000,'circle',1);
/*!40000 ALTER TABLE `shishijiankong` ENABLE KEYS */;
UNLOCK TABLES;

-- 管理员账号：admin / admin
-- 驾驶员账号示例：driver001 / 123456

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
