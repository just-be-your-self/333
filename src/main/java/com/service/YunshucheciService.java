package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.YunshucheciEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.YunshucheciVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.YunshucheciView;


/**
 * 运输车次
 *
 * @author 
 * @email 
 * @date 2022-11-07 16:13:32
 */
public interface YunshucheciService extends IService<YunshucheciEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<YunshucheciVO> selectListVO(Wrapper<YunshucheciEntity> wrapper);
   	
   	YunshucheciVO selectVO(@Param("ew") Wrapper<YunshucheciEntity> wrapper);
   	
   	List<YunshucheciView> selectListView(Wrapper<YunshucheciEntity> wrapper);
   	
   	YunshucheciView selectView(@Param("ew") Wrapper<YunshucheciEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<YunshucheciEntity> wrapper);
   	

}

