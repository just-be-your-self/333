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


import com.dao.JingbudakaiDao;
import com.entity.JingbudakaiEntity;
import com.service.JingbudakaiService;
import com.entity.vo.JingbudakaiVO;
import com.entity.view.JingbudakaiView;

@Service("jingbudakaiService")
public class JingbudakaiServiceImpl extends ServiceImpl<JingbudakaiDao, JingbudakaiEntity> implements JingbudakaiService {
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<JingbudakaiEntity> page = this.selectPage(
                new Query<JingbudakaiEntity>(params).getPage(),
                new EntityWrapper<JingbudakaiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<JingbudakaiEntity> wrapper) {
		  Page<JingbudakaiView> page =new Query<JingbudakaiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<JingbudakaiVO> selectListVO(Wrapper<JingbudakaiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public JingbudakaiVO selectVO(Wrapper<JingbudakaiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<JingbudakaiView> selectListView(Wrapper<JingbudakaiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public JingbudakaiView selectView(Wrapper<JingbudakaiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
