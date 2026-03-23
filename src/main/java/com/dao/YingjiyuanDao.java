package com.dao;

import com.entity.YingjiyuanEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.YingjiyuanVO;
import com.entity.view.YingjiyuanView;


/**
 * 应急预案
 * 
 * @author 
 * @email 
 * @date 2022-11-07 16:13:32
 */
public interface YingjiyuanDao extends BaseMapper<YingjiyuanEntity> {
	
	List<YingjiyuanVO> selectListVO(@Param("ew") Wrapper<YingjiyuanEntity> wrapper);
	
	YingjiyuanVO selectVO(@Param("ew") Wrapper<YingjiyuanEntity> wrapper);
	
	List<YingjiyuanView> selectListView(@Param("ew") Wrapper<YingjiyuanEntity> wrapper);

	List<YingjiyuanView> selectListView(Pagination page,@Param("ew") Wrapper<YingjiyuanEntity> wrapper);
	
	YingjiyuanView selectView(@Param("ew") Wrapper<YingjiyuanEntity> wrapper);
	

}
