-- =========================================
-- 警报记录表 (jingbudakai)
-- 用于存储实时监控中的超速和偏离预警记录
-- =========================================

DROP TABLE IF EXISTS `jingbudakai`;
CREATE TABLE `jingbudakai` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `jingwubianhao` varchar(200) DEFAULT NULL COMMENT '警报编号',
  `jingleixing` varchar(200) DEFAULT NULL COMMENT '警报类型（超速警报/偏离警报）',
  `chepaihao` varchar(200) DEFAULT NULL COMMENT '车牌号',
  `weixianpinmingcheng` varchar(200) DEFAULT NULL COMMENT '危险品名称',
  `chulizhuangtai` varchar(200) DEFAULT NULL COMMENT '处理状态（未处理/已处理）',
  `baojingshijian` datetime DEFAULT NULL COMMENT '警报时间',
  `baojingyuanyin` varchar(2000) DEFAULT NULL COMMENT '警报原因',
  `weizhi` varchar(500) DEFAULT NULL COMMENT '位置',
  `sudu` varchar(200) DEFAULT NULL COMMENT '速度',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名（驾驶员）',
  `chuliren` varchar(200) DEFAULT NULL COMMENT '处理人',
  `chulishijian` datetime DEFAULT NULL COMMENT '处理时间',
  `chulibeizhu` varchar(2000) DEFAULT NULL COMMENT '处理备注',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='警报记录表';

-- =========================================
-- 说明：
-- 1. 警报编号格式：BJ + 时间戳（如 BJ1743245678901）
-- 2. 警报类型：超速警报、偏离警报
-- 3. 处理状态：未处理、已处理
-- 4. 警报时间由前端实时监控模块自动生成
-- =========================================
