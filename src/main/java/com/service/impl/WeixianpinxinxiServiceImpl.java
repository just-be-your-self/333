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


import com.dao.WeixianpinxinxiDao;
import com.entity.WeixianpinxinxiEntity;
import com.service.WeixianpinxinxiService;
import com.entity.vo.WeixianpinxinxiVO;
import com.entity.view.WeixianpinxinxiView;

@Service("weixianpinxinxiService")
public class WeixianpinxinxiServiceImpl extends ServiceImpl<WeixianpinxinxiDao, WeixianpinxinxiEntity> implements WeixianpinxinxiService {
	

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<WeixianpinxinxiEntity> page = this.selectPage(
                new Query<WeixianpinxinxiEntity>(params).getPage(),
                new EntityWrapper<WeixianpinxinxiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<WeixianpinxinxiEntity> wrapper) {
		  Page<WeixianpinxinxiView> page =new Query<WeixianpinxinxiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<WeixianpinxinxiVO> selectListVO(Wrapper<WeixianpinxinxiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public WeixianpinxinxiVO selectVO(Wrapper<WeixianpinxinxiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<WeixianpinxinxiView> selectListView(Wrapper<WeixianpinxinxiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public WeixianpinxinxiView selectView(Wrapper<WeixianpinxinxiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
