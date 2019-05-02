package com.bytetricks.EcomBackend.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int productid;

	@Column(nullable = false)
	@NotEmpty
	private String productname;

	@Column(nullable = false,columnDefinition="text")
	private String productdec;

	@Column(nullable = false)
	private int productprice;

	@Column(nullable = false)
	private int productstock;

	@ManyToOne
	@OnDelete(action=OnDeleteAction.CASCADE)
	private Seller productseller;
	@ManyToOne
	@OnDelete(action=OnDeleteAction.CASCADE)
	private Category productcategory;
	 
	@Transient
	MultipartFile pimage;

	public MultipartFile getPimage() {
		return pimage;
	}

	public void setPimage(MultipartFile pimage) {
		this.pimage = pimage;
	}

	public Category getProductcategory() {
		return productcategory;
	}

	public void setProductcategory(Category productcategory) {
		this.productcategory = productcategory;
	}

	public Seller getProductseller() {
		return productseller;
	}

	public void setProductseller(Seller productseller) {
		this.productseller = productseller;
	}

	public int getProductstock() {
		return productstock;
	}

	public void setProductstock(int productstock) {
		this.productstock = productstock;
	}

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
