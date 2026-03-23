package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.JingbaojiemianEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.JingbaojiemianVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.JingbaojiemianView;


/**
 * 警报界面
 *
 * @author 
 * @email 
 * @date 2022-11-07 16:13:32
 */
public interface JingbaojiemianService extends IService<JingbaojiemianEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<JingbaojiemianVO> selectListVO(Wrapper<JingbaojiemianEntity> wrapper);
   	
   	JingbaojiemianVO selectVO(@Param("ew") Wrapper<JingbaojiemianEntity> wrapper);
   	
   	List<JingbaojiemianView> selectListView(Wrapper<JingbaojiemianEntity> wrapper);
   	
   	JingbaojiemianView selectView(@Param("ew") Wrapper<JingbaojiemianEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<JingbaojiemianEntity> wrapper);
   	

}

