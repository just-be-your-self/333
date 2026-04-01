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
 * 警报记录
 * 数据库通用操作实体类（普通增删改查）
 * @author
 * @email
 * @date 2026-03-29
 */
@TableName("jingbudakai")
public class JingbudakaiEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public JingbudakaiEntity() {
		
	}
	
	public JingbudakaiEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 主键id
	 */
	@TableId
	private Long id;
	/**
	 * 警报编号
	 */
	private String jingwubianhao;
	/**
	 * 警报类型
	 */
	private String jingleixing;
	/**
	 * 车牌号
	 */
	private String chepaihao;
	/**
	 * 危险品名称
	 */
	private String weixianpinmingcheng;
	/**
	 * 处理状态
	 */
	private String chulizhuangtai;
	/**
	 * 警报时间
	 */
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date baojingshijian;
	/**
	 * 警报原因
	 */
	private String baojingyuanyin;
	/**
	 * 位置
	 */
	private String weizhi;
	/**
	 * 速度
	 */
	private String sudu;
	/**
	 * 姓名
	 */
	private String xingming;
	/**
	 * 处理人
	 */
	private String chuliren;
	/**
	 * 处理时间
	 */
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date chulishijian;
	/**
	 * 处理备注
	 */
	private String chulibeizhu;

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
	 * 设置：警报编号
	 */
	public void setJingwubianhao(String jingwubianhao) {
		this.jingwubianhao = jingwubianhao;
	}
	/**
	 * 获取：警报编号
	 */
	public String getJingwubianhao() {
		return jingwubianhao;
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
	 * 设置：危险品名称
	 */
	public void setWeixianpinmingcheng(String weixianpinmingcheng) {
		this.weixianpinmingcheng = weixianpinmingcheng;
	}
	/**
	 * 获取：危险品名称
	 */
	public String getWeixianpinmingcheng() {
		return weixianpinmingcheng;
	}
	/**
	 * 设置：处理状态
	 */
	public void setChulizhuangtai(String chulizhuangtai) {
		this.chulizhuangtai = chulizhuangtai;
	}
	/**
	 * 获取：处理状态
	 */
	public String getChulizhuangtai() {
		return chulizhuangtai;
	}
	/**
	 * 设置：警报时间
	 */
	public void setBaojingshijian(Date baojingshijian) {
		this.baojingshijian = baojingshijian;
	}
	/**
	 * 获取：警报时间
	 */
	public Date getBaojingshijian() {
		return baojingshijian;
	}
	/**
	 * 设置：警报原因
	 */
	public void setBaojingyuanyin(String baojingyuanyin) {
		this.baojingyuanyin = baojingyuanyin;
	}
	/**
	 * 获取：警报原因
	 */
	public String getBaojingyuanyin() {
		return baojingyuanyin;
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
	 * 设置：处理人
	 */
	public void setChuliren(String chuliren) {
		this.chuliren = chuliren;
	}
	/**
	 * 获取：处理人
	 */
	public String getChuliren() {
		return chuliren;
	}
	/**
	 * 设置：处理时间
	 */
	public void setChulishijian(Date chulishijian) {
		this.chulishijian = chulishijian;
	}
	/**
	 * 获取：处理时间
	 */
	public Date getChulishijian() {
		return chulishijian;
	}
	/**
	 * 设置：处理备注
	 */
	public void setChulibeizhu(String chulibeizhu) {
		this.chulibeizhu = chulibeizhu;
	}
	/**
	 * 获取：处理备注
	 */
	public String getChulibeizhu() {
		return chulibeizhu;
	}

}
