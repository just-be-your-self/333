package com.entity.view;

import com.entity.JingbudakaiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;


/**
 * 警报记录
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author
 * @date 2026-03-29
 */
@TableName("jingbudakai")
public class JingbudakaiView extends JingbudakaiEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public JingbudakaiView(){
	}
	
 	public JingbudakaiView(JingbudakaiEntity jingbudakaiEntity){
 	try {
			BeanUtils.copyProperties(this, jingbudakaiEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
 	}
}
