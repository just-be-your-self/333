package com.dao;

import com.entity.YunshucheciEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.YunshucheciVO;
import com.entity.view.YunshucheciView;


/**
 * 运输车次
 * 
 * @author 
 * @email 
 * @date 2022-11-07 16:13:32
 */
public interface YunshucheciDao extends BaseMapper<YunshucheciEntity> {
	
	List<YunshucheciVO> selectListVO(@Param("ew") Wrapper<YunshucheciEntity> wrapper);
	
	YunshucheciVO selectVO(@Param("ew") Wrapper<YunshucheciEntity> wrapper);
	
	List<YunshucheciView> selectListView(@Param("ew") Wrapper<YunshucheciEntity> wrapper);

	List<YunshucheciView> selectListView(Pagination page,@Param("ew") Wrapper<YunshucheciEntity> wrapper);
	
	YunshucheciView selectView(@Param("ew") Wrapper<YunshucheciEntity> wrapper);
	

}
