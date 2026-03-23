package com.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utils.PageUtils;
import com.utils.Query;


import com.dao.YunshucheciDao;
import com.entity.YunshucheciEntity;
import com.service.YunshucheciService;
import com.entity.vo.YunshucheciVO;
import com.entity.view.YunshucheciView;

@Service("yunshucheciService")
public class YunshucheciServiceImpl extends ServiceImpl<YunshucheciDao, YunshucheciEntity> implements YunshucheciService {
	

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<YunshucheciEntity> page = this.selectPage(
                new Query<YunshucheciEntity>(params).getPage(),
                new EntityWrapper<YunshucheciEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<YunshucheciEntity> wrapper) {
		  Page<YunshucheciView> page =new Query<YunshucheciView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<YunshucheciVO> selectListVO(Wrapper<YunshucheciEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public YunshucheciVO selectVO(Wrapper<YunshucheciEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<YunshucheciView> selectListView(Wrapper<YunshucheciEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public YunshucheciView selectView(Wrapper<YunshucheciEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
