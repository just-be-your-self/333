package com.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Date;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

import com.utils.ValidatorUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.annotation.IgnoreAuth;

import com.entity.ShishijiankongEntity;
import com.entity.view.ShishijiankongView;
import com.entity.JingbaojiemianEntity;

import com.service.ShishijiankongService;
import com.service.TokenService;
import com.service.YunshuxinxiService;
import com.service.CheliangxinxiService;
import com.service.JingbaojiemianService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MD5Util;
import com.utils.MPUtil;
import com.utils.CommonUtil;

import com.entity.YunshuxinxiEntity;
import com.entity.CheliangxinxiEntity;

/**
 * 实时监控
 * 后端接口
 */
@RestController
@RequestMapping("/shishijiankong")
public class ShishijiankongController {
    
    @Autowired
    private ShishijiankongService shishijiankongService;

    @Autowired
    private YunshuxinxiService yunshuxinxiService;

    @Autowired
    private CheliangxinxiService cheliangxinxiService;

    @Autowired
    private JingbaojiemianService jingbaojiemianService;

    /**
     * 获取所有在线车辆列表
     */
    @RequestMapping("/vehicleList")
    public R vehicleList(@RequestParam Map<String, Object> params) {
        List<YunshuxinxiEntity> list = yunshuxinxiService.selectList(null);
        
        List<Map<String, Object>> result = new ArrayList<>();
        for (YunshuxinxiEntity vehicle : list) {
            Map<String, Object> map = new HashMap<>();
            map.put("id", vehicle.getId());
            map.put("chepaihao", vehicle.getChepaihao());
            map.put("cheliangpinpai", vehicle.getCheliangpinpai());
            map.put("weixianpinleixing", vehicle.getWeixianpinmingcheng());
            map.put("xingming", vehicle.getXingming());
            map.put("longitude", vehicle.getLongitude());
            map.put("latitude", vehicle.getLatitude());
            map.put("sudu", vehicle.getSudu());
            map.put("fulladdress", vehicle.getFulladdress());
            map.put("zhuangtai", vehicle.getZhuangtai());
            
            // 计算车辆状态
            String status = "offline";
            if (vehicle.getLongitude() != null && vehicle.getLatitude() != null) {
                status = "online";
                // 如果有速度信息且超过限制，标记为告警
                if (vehicle.getSudu() != null) {
                    try {
                        double speed = Double.parseDouble(vehicle.getSudu());
                        if (speed > 90) {
                            status = "warning";
                        }
                    } catch (NumberFormatException e) {
                        // 忽略解析错误
                    }
                }
            }
            map.put("status", status);
            
            result.add(map);
        }
        
        return R.ok().put("data", result);
    }

    /**
     * 根据车牌号获取车辆信息
     */
    @RequestMapping("/getByChepaihao")
    public R getByChepaihao(@RequestParam String chepaihao) {
        if (chepaihao == null || chepaihao.trim().isEmpty()) {
            return R.error("车牌号不能为空");
        }
        
        YunshuxinxiEntity vehicle = yunshuxinxiService.selectOne(
            new EntityWrapper<YunshuxinxiEntity>().eq("chepaihao", chepaihao)
        );
        
        if (vehicle == null) {
            return R.error("未找到该车辆");
        }
        
        Map<String, Object> result = new HashMap<>();
        result.put("id", vehicle.getId());
        result.put("chepaihao", vehicle.getChepaihao());
        result.put("cheliangpinpai", vehicle.getCheliangpinpai());
        result.put("weixianpinmingcheng", vehicle.getWeixianpinmingcheng());
        result.put("xingming", vehicle.getXingming());
        result.put("shouji", vehicle.getZhanghao());
        result.put("longitude", vehicle.getLongitude());
        result.put("latitude", vehicle.getLatitude());
        result.put("sudu", vehicle.getSudu());
        result.put("fulladdress", vehicle.getFulladdress());
        result.put("zhuangtai", vehicle.getZhuangtai());
        result.put("qidian", vehicle.getQidian());
        result.put("zhongdian", vehicle.getZhongdian());
        
        return R.ok().put("data", result);
    }

    /**
     * 更新车辆位置（模拟）
     */
    @RequestMapping("/updateLocation")
    @Transactional
    public R updateLocation(@RequestParam String chepaihao, @RequestParam Float longitude, 
                           @RequestParam Float latitude, @RequestParam String sudu) {
        if (chepaihao == null || chepaihao.trim().isEmpty()) {
            return R.error("车牌号不能为空");
        }
        
        YunshuxinxiEntity vehicle = yunshuxinxiService.selectOne(
            new EntityWrapper<YunshuxinxiEntity>().eq("chepaihao", chepaihao)
        );
        
        if (vehicle == null) {
            return R.error("未找到该车辆");
        }
        
        vehicle.setLongitude(longitude);
        vehicle.setLatitude(latitude);
        vehicle.setSudu(sudu);
        yunshuxinxiService.updateById(vehicle);
        
        return R.ok().put("message", "位置更新成功");
    }

    /**
     * 获取模拟车辆位置（模拟车辆移动）
     */
    @RequestMapping("/simulateLocation")
    public R simulateLocation(@RequestParam String chepaihao) {
        if (chepaihao == null || chepaihao.trim().isEmpty()) {
            return R.error("车牌号不能为空");
        }
        
        YunshuxinxiEntity vehicle = yunshuxinxiService.selectOne(
            new EntityWrapper<YunshuxinxiEntity>().eq("chepaihao", chepaihao)
        );
        
        // 如果没有找到车辆，使用默认位置
        float baseLng = 116.397428f;
        float baseLat = 39.90923f;
        float currentLng = baseLng;
        float currentLat = baseLat;
        String currentSpeed = "60";
        
        if (vehicle != null) {
            if (vehicle.getLongitude() != null) {
                currentLng = vehicle.getLongitude();
                baseLng = currentLng;
            }
            if (vehicle.getLatitude() != null) {
                currentLat = vehicle.getLatitude();
                baseLat = currentLat;
            }
            if (vehicle.getSudu() != null) {
                currentSpeed = vehicle.getSudu();
            }
        }
        
        // 模拟位置移动（随机偏移）
        Random random = new Random();
        float offsetLng = (random.nextFloat() - 0.5f) * 0.01f; // 经度偏移约正负500米
        float offsetLat = (random.nextFloat() - 0.5f) * 0.01f; // 纬度偏移约正负500米
        
        currentLng += offsetLng;
        currentLat += offsetLat;
        
        // 模拟速度变化（60-110，便于触发超速预警）
        int speedValue = 60 + random.nextInt(51);
        currentSpeed = String.valueOf(speedValue);
        
        Map<String, Object> result = new HashMap<>();
        result.put("chepaihao", chepaihao);
        result.put("longitude", currentLng);
        result.put("latitude", currentLat);
        result.put("sudu", currentSpeed);
        result.put("timestamp", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        
        // 检查是否超速
        boolean isSpeedWarning = speedValue > 90;
        result.put("speedWarning", isSpeedWarning);
        if (isSpeedWarning) {
            result.put("warningMessage", "警告：车辆超速！当前速度：" + speedValue + " km/h");
            saveSpeedWarningRecord(vehicle, chepaihao, speedValue, currentLng, currentLat);
        }
        
        // 如果找到了车辆，同时更新数据库
        if (vehicle != null) {
            vehicle.setLongitude(currentLng);
            vehicle.setLatitude(currentLat);
            vehicle.setSudu(currentSpeed);
            yunshuxinxiService.updateById(vehicle);
        }
        
        return R.ok().put("data", result);
    }

    /**
     * 检查电子围栏
     */
    @RequestMapping("/checkFence")
    public R checkFence(@RequestParam String chepaihao, @RequestParam Float centerLng,
                        @RequestParam Float centerLat, @RequestParam Float radius) {
        if (chepaihao == null || chepaihao.trim().isEmpty()) {
            return R.error("车牌号不能为空");
        }
        
        YunshuxinxiEntity vehicle = yunshuxinxiService.selectOne(
            new EntityWrapper<YunshuxinxiEntity>().eq("chepaihao", chepaihao)
        );
        
        if (vehicle == null) {
            return R.error("未找到该车辆");
        }
        
        Map<String, Object> result = new HashMap<>();
        result.put("chepaihao", chepaihao);
        result.put("centerLng", centerLng);
        result.put("centerLat", centerLat);
        result.put("radius", radius);
        
        boolean inside = false;
        String message = "车辆在电子围栏范围内";
        
        if (vehicle.getLongitude() != null && vehicle.getLatitude() != null) {
            // 计算两点间距离
            double distance = calculateDistance(
                centerLat, centerLng,
                vehicle.getLatitude(), vehicle.getLongitude()
            );
            
            inside = distance <= radius;
            result.put("distance", distance);
            result.put("inside", inside);
            
            if (inside) {
                message = "车辆在电子围栏范围内，距离中心点：" + String.format("%.2f", distance) + "米";
            } else {
                message = "警告：车辆已偏离电子围栏范围！当前距离：" + String.format("%.2f", distance) + "米，超出范围：" + String.format("%.2f", distance - radius) + "米";
            }
        } else {
            result.put("inside", false);
            message = "无法获取车辆位置";
        }
        
        result.put("message", message);
        result.put("warning", !inside);
        
        return R.ok().put("data", result);
    }

    /**
     * 获取预警列表
     */
    @RequestMapping("/warningList")
    public R warningList(@RequestParam Map<String, Object> params) {
        // 这里可以从数据库或缓存中获取预警记录
        // 目前返回空列表，实际项目中可以接入预警记录表
        List<Map<String, Object>> warnings = new ArrayList<>();
        
        // 获取所有车辆，检查是否有预警
        List<YunshuxinxiEntity> vehicles = yunshuxinxiService.selectList(null);
        
        for (YunshuxinxiEntity vehicle : vehicles) {
            // 检查超速
            if (vehicle.getSudu() != null) {
                try {
                    double speed = Double.parseDouble(vehicle.getSudu());
                    if (speed > 90) {
                        Map<String, Object> warning = new HashMap<>();
                        warning.put("type", "speed");
                        warning.put("chepaihao", vehicle.getChepaihao());
                        warning.put("message", "车辆超速，当前速度：" + vehicle.getSudu() + " km/h");
                        warning.put("time", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                        warnings.add(warning);
                    }
                } catch (NumberFormatException e) {
                    // 忽略
                }
            }
        }
        
        return R.ok().put("data", warnings);
    }

    /**
     * 获取车辆轨迹
     */
    @RequestMapping("/trackHistory")
    public R trackHistory(@RequestParam String chepaihao, @RequestParam(defaultValue = "1") Integer limit) {
        if (chepaihao == null || chepaihao.trim().isEmpty()) {
            return R.error("车牌号不能为空");
        }
        
        // 这里可以从轨迹表中获取历史轨迹
        // 目前返回模拟数据
        List<Map<String, Object>> trackPoints = new ArrayList<>();
        
        YunshuxinxiEntity vehicle = yunshuxinxiService.selectOne(
            new EntityWrapper<YunshuxinxiEntity>().eq("chepaihao", chepaihao)
        );
        
        if (vehicle != null && vehicle.getLongitude() != null) {
            // 生成模拟历史轨迹
            Random random = new Random();
            long currentTime = System.currentTimeMillis();
            
            for (int i = 0; i < limit; i++) {
                Map<String, Object> point = new HashMap<>();
                float lng = vehicle.getLongitude() - (random.nextFloat() * 0.01f * i);
                float lat = vehicle.getLatitude() - (random.nextFloat() * 0.01f * i);
                point.put("longitude", lng);
                point.put("latitude", lat);
                point.put("time", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(currentTime - i * 60000)));
                point.put("sudu", 60 + random.nextInt(20));
                trackPoints.add(point);
            }
        }
        
        return R.ok().put("data", trackPoints);
    }

    /**
     * 获取统计数据
     */
    @RequestMapping("/statistics")
    public R statistics() {
        Map<String, Object> stats = new HashMap<>();
        
        // 车辆总数
        int totalVehicles = yunshuxinxiService.selectCount(null);
        stats.put("totalVehicles", totalVehicles);
        
        // 在线车辆数
        int onlineVehicles = yunshuxinxiService.selectCount(
            new EntityWrapper<YunshuxinxiEntity>()
                .isNotNull("longitude")
                .isNotNull("latitude")
        );
        stats.put("onlineVehicles", onlineVehicles);
        
        // 离线车辆数
        stats.put("offlineVehicles", totalVehicles - onlineVehicles);
        
        // 告警车辆数
        List<YunshuxinxiEntity> allVehicles = yunshuxinxiService.selectList(null);
        int warningCount = 0;
        for (YunshuxinxiEntity vehicle : allVehicles) {
            if (vehicle.getSudu() != null) {
                try {
                    double speed = Double.parseDouble(vehicle.getSudu());
                    if (speed > 90) {
                        warningCount++;
                    }
                } catch (NumberFormatException e) {
                    // 忽略
                }
            }
        }
        stats.put("warningVehicles", warningCount);
        
        return R.ok().put("data", stats);
    }

    /**
     * 保存超速预警记录到警报界面
     */
    private void saveSpeedWarningRecord(YunshuxinxiEntity vehicle, String chepaihao, int speedValue, float longitude, float latitude) {
        JingbaojiemianEntity warning = new JingbaojiemianEntity();
        warning.setId(new Date().getTime() + new Double(Math.floor(Math.random() * 1000)).longValue());
        warning.setBiaoti(chepaihao + "超速告警");
        warning.setJingbaoyuanyin("车辆超速行驶，当前速度" + speedValue + "km/h");
        warning.setJingbaoshijian(new Date());
        warning.setSfsh("待审核");

        if (vehicle != null) {
            warning.setZhanghao(vehicle.getZhanghao());
            warning.setXingming(vehicle.getXingming());
        }

        jingbaojiemianService.insert(warning);
    }

    /**
     * 计算两点间距离（米）
     */
    private double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
        final double R = 6371000; // 地球半径，单位：米
        
        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);
        
        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                   Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
                   Math.sin(dLon / 2) * Math.sin(dLon / 2);
        
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        
        return R * c;
    }
}
