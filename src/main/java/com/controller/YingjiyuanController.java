package com.controller;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.annotation.IgnoreAuth;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.entity.YingjiyuanEntity;
import com.entity.view.YingjiyuanView;
import com.service.YingjiyuanService;
import com.utils.MPUtil;
import com.utils.PageUtils;
import com.utils.R;

/**
 * 应急预案
 * 后端接口
 * @author 
 * @email 
 * @date 2022-11-07 16:13:32
 */
@RestController
@RequestMapping("/yingjiyuan")
public class YingjiyuanController {
    @Autowired
    private YingjiyuanService yingjiyuanService;

    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, YingjiyuanEntity yingjiyuan,
                  HttpServletRequest request) {
        EntityWrapper<YingjiyuanEntity> ew = new EntityWrapper<YingjiyuanEntity>();
        PageUtils page = yingjiyuanService.queryPage(
            params,
            MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, yingjiyuan), params), params)
        );
        return R.ok().put("data", page);
    }

    /**
     * 前端列表
     */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, YingjiyuanEntity yingjiyuan,
                  HttpServletRequest request) {
        EntityWrapper<YingjiyuanEntity> ew = new EntityWrapper<YingjiyuanEntity>();
        PageUtils page = yingjiyuanService.queryPage(
            params,
            MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, yingjiyuan), params), params)
        );
        return R.ok().put("data", page);
    }

    /**
     * 列表
     */
    @RequestMapping("/lists")
    public R list(YingjiyuanEntity yingjiyuan) {
        EntityWrapper<YingjiyuanEntity> ew = new EntityWrapper<YingjiyuanEntity>();
        ew.allEq(MPUtil.allEQMapPre(yingjiyuan, "yingjiyuan"));
        return R.ok().put("data", yingjiyuanService.selectListView(ew));
    }

    /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(YingjiyuanEntity yingjiyuan) {
        EntityWrapper<YingjiyuanEntity> ew = new EntityWrapper<YingjiyuanEntity>();
        ew.allEq(MPUtil.allEQMapPre(yingjiyuan, "yingjiyuan"));
        YingjiyuanView yingjiyuanView = yingjiyuanService.selectView(ew);
        return R.ok("查询应急预案成功").put("data", yingjiyuanView);
    }

    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        YingjiyuanEntity yingjiyuan = yingjiyuanService.selectById(id);
        return R.ok().put("data", yingjiyuan);
    }

    /**
     * 前端详情
     */
    @IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id) {
        YingjiyuanEntity yingjiyuan = yingjiyuanService.selectById(id);
        return R.ok().put("data", yingjiyuan);
    }

    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody YingjiyuanEntity yingjiyuan, HttpServletRequest request) {
        yingjiyuan.setId(new Date().getTime() + new Double(Math.floor(Math.random() * 1000)).longValue());
        yingjiyuanService.insert(yingjiyuan);
        return R.ok();
    }

    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody YingjiyuanEntity yingjiyuan, HttpServletRequest request) {
        yingjiyuan.setId(new Date().getTime() + new Double(Math.floor(Math.random() * 1000)).longValue());
        yingjiyuanService.insert(yingjiyuan);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody YingjiyuanEntity yingjiyuan, HttpServletRequest request) {
        yingjiyuanService.updateById(yingjiyuan);
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        yingjiyuanService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

    /**
     * 提醒接口
     */
    @RequestMapping("/remind/{columnName}/{type}")
    public R remindCount(@PathVariable("columnName") String columnName, HttpServletRequest request,
                         @PathVariable("type") String type, @RequestParam Map<String, Object> map) {
        map.put("column", columnName);
        map.put("type", type);

        if (type.equals("2")) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Calendar c = Calendar.getInstance();
            Date remindStartDate = null;
            Date remindEndDate = null;
            if (map.get("remindstart") != null) {
                Integer remindStart = Integer.parseInt(map.get("remindstart").toString());
                c.setTime(new Date());
                c.add(Calendar.DAY_OF_MONTH, remindStart);
                remindStartDate = c.getTime();
                map.put("remindstart", sdf.format(remindStartDate));
            }
            if (map.get("remindend") != null) {
                Integer remindEnd = Integer.parseInt(map.get("remindend").toString());
                c.setTime(new Date());
                c.add(Calendar.DAY_OF_MONTH, remindEnd);
                remindEndDate = c.getTime();
                map.put("remindend", sdf.format(remindEndDate));
            }
        }

        Wrapper<YingjiyuanEntity> wrapper = new EntityWrapper<YingjiyuanEntity>();
        if (map.get("remindstart") != null) {
            wrapper.ge(columnName, map.get("remindstart"));
        }
        if (map.get("remindend") != null) {
            wrapper.le(columnName, map.get("remindend"));
        }

        int count = yingjiyuanService.selectCount(wrapper);
        return R.ok().put("count", count);
    }
}
