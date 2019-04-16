package com.montnets.pc_service.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the amz_product_bsr database table.
 * 
 */
@Entity
@Table(name="amz_product_bsr")
@NamedQuery(name="AmzProductBsr.findAll", query="SELECT a FROM AmzProductBsr a")
public class AmzProductBsr implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private Long id;

	private int bsr;

	@Column(name="BSR_URL")
	private String bsrUrl;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="CREATE_TIME")
	private Date createTime;

	@Column(name="DEP_ID")
	private String depId;

	@Column(name="DEP_NAME_EN")
	private String depNameEn;

	@Column(name="PROD_ASIN")
	private String prodAsin;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="UPDATE_TIME")
	private Date updateTime;

	public AmzProductBsr() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getBsr() {
		return bsr;
	}

	public void setBsr(int bsr) {
		this.bsr = bsr;
	}

	public String getBsrUrl() {
		return bsrUrl;
	}

	public void setBsrUrl(String bsrUrl) {
		this.bsrUrl = bsrUrl;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getDepId() {
		return depId;
	}

	public void setDepId(String depId) {
		this.depId = depId;
	}

	public String getDepNameEn() {
		return depNameEn;
	}

	public void setDepNameEn(String depNameEn) {
		this.depNameEn = depNameEn;
	}

	public String getProdAsin() {
		return prodAsin;
	}

	public void setProdAsin(String prodAsin) {
		this.prodAsin = prodAsin;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

}