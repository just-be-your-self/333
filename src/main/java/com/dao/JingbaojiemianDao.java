package com.dao;

import com.entity.JingbaojiemianEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.JingbaojiemianVO;
import com.entity.view.JingbaojiemianView;


/**
 * 警报界面
 * 
 * @author 
 * @email 
 * @date 2022-11-07 16:13:32
 */
public interface JingbaojiemianDao extends BaseMapper<JingbaojiemianEntity> {
	
	List<JingbaojiemianVO> selectListVO(@Param("ew") Wrapper<JingbaojiemianEntity> wrapper);
	
	JingbaojiemianVO selectVO(@Param("ew") Wrapper<JingbaojiemianEntity> wrapper);
	
	List<JingbaojiemianView> selectListView(@Param("ew") Wrapper<JingbaojiemianEntity> wrapper);

	List<JingbaojiemianView> selectListView(Pagination page,@Param("ew") Wrapper<JingbaojiemianEntity> wrapper);
	
	JingbaojiemianView selectView(@Param("ew") Wrapper<JingbaojiemianEntity> wrapper);
	

}
