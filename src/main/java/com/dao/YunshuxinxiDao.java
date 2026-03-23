package com.dao;

import com.entity.YunshuxinxiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.YunshuxinxiVO;
import com.entity.view.YunshuxinxiView;


/**
 * 运输信息
 * 
 * @author 
 * @email 
 * @date 2022-11-07 16:13:32
 */
public interface YunshuxinxiDao extends BaseMapper<YunshuxinxiEntity> {
	
	List<YunshuxinxiVO> selectListVO(@Param("ew") Wrapper<YunshuxinxiEntity> wrapper);
	
	YunshuxinxiVO selectVO(@Param("ew") Wrapper<YunshuxinxiEntity> wrapper);
	
	List<YunshuxinxiView> selectListView(@Param("ew") Wrapper<YunshuxinxiEntity> wrapper);

	List<YunshuxinxiView> selectListView(Pagination page,@Param("ew") Wrapper<YunshuxinxiEntity> wrapper);
	
	YunshuxinxiView selectView(@Param("ew") Wrapper<YunshuxinxiEntity> wrapper);
	

    List<Map<String, Object>> selectValue(@Param("params")Map<String, Object> params,@Param("ew") Wrapper<YunshuxinxiEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(@Param("params") Map<String, Object> params,@Param("ew") Wrapper<YunshuxinxiEntity> wrapper);

    List<Map<String, Object>> selectGroup(@Param("params") Map<String, Object> params,@Param("ew") Wrapper<YunshuxinxiEntity> wrapper);



}
