package com.montnets.pc_service.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the amz_products database table.
 * 
 */
@Entity
@Table(name="amz_products")
@NamedQuery(name="AmzProduct.findAll", query="SELECT a FROM AmzProduct a")
public class AmzProduct implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private Long id;

	private Integer bsr;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="CREATE_TIME")
	private Date createTime;

	@Column(name="DEP_ID")
	private String depId;

	@Column(name="PROD_ASIN")
	private String prodAsin;

	@Column(name="PROD_BRAND")
	private String prodBrand;

	@Column(name="PROD_BRAND_URL")
	private String prodBrandUrl;

	@Column(name="PROD_IMG_URL")
	private String prodImgUrl;

	@Column(name="PROD_NAME")
	private String prodName;

	@Column(name="PROD_PRICE")
	private BigDecimal prodPrice;

	@Column(name="PROD_UPC")
	private String prodUpc;

	@Column(name="QANDA_NUM")
	private Integer qandaNum;

	@Column(name="REVIEW_AVG")
	private Double reviewAvg;

	@Column(name="REVIEWS_NUM")
	private Integer reviewsNum;

	@Column(name="SELLER_NAME")
	private String sellerName;

	@Column(name="SELLER_TYPE")
	private Integer sellerType;

	@Column(name="SELLER_URL")
	private String sellerUrl;

	@Column(name="SELLERS_NUM")
	private Integer sellersNum;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="UPDATE_TIME")
	private Date updateTime;
	
	private List<AmzProductBsr> productBsrList;

	public AmzProduct() {
	}

	public List<AmzProductBsr> getProductBsrList() {
		return productBsrList;
	}

	public void setProductBsrList(List<AmzProductBsr> productBsrList) {
		this.productBsrList = productBsrList;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getBsr() {
		return bsr;
	}

	public void setBsr(Integer bsr) {
		this.bsr = bsr;
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

	public String getProdAsin() {
		return prodAsin;
	}

	public void setProdAsin(String prodAsin) {
		this.prodAsin = prodAsin;
	}

	public String getProdBrand() {
		return prodBrand;
	}

	public void setProdBrand(String prodBrand) {
		this.prodBrand = prodBrand;
	}

	public String getProdBrandUrl() {
		return prodBrandUrl;
	}

	public void setProdBrandUrl(String prodBrandUrl) {
		this.prodBrandUrl = prodBrandUrl;
	}

	public String getProdImgUrl() {
		return prodImgUrl;
	}

	public void setProdImgUrl(String prodImgUrl) {
		this.prodImgUrl = prodImgUrl;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public BigDecimal getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(BigDecimal prodPrice) {
		this.prodPrice = prodPrice;
	}

	public String getProdUpc() {
		return prodUpc;
	}

	public void setProdUpc(String prodUpc) {
		this.prodUpc = prodUpc;
	}

	public Integer getQandaNum() {
		return qandaNum;
	}

	public void setQandaNum(Integer qandaNum) {
		this.qandaNum = qandaNum;
	}

	public Double getReviewAvg() {
		return reviewAvg;
	}

	public void setReviewAvg(Double reviewAvg) {
		this.reviewAvg = reviewAvg;
	}

	public Integer getReviewsNum() {
		return reviewsNum;
	}

	public void setReviewsNum(Integer reviewsNum) {
		this.reviewsNum = reviewsNum;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public Integer getSellerType() {
		return sellerType;
	}

	public void setSellerType(Integer sellerType) {
		this.sellerType = sellerType;
	}

	public String getSellerUrl() {
		return sellerUrl;
	}

	public void setSellerUrl(String sellerUrl) {
		this.sellerUrl = sellerUrl;
	}

	public Integer getSellersNum() {
		return sellersNum;
	}

	public void setSellersNum(Integer sellersNum) {
		this.sellersNum = sellersNum;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

}