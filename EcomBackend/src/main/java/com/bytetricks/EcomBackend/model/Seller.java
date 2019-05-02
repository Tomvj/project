package com.bytetricks.EcomBackend.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Seller {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sid;

	@Column(nullable=false)
	@NotEmpty(message="seller name is mandatory")
	private String sname;

	@Column(nullable=false,unique=true)
	@NotEmpty(message="seller emailid is mandatory")
	private String s_emailid;
	
	@Column(nullable=false,unique=true)
	@NotEmpty(message="seller phone number is mandatory")
	private String s_phonenumber;
	
	@Column(nullable=false)
	@NotEmpty(message="location is mandatory")
	private String s_location;
	
	@Transient
	@NotEmpty(message="password is mandatory")
	private String password;

	public int getSid() {
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

	public String getS_emailid() {
		return s_emailid;
	}

	public void setS_emailid(String s_emailid) {
		this.s_emailid = s_emailid;
	}

	public String getS_phonenumber() {
		return s_phonenumber;
	}

	public void setS_phonenumber(String s_phonenumber) {
		this.s_phonenumber = s_phonenumber;
	}

	public String getS_location() {
		return s_location;
	}

	public void setS_location(String s_location) {
		this.s_location = s_location;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


}
