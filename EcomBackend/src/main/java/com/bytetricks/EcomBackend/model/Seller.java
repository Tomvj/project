package com.bytetricks.EcomBackend.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity
public class Seller {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sid;

	@Column(nullable = false,unique=true)
	private String sname;

	@Column(nullable = false)
	private String sdesc;
	
	@Transient
	private String password;

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password) 
	
	{
		this.password = password;
	}

	public int getSid() 
	{
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSdesc() {
		return sdesc;
	}

	public void setSdesc(String sdesc) {
		this.sdesc = sdesc;
	}

}
