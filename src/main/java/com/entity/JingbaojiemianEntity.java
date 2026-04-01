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
 * 警报界面
 * 数据库通用操作实体类（普通增删改查）
 * @author 
 * @email 
 * @date 2022-11-07 16:13:32
 */
@TableName("jingbaojiemian")
public class JingbaojiemianEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public JingbaojiemianEntity() {
		
	}
	
	public JingbaojiemianEntity(T t) {
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
	 * 标题
	 */
	private String biaoti;

	/**
	 * 警报类型
	 */
	private String jingleixing;

	/**
	 * 车牌号
	 */
	private String chepaihao;

	/**
	 * 电话
	 */
	private String dianhua;

	/**
	 * 警报原因
	 */
	private String jingbaoyuanyin;

	/**
	 * 警报时间
	 */
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date jingbaoshijian;

	/**
	 * 位置
	 */
	private String weizhi;

	/**
	 * 速度
	 */
	private String sudu;

	/**
	 * 账号
	 */
	private String zhanghao;

	/**
	 * 姓名
	 */
	private String xingming;
	
	/**
	 * 是否审核
	 */
					
	private String sfsh;
	
	/**
	 * 审核回复
	 */
					
	private String shhf;
	
	
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
	 * 设置：标题
	 */
	public void setBiaoti(String biaoti) {
		this.biaoti = biaoti;
	}
	/**
	 * 获取：标题
	 */
	public String getBiaoti() {
		return biaoti;
	}
	/**
	 * 设置：警报类型
	 */
	public void setJingleixing(String jingleixing) {
		this.jingleixing = jingleixing;
	}
	/**
	 * 获取：警报类型
	 */
	public String getJingleixing() {
		return jingleixing;
	}
	/**
	 * 设置：车牌号
	 */
	public void setChepaihao(String chepaihao) {
		this.chepaihao = chepaihao;
	}
	/**
	 * 获取：车牌号
	 */
	public String getChepaihao() {
		return chepaihao;
	}
	/**
	 * 设置：电话
	 */
	public void setDianhua(String dianhua) {
		this.dianhua = dianhua;
	}
	/**
	 * 获取：电话
	 */
	public String getDianhua() {
		return dianhua;
	}
	/**
	 * 设置：警报原因
	 */
	public void setJingbaoyuanyin(String jingbaoyuanyin) {
		this.jingbaoyuanyin = jingbaoyuanyin;
	}
	/**
	 * 获取：警报原因
	 */
	public String getJingbaoyuanyin() {
		return jingbaoyuanyin;
	}
	/**
	 * 设置：警报时间
	 */
	public void setJingbaoshijian(Date jingbaoshijian) {
		this.jingbaoshijian = jingbaoshijian;
	}
	/**
	 * 获取：警报时间
	 */
	public Date getJingbaoshijian() {
		return jingbaoshijian;
	}
	/**
	 * 设置：位置
	 */
	public void setWeizhi(String weizhi) {
		this.weizhi = weizhi;
	}
	/**
	 * 获取：位置
	 */
	public String getWeizhi() {
		return weizhi;
	}
	/**
	 * 设置：速度
	 */
	public void setSudu(String sudu) {
		this.sudu = sudu;
	}
	/**
	 * 获取：速度
	 */
	public String getSudu() {
		return sudu;
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
	/**
	 * 设置：是否审核
	 */
	public void setSfsh(String sfsh) {
		this.sfsh = sfsh;
	}
	/**
	 * 获取：是否审核
	 */
	public String getSfsh() {
		return sfsh;
	}
	/**
	 * 设置：审核回复
	 */
	public void setShhf(String shhf) {
		this.shhf = shhf;
	}
	/**
	 * 获取：审核回复
	 */
	public String getShhf() {
		return shhf;
	}

}
