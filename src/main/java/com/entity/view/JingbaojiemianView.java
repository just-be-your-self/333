package com.entity.view;

import com.entity.JingbaojiemianEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 警报界面
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2022-11-07 16:13:32
 */
@TableName("jingbaojiemian")
public class JingbaojiemianView  extends JingbaojiemianEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public JingbaojiemianView(){
	}
 
 	public JingbaojiemianView(JingbaojiemianEntity jingbaojiemianEntity){
 	try {
			BeanUtils.copyProperties(this, jingbaojiemianEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
