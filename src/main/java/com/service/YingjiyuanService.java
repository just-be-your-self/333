package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.YingjiyuanEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.YingjiyuanVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.YingjiyuanView;


/**
 * 应急预案
 *
 * @author 
 * @email 
 * @date 2022-11-07 16:13:32
 */
public interface YingjiyuanService extends IService<YingjiyuanEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<YingjiyuanVO> selectListVO(Wrapper<YingjiyuanEntity> wrapper);
   	
   	YingjiyuanVO selectVO(@Param("ew") Wrapper<YingjiyuanEntity> wrapper);
   	
   	List<YingjiyuanView> selectListView(Wrapper<YingjiyuanEntity> wrapper);
   	
   	YingjiyuanView selectView(@Param("ew") Wrapper<YingjiyuanEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<YingjiyuanEntity> wrapper);
   	

}

