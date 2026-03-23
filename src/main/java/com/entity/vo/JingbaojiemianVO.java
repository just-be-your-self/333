package com.entity.vo;

import com.entity.JingbaojiemianEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
 

/**
 * 警报界面
 * 手机端接口返回实体辅助类 
 * （主要作用去除一些不必要的字段）
 * @author 
 * @email 
 * @date 2022-11-07 16:13:32
 */
public class JingbaojiemianVO  implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
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
