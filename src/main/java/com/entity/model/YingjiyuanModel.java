package com.entity.model;

import com.entity.YingjiyuanEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;
 

/**
 * 应急预案
 * 接收传参的实体类  
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了） 
 * 取自ModelAndView 的model名称
 * @author 
 * @email 
 * @date 2022-11-07 16:13:32
 */
public class YingjiyuanModel  implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
	/**
	 * 方案标题
	 */
	
	private String fanganbiaoti;
		
	/**
	 * 方案简介
	 */
	
	private String fanganjianjie;
		
	/**
	 * 方案内容
	 */
	
	private String fanganneirong;
		
	/**
	 * 登记时间
	 */
		
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat 
	private Date dengjishijian;
		
	/**
	 * 账号
	 */
	
	private String zhanghao;
		
	/**
	 * 姓名
	 */
	
	private String xingming;
				
	
	/**
	 * 设置：方案标题
	 */
	 
	public void setFanganbiaoti(String fanganbiaoti) {
		this.fanganbiaoti = fanganbiaoti;
	}
	
	/**
	 * 获取：方案标题
	 */
	public String getFanganbiaoti() {
		return fanganbiaoti;
	}
				
	
	/**
	 * 设置：方案简介
	 */
	 
	public void setFanganjianjie(String fanganjianjie) {
		this.fanganjianjie = fanganjianjie;
	}
	
	/**
	 * 获取：方案简介
	 */
	public String getFanganjianjie() {
		return fanganjianjie;
	}
				
	
	/**
	 * 设置：方案内容
	 */
	 
	public void setFanganneirong(String fanganneirong) {
		this.fanganneirong = fanganneirong;
	}
	
	/**
	 * 获取：方案内容
	 */
	public String getFanganneirong() {
		return fanganneirong;
	}
				
	
	/**
	 * 设置：登记时间
	 */
	 
	public void setDengjishijian(Date dengjishijian) {
		this.dengjishijian = dengjishijian;
	}
	
	/**
	 * 获取：登记时间
	 */
	public Date getDengjishijian() {
		return dengjishijian;
	}
				
	
	/**
	 * 设置：账号
	 */
	 
	public void setZhanghao(String zhanghao) {
		this.zhanghao = zhanghao;
	}
	
	/**
	 * 获取：账号
	 */
	public String getZhanghao() {
		return zhanghao;
	}
				
	
	/**
	 * 设置：姓名
	 */
	 
	public void setXingming(String xingming) {
		this.xingming = xingming;
	}
	
	/**
	 * 获取：姓名
	 */
	public String getXingming() {
		return xingming;
	}
			
}
