package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;


/**
 * 应急预案
 * 数据库通用操作实体类（普通增删改查）
 * @author 
 * @email 
 * @date 2022-11-07 16:13:32
 */
@TableName("yingjiyuan")
public class YingjiyuanEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public YingjiyuanEntity() {
		
	}
	
	public YingjiyuanEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 主键id
	 */
	@TableId
	private Long id;
	/**
	 * 方案编号
	 */
					
	private String fanganbianhao;
	
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
	
	
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date addtime;

	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 设置：方案编号
	 */
	public void setFanganbianhao(String fanganbianhao) {
		this.fanganbianhao = fanganbianhao;
	}
	/**
	 * 获取：方案编号
	 */
	public String getFanganbianhao() {
		return fanganbianhao;
	}
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
