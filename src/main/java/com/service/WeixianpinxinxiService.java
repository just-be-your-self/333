package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.WeixianpinxinxiEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.WeixianpinxinxiVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.WeixianpinxinxiView;


/**
 * 危险品信息
 *
 * @author 
 * @email 
 * @date 2022-11-07 16:13:31
 */
public interface WeixianpinxinxiService extends IService<WeixianpinxinxiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<WeixianpinxinxiVO> selectListVO(Wrapper<WeixianpinxinxiEntity> wrapper);
   	
   	WeixianpinxinxiVO selectVO(@Param("ew") Wrapper<WeixianpinxinxiEntity> wrapper);
   	
   	List<WeixianpinxinxiView> selectListView(Wrapper<WeixianpinxinxiEntity> wrapper);
   	
   	WeixianpinxinxiView selectView(@Param("ew") Wrapper<WeixianpinxinxiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<WeixianpinxinxiEntity> wrapper);
   	

}

