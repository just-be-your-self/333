package com.dao;

import com.entity.JingbudakaiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.JingbudakaiVO;
import com.entity.view.JingbudakaiView;


/**
 * 警报记录
 * 
 * @author
 * @email
 * @date 2026-03-29
 */
public interface JingbudakaiDao extends BaseMapper<JingbudakaiEntity> {
	
	List<JingbudakaiVO> selectListVO(@Param("ew") Wrapper<JingbudakaiEntity> wrapper);
	
	JingbudakaiVO selectVO(@Param("ew") Wrapper<JingbudakaiEntity> wrapper);
	
	List<JingbudakaiView> selectListView(@Param("ew") Wrapper<JingbudakaiEntity> wrapper);

	List<JingbudakaiView> selectListView(Pagination page,@Param("ew") Wrapper<JingbudakaiEntity> wrapper);
	
	JingbudakaiView selectView(@Param("ew") Wrapper<JingbudakaiEntity> wrapper);
	
}
