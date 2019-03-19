package com.bytetricks.EcomBackend.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity
public class User 
{
		@Id
		@GeneratedValue(strategy=GenerationType.AUTO)
		private int cusid;
		
		@Column(nullable=false)
		private String cname;
		
		@Column(nullable=false,unique=true)
		private String emailid;
		
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



