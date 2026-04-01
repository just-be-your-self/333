package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.JingbudakaiEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.JingbudakaiVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.JingbudakaiView;


/**
 * 警报记录
 *
 * @author
 * @email
 * @date 2026-03-29
 */
public interface JingbudakaiService extends IService<JingbudakaiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<JingbudakaiVO> selectListVO(Wrapper<JingbudakaiEntity> wrapper);
   	
   	JingbudakaiVO selectVO(@Param("ew") Wrapper<JingbudakaiEntity> wrapper);
   	
   	List<JingbudakaiView> selectListView(Wrapper<JingbudakaiEntity> wrapper);
   	
   	JingbudakaiView selectView(@Param("ew") Wrapper<JingbudakaiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<JingbudakaiEntity> wrapper);
   	

}
