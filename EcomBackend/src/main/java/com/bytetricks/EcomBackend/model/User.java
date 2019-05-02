package com.bytetricks.EcomBackend.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class User 
{
		@Id
		@GeneratedValue(strategy=GenerationType.AUTO)
		private int cusid;
		
		@Column(nullable=false)
		@NotEmpty(message="Name is mandatory")
	//	@Pattern(regexp="[a-zA-Z ]{3,30}",message="can contan only alphabets manditatory")
		private String cname;
		
		@NotEmpty(message="email is mandatory")
		//@Pattern(regexp="^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$",message="can contan only alphabets manditatory")
		@Column(nullable=false,unique=true)
		private String emailid;
		
		//@Pattern(regexp="^([9]{1})([234789]{1})([0-9]{8})$")
		@NotEmpty(message="Phone number is mandatory")
		@Column(nullable=false,unique=true)
		private String phno;
	   
		@Transient
		private String password;

		public int getCusid() {
			return cusid;
		}

		public void setCusid(int cusid) {
			this.cusid = cusid;
		}

		public String getCname() {
			return cname;
		}

		public void setCname(String cname) {
			this.cname = cname;
		}

		public String getEmailid() {
			return emailid;
		}

		public void setEmailid(String emailid) {
			this.emailid = emailid;
		}

		public String getPhno() {
			return phno;
		}

		public void setPhno(String phno) {
			this.phno = phno;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}
		
		
		
	}



