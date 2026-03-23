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


import com.dao.YingjiyuanDao;
import com.entity.YingjiyuanEntity;
import com.service.YingjiyuanService;
import com.entity.vo.YingjiyuanVO;
import com.entity.view.YingjiyuanView;

@Service("yingjiyuanService")
public class YingjiyuanServiceImpl extends ServiceImpl<YingjiyuanDao, YingjiyuanEntity> implements YingjiyuanService {
	

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<YingjiyuanEntity> page = this.selectPage(
                new Query<YingjiyuanEntity>(params).getPage(),
                new EntityWrapper<YingjiyuanEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<YingjiyuanEntity> wrapper) {
		  Page<YingjiyuanView> page =new Query<YingjiyuanView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<YingjiyuanVO> selectListVO(Wrapper<YingjiyuanEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public YingjiyuanVO selectVO(Wrapper<YingjiyuanEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<YingjiyuanView> selectListView(Wrapper<YingjiyuanEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public YingjiyuanView selectView(Wrapper<YingjiyuanEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
