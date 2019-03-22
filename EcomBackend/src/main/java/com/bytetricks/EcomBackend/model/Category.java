package com.bytetricks.EcomBackend.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Category 
{
	    @Id
		@GeneratedValue(strategy=GenerationType.AUTO)
		private int categid;
		
		@Column(nullable=false,unique=true)
		private String categname;
		
		@Column(nullable=false)
		private String categdesc;

		public int getCategid() {
			return categid;
		}

		public void setCategid(int categid) {
			this.categid = categid;
		}

		public String getCategname() {
			return categname;
		}

		public void setCategname(String categname) {
			this.categname = categname;
		}

		public String getCategdesc() {
			return categdesc;
		}

		public void setCategdesc(String categdesc) {
			this.categdesc = categdesc;
		}

	}


