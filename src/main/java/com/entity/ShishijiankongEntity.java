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

import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * 实时监控配置表
 */
@TableName("shishijiankong")
public class ShishijiankongEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public ShishijiankongEntity() {
	}

	public ShishijiankongEntity(Object t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
	}

	@TableId
	private Long id;

	/**
	 * 车牌号
	 */
	private String chepaihao;

	/**
	 * 电子围栏中心经度
	 */
	private Float fenceLongitude;

	/**
	 * 电子围栏中心纬度
	 */
	private Float fenceLatitude;

	/**
	 * 电子围栏半径（米）
	 */
	private Integer fenceRadius;

	/**
	 * 围栏类型：circle-圆形，rectangle-矩形
	 */
	private String fenceType;

	/**
	 * 是否启用：0-禁用，1-启用
	 */
	private Integer status;

	/**
	 * 创建时间
	 */
	@JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
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

	public String getChepaihao() {
		return chepaihao;
	}

	public void setChepaihao(String chepaihao) {
		this.chepaihao = chepaihao;
	}

	public Float getFenceLongitude() {
		return fenceLongitude;
	}

	public void setFenceLongitude(Float fenceLongitude) {
		this.fenceLongitude = fenceLongitude;
	}

	public Float getFenceLatitude() {
		return fenceLatitude;
	}

	public void setFenceLatitude(Float fenceLatitude) {
		this.fenceLatitude = fenceLatitude;
	}

	public Integer getFenceRadius() {
		return fenceRadius;
	}

	public void setFenceRadius(Integer fenceRadius) {
		this.fenceRadius = fenceRadius;
	}

	public String getFenceType() {
		return fenceType;
	}

	public void setFenceType(String fenceType) {
		this.fenceType = fenceType;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
}
