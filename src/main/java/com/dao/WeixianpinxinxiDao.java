package com.dao;

import com.entity.WeixianpinxinxiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.WeixianpinxinxiVO;
import com.entity.view.WeixianpinxinxiView;


/**
 * 危险品信息
 * 
 * @author 
 * @email 
 * @date 2022-11-07 16:13:31
 */
public interface WeixianpinxinxiDao extends BaseMapper<WeixianpinxinxiEntity> {
	
	List<WeixianpinxinxiVO> selectListVO(@Param("ew") Wrapper<WeixianpinxinxiEntity> wrapper);
	
	WeixianpinxinxiVO selectVO(@Param("ew") Wrapper<WeixianpinxinxiEntity> wrapper);
	
	List<WeixianpinxinxiView> selectListView(@Param("ew") Wrapper<WeixianpinxinxiEntity> wrapper);

	List<WeixianpinxinxiView> selectListView(Pagination page,@Param("ew") Wrapper<WeixianpinxinxiEntity> wrapper);
	
	WeixianpinxinxiView selectView(@Param("ew") Wrapper<WeixianpinxinxiEntity> wrapper);
	

}
