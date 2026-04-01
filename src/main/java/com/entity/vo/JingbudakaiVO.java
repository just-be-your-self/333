package com.entity.vo;

import com.entity.JingbudakaiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;


/**
 * 警报记录
 * 手机端接口返回实体辅助类 
 * （主要作用去除一些不必要的字段）
 * @author
 * @date 2026-03-29
 */
public class JingbudakaiVO implements Serializable {
	private static final long serialVersionUID = 1L;

	
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

	public void setJingwubianhao(String jingwubianhao) {
		this.jingwubianhao = jingwubianhao;
	}
	public String getJingwubianhao() {
		return jingwubianhao;
	}
	public void setJingleixing(String jingleixing) {
		this.jingleixing = jingleixing;
	}
	public String getJingleixing() {
		return jingleixing;
	}
	public void setChepaihao(String chepaihao) {
		this.chepaihao = chepaihao;
	}
	public String getChepaihao() {
		return chepaihao;
	}
	public void setWeixianpinmingcheng(String weixianpinmingcheng) {
		this.weixianpinmingcheng = weixianpinmingcheng;
	}
	public String getWeixianpinmingcheng() {
		return weixianpinmingcheng;
	}
	public void setChulizhuangtai(String chulizhuangtai) {
		this.chulizhuangtai = chulizhuangtai;
	}
	public String getChulizhuangtai() {
		return chulizhuangtai;
	}
	public void setBaojingshijian(Date baojingshijian) {
		this.baojingshijian = baojingshijian;
	}
	public Date getBaojingshijian() {
		return baojingshijian;
	}
	public void setBaojingyuanyin(String baojingyuanyin) {
		this.baojingyuanyin = baojingyuanyin;
	}
	public String getBaojingyuanyin() {
		return baojingyuanyin;
	}
	public void setWeizhi(String weizhi) {
		this.weizhi = weizhi;
	}
	public String getWeizhi() {
		return weizhi;
	}
	public void setSudu(String sudu) {
		this.sudu = sudu;
	}
	public String getSudu() {
		return sudu;
	}
	public void setXingming(String xingming) {
		this.xingming = xingming;
	}
	public String getXingming() {
		return xingming;
	}
	public void setChuliren(String chuliren) {
		this.chuliren = chuliren;
	}
	public String getChuliren() {
		return chuliren;
	}
	public void setChulishijian(Date chulishijian) {
		this.chulishijian = chulishijian;
	}
	public Date getChulishijian() {
		return chulishijian;
	}
	public void setChulibeizhu(String chulibeizhu) {
		this.chulibeizhu = chulibeizhu;
	}
	public String getChulibeizhu() {
		return chulibeizhu;
	}

}
