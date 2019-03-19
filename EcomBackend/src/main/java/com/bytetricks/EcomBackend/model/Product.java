package com.bytetricks.EcomBackend.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int productid;

	@Column(nullable = true)
	private String productname;

	@Column(nullable = true)
	private String productdec;

	@Column(nullable = true)
	private int productprice;

	public int getProductid() {
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getProductdec() {
		return productdec;
	}

	public void setProductdec(String productdec) {
		this.productdec = productdec;
	}

	public int getProductprice() {
		return productprice;
	}

	public void setProductprice(int productprice) {
		this.productprice = productprice;
	}

	@ManyToOne
	private Category prodcateg;

	public Category getProdcateg() {
		return prodcateg;
	}

	public void setProdcateg(Category prodcateg) {
		this.prodcateg = prodcateg;
	}

}
