-- ========================================
-- 危险品物流管理系统 - 数据更新脚本
-- 直接执行此脚本即可更新现有数据
-- ========================================

USE ssmlyz86;

-- ========================================
-- 更新驾驶员数据 (jiashiyuan)
-- ========================================
UPDATE jiashiyuan SET 
    zhanghao = CASE id
        WHEN 11 THEN 'driver001'
        WHEN 12 THEN 'driver002'
        WHEN 13 THEN 'driver003'
        WHEN 14 THEN 'driver004'
        WHEN 15 THEN 'driver005'
        WHEN 16 THEN 'driver006'
        WHEN 17 THEN 'driver007'
        WHEN 18 THEN 'driver008'
    END,
    xingming = CASE id
        WHEN 11 THEN '张伟'
        WHEN 12 THEN '李强'
        WHEN 13 THEN '王磊'
        WHEN 14 THEN '刘洋'
        WHEN 15 THEN '陈刚'
        WHEN 16 THEN '赵军'
        WHEN 17 THEN '孙鹏'
        WHEN 18 THEN '周涛'
    END,
    nianling = CASE id
        WHEN 11 THEN 38
        WHEN 12 THEN 42
        WHEN 13 THEN 35
        WHEN 14 THEN 45
        WHEN 15 THEN 31
        WHEN 16 THEN 40
        WHEN 17 THEN 36
        WHEN 18 THEN 44
    END,
    shouji = CASE id
        WHEN 11 THEN '13812340001'
        WHEN 12 THEN '13812340002'
        WHEN 13 THEN '13812340003'
        WHEN 14 THEN '13812340004'
        WHEN 15 THEN '13812340005'
        WHEN 16 THEN '13812340006'
        WHEN 17 THEN '13812340007'
        WHEN 18 THEN '13812340008'
    END,
    jiazhaoyouxiaoqi = CASE id
        WHEN 11 THEN '2026-05-15'
        WHEN 12 THEN '2025-08-20'
        WHEN 13 THEN '2027-03-10'
        WHEN 14 THEN '2025-12-25'
        WHEN 15 THEN '2026-09-08'
        WHEN 16 THEN '2025-04-18'
        WHEN 17 THEN '2026-11-30'
        WHEN 18 THEN '2025-07-22'
    END
WHERE id BETWEEN 11 AND 18;

-- ========================================
-- 更新车辆数据 (cheliangxinxi)
-- ========================================
UPDATE cheliangxinxi SET 
    chepaihao = CASE id
        WHEN 21 THEN '京A88888'
        WHEN 22 THEN '京B66666'
        WHEN 23 THEN '京C12345'
        WHEN 24 THEN '京D55555'
        WHEN 25 THEN '京E77777'
        WHEN 26 THEN '冀A99999'
        WHEN 27 THEN '冀B11111'
        WHEN 28 THEN '冀C33333'
    END,
    cheliangpinpai = CASE id
        WHEN 21 THEN '东风重卡'
        WHEN 22 THEN '解放重卡'
        WHEN 23 THEN '重汽豪沃'
        WHEN 24 THEN '陕汽德龙'
        WHEN 25 THEN '福田欧曼'
        WHEN 26 THEN '解放J6'
        WHEN 27 THEN '东风天龙'
        WHEN 28 THEN '重汽汕德卡'
    END,
    weixianpinleixing = CASE id
        WHEN 21 THEN '易燃液体'
        WHEN 22 THEN '剧毒化学品'
        WHEN 23 THEN '爆炸品'
        WHEN 24 THEN '易燃气体'
        WHEN 25 THEN '腐蚀性物质'
        WHEN 26 THEN '放射性物质'
        WHEN 27 THEN '氧化剂'
        WHEN 28 THEN '感染性物质'
    END,
    yanse = CASE id
        WHEN 21 THEN '白色'
        WHEN 22 THEN '蓝色'
        WHEN 23 THEN '红色'
        WHEN 24 THEN '黄色'
        WHEN 25 THEN '银色'
        WHEN 26 THEN '黑色'
        WHEN 27 THEN '绿色'
        WHEN 28 THEN '橙色'
    END,
    huandangfangshi = CASE id
        WHEN 21 THEN '自动挡'
        WHEN 22 THEN '自动挡'
        WHEN 23 THEN '手动挡'
        WHEN 24 THEN '自动挡'
        WHEN 25 THEN '自动挡'
        WHEN 26 THEN '自动挡'
        WHEN 27 THEN '手动挡'
        WHEN 28 THEN '自动挡'
    END,
    cheliangxiangqing = CASE id
        WHEN 21 THEN '东风天龙KL危化品运输车，配备GPS定位系统、防碰撞预警、车道偏离预警等安全设备，适合运输各类液体危险品'
        WHEN 22 THEN '解放J6P危险品运输车，配备紧急切断装置、轮胎压力监测系统、侧翻预警系统，适用于剧毒化学品运输'
        WHEN 23 THEN '重汽豪沃T7H爆炸品专用运输车，配备隔热冷却系统、防静电装置、卫星定位系统'
        WHEN 24 THEN '陕汽德龙X3000液化气运输车，配备泄漏报警装置、紧急切断装置、阻火器'
        WHEN 25 THEN '福田欧曼GTL腐蚀性物质运输车，配备防腐内衬、泄漏收集装置、酸碱中和设备'
        WHEN 26 THEN '解放J6P放射性物质专用运输车，配备辐射监测仪、屏蔽装置、专用容器'
        WHEN 27 THEN '东风天龙KL氧化剂运输车，配备温度监测、自动灭火系统、紧急泄漏处理设备'
        WHEN 28 THEN '重汽汕德卡C7H医疗废物运输车，配备密闭车厢、紫外线消毒灯、冷藏系统'
    END,
    dengjiriqi = '2024-01-15'
WHERE id BETWEEN 21 AND 28;

-- ========================================
-- 更新危险品数据 (weixianpinxinxi)
-- ========================================
UPDATE weixianpinxinxi SET 
    weixianpinbianhao = CASE id
        WHEN 31 THEN 'WB00001'
        WHEN 32 THEN 'WB00002'
        WHEN 33 THEN 'WB00003'
        WHEN 34 THEN 'WB00004'
        WHEN 35 THEN 'WB00005'
        WHEN 36 THEN 'WB00006'
        WHEN 37 THEN 'WB00007'
        WHEN 38 THEN 'WB00008'
    END,
    weixianpinmingcheng = CASE id
        WHEN 31 THEN '液化石油气'
        WHEN 32 THEN '浓硫酸'
        WHEN 33 THEN 'TNT炸药'
        WHEN 34 THEN '液氨'
        WHEN 35 THEN '乙醇'
        WHEN 36 THEN '氰化钠'
        WHEN 37 THEN '硝酸铵'
        WHEN 38 THEN '医疗废物'
    END,
    weixianpinleixing = CASE id
        WHEN 31 THEN '易燃气体'
        WHEN 32 THEN '腐蚀性物质'
        WHEN 33 THEN '爆炸品'
        WHEN 34 THEN '有毒气体'
        WHEN 35 THEN '易燃液体'
        WHEN 36 THEN '剧毒化学品'
        WHEN 37 THEN '氧化剂'
        WHEN 38 THEN '感染性物质'
    END,
    guige = CASE id
        WHEN 31 THEN '50吨'
        WHEN 32 THEN '30立方米'
        WHEN 33 THEN '10吨'
        WHEN 34 THEN '25吨'
        WHEN 35 THEN '40吨'
        WHEN 36 THEN '5吨'
        WHEN 37 THEN '60吨'
        WHEN 38 THEN '20吨'
    END,
    zhuyishixiang = CASE id
        WHEN 31 THEN '远离明火和热源，防止暴晒；禁止与氧化剂混运；泄漏时迅速撤离'
        WHEN 32 THEN '防止震动、撞击和倾倒；皮肤接触立即用大量清水冲洗；禁止与金属、有机物接触'
        WHEN 33 THEN '防止撞击、摩擦和明火；远离热源和电源；执行严格的安全操作规程'
        WHEN 34 THEN '密闭操作，加强通风；配备泄漏应急处理设备；作业人员需佩戴防毒面具'
        WHEN 35 THEN '容器密封，防止泄漏；远离火源和高温设备；注意防静电'
        WHEN 36 THEN '严格执行五双管理制度；配备专用防护装备；泄漏时用漂白粉覆盖处理'
        WHEN 37 THEN '防止与可燃物混合；禁止撞击和高温；储存于阴凉干燥处'
        WHEN 38 THEN '采用专用密闭容器运输；禁止与其他货物混装；运输后需彻底消毒'
    END,
    xiangqing = CASE id
        WHEN 31 THEN '液化石油气，主要成分为丙烷、丁烷等烃类混合物，具有易燃、易爆特性。广泛用于工业燃料、民用燃气等领域。运输需采用专用压力容器罐车。'
        WHEN 32 THEN '浓硫酸，浓度98%，强腐蚀性、强氧化性。用于石油精炼、冶金、化工等领域。运输需使用耐酸罐体，配备防腐设备。'
        WHEN 33 THEN '梯恩梯（TNT），黄色晶体，高度爆炸性。用于矿山开采、工程爆破等领域。运输需公安部门审批，配备专用防爆车辆。'
        WHEN 34 THEN '液氨，无色有刺激性气味气体，易溶于水。用于化肥生产、冷链物流等领域。运输需配备氨气检测仪和防护装备。'
        WHEN 35 THEN '乙醇，无色透明液体，易燃。用于医药消毒、化工原料、燃料添加剂等领域。运输需使用专用槽罐车，保持阴凉通风。'
        WHEN 36 THEN '氰化钠，白色结晶粉末，剧毒。用于金矿提取、电镀等领域。运输需公安部门审批，配备专业押运人员。'
        WHEN 37 THEN '硝酸铵，白色结晶，氧化剂。与可燃物混合形成爆炸性混合物。用于农业肥料、民用炸药等领域。运输储存需严格管理。'
        WHEN 38 THEN '医疗废物，包括使用过的一次性注射器、输液器、废弃药品等。可能携带病原微生物。需专用冷藏车辆运输，送指定处理厂处置。'
    END,
    dengjiriqi = '2024-02-01'
WHERE id BETWEEN 31 AND 38;

-- ========================================
-- 更新运输信息数据 (yunshuxinxi)
-- ========================================
UPDATE yunshuxinxi SET 
    yunshucheci = CASE id
        WHEN 51 THEN 'YSCC2024032001'
        WHEN 52 THEN 'YSCC2024032002'
        WHEN 53 THEN 'YSCC2024032101'
        WHEN 54 THEN 'YSCC2024032102'
        WHEN 55 THEN 'YSCC2024032201'
        WHEN 56 THEN 'YSCC2024032202'
        WHEN 57 THEN 'YSCC2024032301'
        WHEN 58 THEN 'YSCC2024032302'
    END,
    weixianpinbianhao = CASE id
        WHEN 51 THEN 'WB00001'
        WHEN 52 THEN 'WB00002'
        WHEN 53 THEN 'WB00003'
        WHEN 54 THEN 'WB00004'
        WHEN 55 THEN 'WB00005'
        WHEN 56 THEN 'WB00006'
        WHEN 57 THEN 'WB00007'
        WHEN 58 THEN 'WB00008'
    END,
    weixianpinmingcheng = CASE id
        WHEN 51 THEN '液化石油气'
        WHEN 52 THEN '浓硫酸'
        WHEN 53 THEN 'TNT炸药'
        WHEN 54 THEN '液氨'
        WHEN 55 THEN '乙醇'
        WHEN 56 THEN '氰化钠'
        WHEN 57 THEN '硝酸铵'
        WHEN 58 THEN '医疗废物'
    END,
    shuliang = CASE id
        WHEN 51 THEN 50
        WHEN 52 THEN 30
        WHEN 53 THEN 10
        WHEN 54 THEN 25
        WHEN 55 THEN 40
        WHEN 56 THEN 5
        WHEN 57 THEN 60
        WHEN 58 THEN 20
    END,
    qidian = CASE id
        WHEN 51 THEN '燕山石化仓库'
        WHEN 52 THEN '天津化工厂'
        WHEN 53 THEN '河北迁安矿业'
        WHEN 54 THEN '山东齐鲁石化'
        WHEN 55 THEN '江苏南京化工'
        WHEN 56 THEN '辽宁葫芦岛'
        WHEN 57 THEN '内蒙古包头'
        WHEN 58 THEN '北京协和医院'
    END,
    zhongdian = CASE id
        WHEN 51 THEN '北京大兴燃气站'
        WHEN 52 THEN '河北保定化工厂'
        WHEN 53 THEN '山西大同煤矿'
        WHEN 54 THEN '河南郑州化工园'
        WHEN 55 THEN '浙江宁波港'
        WHEN 56 THEN '吉林长春化工园'
        WHEN 57 THEN '山西太原化肥厂'
        WHEN 58 THEN '北京医疗废物处理中心'
    END,
    zhuangtai = CASE id
        WHEN 51 THEN '运输中'
        WHEN 52 THEN '运输完成'
        WHEN 53 THEN '运输中'
        WHEN 54 THEN '运输中'
        WHEN 55 THEN '运输完成'
        WHEN 56 THEN '运输中'
        WHEN 57 THEN '运输中'
        WHEN 58 THEN '运输中'
    END,
    zhanghao = CASE id
        WHEN 51 THEN 'driver001'
        WHEN 52 THEN 'driver002'
        WHEN 53 THEN 'driver003'
        WHEN 54 THEN 'driver004'
        WHEN 55 THEN 'driver005'
        WHEN 56 THEN 'driver006'
        WHEN 57 THEN 'driver007'
        WHEN 58 THEN 'driver008'
    END,
    xingming = CASE id
        WHEN 51 THEN '张伟'
        WHEN 52 THEN '李强'
        WHEN 53 THEN '王磊'
        WHEN 54 THEN '刘洋'
        WHEN 55 THEN '陈刚'
        WHEN 56 THEN '赵军'
        WHEN 57 THEN '孙鹏'
        WHEN 58 THEN '周涛'
    END,
    chepaihao = CASE id
        WHEN 51 THEN '京A88888'
        WHEN 52 THEN '京B66666'
        WHEN 53 THEN '京C12345'
        WHEN 54 THEN '京D55555'
        WHEN 55 THEN '京E77777'
        WHEN 56 THEN '冀A99999'
        WHEN 57 THEN '冀B11111'
        WHEN 58 THEN '冀C33333'
    END,
    cheliangpinpai = CASE id
        WHEN 51 THEN '东风重卡'
        WHEN 52 THEN '解放重卡'
        WHEN 53 THEN '重汽豪沃'
        WHEN 54 THEN '陕汽德龙'
        WHEN 55 THEN '福田欧曼'
        WHEN 56 THEN '解放J6'
        WHEN 57 THEN '东风天龙'
        WHEN 58 THEN '重汽汕德卡'
    END,
    sudu = CASE id
        WHEN 51 THEN '72'
        WHEN 52 THEN '65'
        WHEN 53 THEN '68'
        WHEN 54 THEN '75'
        WHEN 55 THEN '80'
        WHEN 56 THEN '70'
        WHEN 57 THEN '62'
        WHEN 58 THEN '45'
    END,
    fulladdress = CASE id
        WHEN 51 THEN '北京市朝阳区东四环'
        WHEN 52 THEN '北京市西城区南礼士路'
        WHEN 53 THEN '河北省廊坊市广阳区'
        WHEN 54 THEN '山东省德州市德城区'
        WHEN 55 THEN '上海市嘉定区安亭镇'
        WHEN 56 THEN '辽宁省锦州市古塔区'
        WHEN 57 THEN '内蒙古呼和浩特市回民区'
        WHEN 58 THEN '北京市海淀区中关村'
    END
WHERE id BETWEEN 51 AND 58;

-- ========================================
-- 更新运输车次数据 (yunshucheci)
-- ========================================
UPDATE yunshucheci SET 
    yunshucheci = CASE id
        WHEN 41 THEN 'YSCC2024032001'
        WHEN 42 THEN 'YSCC2024032002'
        WHEN 43 THEN 'YSCC2024032101'
        WHEN 44 THEN 'YSCC2024032102'
        WHEN 45 THEN 'YSCC2024032201'
        WHEN 46 THEN 'YSCC2024032202'
        WHEN 47 THEN 'YSCC2024032301'
        WHEN 48 THEN 'YSCC2024032302'
    END,
    weixianpinbianhao = CASE id
        WHEN 41 THEN 'WB00001'
        WHEN 42 THEN 'WB00002'
        WHEN 43 THEN 'WB00003'
        WHEN 44 THEN 'WB00004'
        WHEN 45 THEN 'WB00005'
        WHEN 46 THEN 'WB00006'
        WHEN 47 THEN 'WB00007'
        WHEN 48 THEN 'WB00008'
    END,
    weixianpinmingcheng = CASE id
        WHEN 41 THEN '液化石油气'
        WHEN 42 THEN '浓硫酸'
        WHEN 43 THEN 'TNT炸药'
        WHEN 44 THEN '液氨'
        WHEN 45 THEN '乙醇'
        WHEN 46 THEN '氰化钠'
        WHEN 47 THEN '硝酸铵'
        WHEN 48 THEN '医疗废物'
    END,
    shuliang = CASE id
        WHEN 41 THEN 50
        WHEN 42 THEN 30
        WHEN 43 THEN 10
        WHEN 44 THEN 25
        WHEN 45 THEN 40
        WHEN 46 THEN 5
        WHEN 47 THEN 60
        WHEN 48 THEN 20
    END,
    qidian = CASE id
        WHEN 41 THEN '燕山石化仓库'
        WHEN 42 THEN '天津化工厂'
        WHEN 43 THEN '河北迁安矿业'
        WHEN 44 THEN '山东齐鲁石化'
        WHEN 45 THEN '江苏南京化工'
        WHEN 46 THEN '辽宁葫芦岛'
        WHEN 47 THEN '内蒙古包头'
        WHEN 48 THEN '北京协和医院'
    END,
    zhongdian = CASE id
        WHEN 41 THEN '北京大兴燃气站'
        WHEN 42 THEN '河北保定化工厂'
        WHEN 43 THEN '山西大同煤矿'
        WHEN 44 THEN '河南郑州化工园'
        WHEN 45 THEN '浙江宁波港'
        WHEN 46 THEN '吉林长春化工园'
        WHEN 47 THEN '山西太原化肥厂'
        WHEN 48 THEN '北京医疗废物处理中心'
    END,
    yunshuzhuangtai = CASE id
        WHEN 41 THEN '已发车'
        WHEN 42 THEN '已到达'
        WHEN 43 THEN '已发车'
        WHEN 44 THEN '运输中'
        WHEN 45 THEN '已到达'
        WHEN 46 THEN '运输中'
        WHEN 47 THEN '已发车'
        WHEN 48 THEN '运输中'
    END,
    zhanghao = CASE id
        WHEN 41 THEN 'driver001'
        WHEN 42 THEN 'driver002'
        WHEN 43 THEN 'driver003'
        WHEN 44 THEN 'driver004'
        WHEN 45 THEN 'driver005'
        WHEN 46 THEN 'driver006'
        WHEN 47 THEN 'driver007'
        WHEN 48 THEN 'driver008'
    END,
    xingming = CASE id
        WHEN 41 THEN '张伟'
        WHEN 42 THEN '李强'
        WHEN 43 THEN '王磊'
        WHEN 44 THEN '刘洋'
        WHEN 45 THEN '陈刚'
        WHEN 46 THEN '赵军'
        WHEN 47 THEN '孙鹏'
        WHEN 48 THEN '周涛'
    END,
    chepaihao = CASE id
        WHEN 41 THEN '京A88888'
        WHEN 42 THEN '京B66666'
        WHEN 43 THEN '京C12345'
        WHEN 44 THEN '京D55555'
        WHEN 45 THEN '京E77777'
        WHEN 46 THEN '冀A99999'
        WHEN 47 THEN '冀B11111'
        WHEN 48 THEN '冀C33333'
    END,
    cheliangpinpai = CASE id
        WHEN 41 THEN '东风重卡'
        WHEN 42 THEN '解放重卡'
        WHEN 43 THEN '重汽豪沃'
        WHEN 44 THEN '陕汽德龙'
        WHEN 45 THEN '福田欧曼'
        WHEN 46 THEN '解放J6'
        WHEN 47 THEN '东风天龙'
        WHEN 48 THEN '重汽汕德卡'
    END,
    beizhu = CASE id
        WHEN 41 THEN '正常运输中'
        WHEN 42 THEN '货物已签收'
        WHEN 43 THEN '需公安护送'
        WHEN 44 THEN '途经服务区休整'
        WHEN 45 THEN '已卸货完成'
        WHEN 46 THEN '已通过检查站'
        WHEN 47 THEN '正常运输'
        WHEN 48 THEN '冷藏运输中'
    END
WHERE id BETWEEN 41 AND 48;

-- ========================================
-- 更新警报数据 (jingbaojiemian)
-- ========================================
UPDATE jingbaojiemian SET 
    biaoti = CASE id
        WHEN 71 THEN '京A88888超速告警'
        WHEN 72 THEN '京B66666偏离路线'
        WHEN 73 THEN '京C12345紧急刹车'
        WHEN 74 THEN '京D55555疲劳驾驶预警'
        WHEN 75 THEN '京E77777温度异常'
        WHEN 76 THEN '冀A99999碰撞预警'
        WHEN 77 THEN '冀B11111违规停车'
        WHEN 78 THEN '冀C33333电子围栏告警'
    END,
    dianhua = CASE id
        WHEN 71 THEN '13812340001'
        WHEN 72 THEN '13812340002'
        WHEN 73 THEN '13812340003'
        WHEN 74 THEN '13812340004'
        WHEN 75 THEN '13812340005'
        WHEN 76 THEN '13812340006'
        WHEN 77 THEN '13812340007'
        WHEN 78 THEN '13812340008'
    END,
    jingbaoyuanyin = CASE id
        WHEN 71 THEN '车辆超速行驶，当前速度105km/h，超过限定速度30%'
        WHEN 72 THEN '车辆偏离预定路线，已偏离5公里'
        WHEN 73 THEN '车辆急刹车，疑似紧急避让'
        WHEN 74 THEN '驾驶员连续驾驶超过4小时'
        WHEN 75 THEN '货物温度传感器异常，检测到温度超标'
        WHEN 76 THEN '车辆与前车距离过近，触发碰撞预警'
        WHEN 77 THEN '车辆在禁止停车区域停留超过10分钟'
        WHEN 78 THEN '车辆进入禁止通行区域'
    END,
    zhanghao = CASE id
        WHEN 71 THEN 'driver001'
        WHEN 72 THEN 'driver002'
        WHEN 73 THEN 'driver003'
        WHEN 74 THEN 'driver004'
        WHEN 75 THEN 'driver005'
        WHEN 76 THEN 'driver006'
        WHEN 77 THEN 'driver007'
        WHEN 78 THEN 'driver008'
    END,
    xingming = CASE id
        WHEN 71 THEN '张伟'
        WHEN 72 THEN '李强'
        WHEN 73 THEN '王磊'
        WHEN 74 THEN '刘洋'
        WHEN 75 THEN '陈刚'
        WHEN 76 THEN '赵军'
        WHEN 77 THEN '孙鹏'
        WHEN 78 THEN '周涛'
    END,
    sfsh = '已处理',
    shhf = CASE id
        WHEN 71 THEN '已通知驾驶员注意减速慢行，加强监控'
        WHEN 72 THEN '检查GPS定位，确认重新规划路线'
        WHEN 73 THEN '已与驾驶员通话确认情况，安全通过'
        WHEN 74 THEN '已通知驾驶员到服务区休息'
        WHEN 75 THEN '已停车检查，确认货物安全'
        WHEN 76 THEN '已提醒驾驶员注意车距'
        WHEN 77 THEN '已通知驶离，前往正规停车点'
        WHEN 78 THEN '确认是导航误导，已重新规划路线'
    END
WHERE id BETWEEN 71 AND 78;

-- ========================================
-- 更新应急预案数据 (yingjiyuan)
-- ========================================
UPDATE yingjiyuan SET 
    fanganbianhao = CASE id
        WHEN 61 THEN 'YJYB2024001'
        WHEN 62 THEN 'YJYB2024002'
        WHEN 63 THEN 'YJYB2024003'
        WHEN 64 THEN 'YJYB2024004'
        WHEN 65 THEN 'YJYB2024005'
        WHEN 66 THEN 'YJYB2024006'
        WHEN 67 THEN 'YJYB2024007'
        WHEN 68 THEN 'YJYB2024008'
    END,
    fanganbiaoti = CASE id
        WHEN 61 THEN '危险品运输泄漏应急处置预案'
        WHEN 62 THEN '交通事故应急救援预案'
        WHEN 63 THEN '车辆火灾应急处置预案'
        WHEN 64 THEN '恶劣天气安全行车预案'
        WHEN 65 THEN '恐怖袭击防范应急预案'
        WHEN 66 THEN '疲劳驾驶预防管理办法'
        WHEN 67 THEN '危险品车辆故障救援预案'
        WHEN 68 THEN '人员伤亡急救处置预案'
    END,
    fanganjianjie = CASE id
        WHEN 61 THEN '针对危险品运输过程中发生泄漏事故的应急处置方案'
        WHEN 62 THEN '危险品运输车辆发生交通事故时的应急处置方案'
        WHEN 63 THEN '运输车辆发生火灾时的紧急疏散和灭火方案'
        WHEN 64 THEN '暴雨、大雾、冰雪等恶劣天气下的安全行车措施'
        WHEN 65 THEN '针对恐怖袭击和恶意破坏行为的防范和应对方案'
        WHEN 66 THEN '预防和处置驾驶员疲劳驾驶的管理规定'
        WHEN 67 THEN '运输车辆发生机械故障时的应急处置方案'
        WHEN 68 THEN '交通事故造成人员伤亡时的急救处置方案'
    END,
    zhanghao = 'admin',
    xingming = '系统管理员'
WHERE id BETWEEN 61 AND 68;

-- ========================================
-- 更新实时监控数据 (shishijiankong)
-- ========================================
UPDATE shishijiankong SET 
    chepaihao = CASE id
        WHEN 1 THEN '京A88888'
        WHEN 2 THEN '京B66666'
        WHEN 3 THEN '京C12345'
        WHEN 4 THEN '京D55555'
        WHEN 5 THEN '京E77777'
        WHEN 6 THEN '冀A99999'
        WHEN 7 THEN '冀B11111'
        WHEN 8 THEN '冀C33333'
    END,
    fence_longitude = CASE id
        WHEN 1 THEN 116.4074
        WHEN 2 THEN 116.338
        WHEN 3 THEN 115.789
        WHEN 4 THEN 116.588
        WHEN 5 THEN 121.520
        WHEN 6 THEN 123.456
        WHEN 7 THEN 111.758
        WHEN 8 THEN 116.456
    END,
    fence_latitude = CASE id
        WHEN 1 THEN 39.9042
        WHEN 2 THEN 39.9406
        WHEN 3 THEN 39.123
        WHEN 4 THEN 40.123
        WHEN 5 THEN 31.230
        WHEN 6 THEN 41.789
        WHEN 7 THEN 40.823
        WHEN 8 THEN 39.987
    END,
    fence_radius = 5000,
    fence_type = 'circle',
    status = 1
WHERE id BETWEEN 1 AND 8;

-- ========================================
-- 更新车辆数据的车牌号关联
-- ========================================
UPDATE cheliangxinxi SET 
    chepaihao = CASE id
        WHEN 21 THEN '京A88888'
        WHEN 22 THEN '京B66666'
        WHEN 23 THEN '京C12345'
        WHEN 24 THEN '京D55555'
        WHEN 25 THEN '京E77777'
        WHEN 26 THEN '冀A99999'
        WHEN 27 THEN '冀B11111'
        WHEN 28 THEN '冀C33333'
    END
WHERE id BETWEEN 21 AND 28;

SELECT '数据更新完成！' AS Result;
