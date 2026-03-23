package com.entity.view;

import com.entity.YingjiyuanEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 应急预案
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2022-11-07 16:13:32
 */
@TableName("yingjiyuan")
public class YingjiyuanView  extends YingjiyuanEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public YingjiyuanView(){
	}
 
 	public YingjiyuanView(YingjiyuanEntity yingjiyuanEntity){
 	try {
			BeanUtils.copyProperties(this, yingjiyuanEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
