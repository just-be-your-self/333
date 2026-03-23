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


import com.dao.JingbaojiemianDao;
import com.entity.JingbaojiemianEntity;
import com.service.JingbaojiemianService;
import com.entity.vo.JingbaojiemianVO;
import com.entity.view.JingbaojiemianView;

@Service("jingbaojiemianService")
public class JingbaojiemianServiceImpl extends ServiceImpl<JingbaojiemianDao, JingbaojiemianEntity> implements JingbaojiemianService {
	

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<JingbaojiemianEntity> page = this.selectPage(
                new Query<JingbaojiemianEntity>(params).getPage(),
                new EntityWrapper<JingbaojiemianEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<JingbaojiemianEntity> wrapper) {
		  Page<JingbaojiemianView> page =new Query<JingbaojiemianView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<JingbaojiemianVO> selectListVO(Wrapper<JingbaojiemianEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public JingbaojiemianVO selectVO(Wrapper<JingbaojiemianEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<JingbaojiemianView> selectListView(Wrapper<JingbaojiemianEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public JingbaojiemianView selectView(Wrapper<JingbaojiemianEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
