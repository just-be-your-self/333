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

import com.entity.YunshucheciEntity;
import com.entity.view.YunshucheciView;

import com.service.YunshucheciService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MD5Util;
import com.utils.MPUtil;
import com.utils.CommonUtil;

/**
 * 运输车次
 * 后端接口
 * @author 
 * @email 
 * @date 2022-11-07 16:13:32
 */
@RestController
@RequestMapping("/yunshucheci")
public class YunshucheciController {
    @Autowired
    private YunshucheciService yunshucheciService;



    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,YunshucheciEntity yunshucheci, 
		HttpServletRequest request){

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("jiashiyuan")) {
			yunshucheci.setZhanghao((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<YunshucheciEntity> ew = new EntityWrapper<YunshucheciEntity>();


		PageUtils page = yunshucheciService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, yunshucheci), params), params));
        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,YunshucheciEntity yunshucheci, 
		HttpServletRequest request){
        EntityWrapper<YunshucheciEntity> ew = new EntityWrapper<YunshucheciEntity>();

		PageUtils page = yunshucheciService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, yunshucheci), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( YunshucheciEntity yunshucheci){
       	EntityWrapper<YunshucheciEntity> ew = new EntityWrapper<YunshucheciEntity>();
      	ew.allEq(MPUtil.allEQMapPre( yunshucheci, "yunshucheci")); 
        return R.ok().put("data", yunshucheciService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(YunshucheciEntity yunshucheci){
        EntityWrapper< YunshucheciEntity> ew = new EntityWrapper< YunshucheciEntity>();
 		ew.allEq(MPUtil.allEQMapPre( yunshucheci, "yunshucheci")); 
		YunshucheciView yunshucheciView =  yunshucheciService.selectView(ew);
		return R.ok("查询运输车次成功").put("data", yunshucheciView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        YunshucheciEntity yunshucheci = yunshucheciService.selectById(id);
        return R.ok().put("data", yunshucheci);
    }

    /**
     * 前端详情
     */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        YunshucheciEntity yunshucheci = yunshucheciService.selectById(id);
        return R.ok().put("data", yunshucheci);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody YunshucheciEntity yunshucheci, HttpServletRequest request){
    	yunshucheci.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(yunshucheci);

        yunshucheciService.insert(yunshucheci);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
	@IgnoreAuth
    @RequestMapping("/add")
    public R add(@RequestBody YunshucheciEntity yunshucheci, HttpServletRequest request){
    	yunshucheci.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(yunshucheci);

        yunshucheciService.insert(yunshucheci);
        return R.ok();
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody YunshucheciEntity yunshucheci, HttpServletRequest request){
        //ValidatorUtils.validateEntity(yunshucheci);
        yunshucheciService.updateById(yunshucheci);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        yunshucheciService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
    /**
     * 提醒接口
     */
	@RequestMapping("/remind/{columnName}/{type}")
	public R remindCount(@PathVariable("columnName") String columnName, HttpServletRequest request, 
						 @PathVariable("type") String type,@RequestParam Map<String, Object> map) {
		map.put("column", columnName);
		map.put("type", type);
		
		if(type.equals("2")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			Date remindStartDate = null;
			Date remindEndDate = null;
			if(map.get("remindstart")!=null) {
				Integer remindStart = Integer.parseInt(map.get("remindstart").toString());
				c.setTime(new Date()); 
				c.add(Calendar.DAY_OF_MONTH,remindStart);
				remindStartDate = c.getTime();
				map.put("remindstart", sdf.format(remindStartDate));
			}
			if(map.get("remindend")!=null) {
				Integer remindEnd = Integer.parseInt(map.get("remindend").toString());
				c.setTime(new Date());
				c.add(Calendar.DAY_OF_MONTH,remindEnd);
				remindEndDate = c.getTime();
				map.put("remindend", sdf.format(remindEndDate));
			}
		}
		
		Wrapper<YunshucheciEntity> wrapper = new EntityWrapper<YunshucheciEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("jiashiyuan")) {
			wrapper.eq("zhanghao", (String)request.getSession().getAttribute("username"));
		}

		int count = yunshucheciService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	








}
