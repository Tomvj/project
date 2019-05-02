package com.bytetricks.EcomBackend.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
	public class Address {

		@ManyToOne
		User user;
		@Id
		@GeneratedValue(strategy = GenerationType.AUTO)
		private int address_Id;

		@Column(nullable = false)
		@NotEmpty(message="username is mandatory")
		private String username;

		@Column(nullable = false)
		@NotEmpty(message = "Address Line1 is mandatory")
		private String line1;

		@Column(nullable = false, columnDefinition = "text")
		@NotEmpty(message = "Address Line2 is mandatory")
		private String line2;

		@Column(nullable = false, columnDefinition = "text")
		@NotEmpty(message = "User city is mandatory")
		private String city;

		@Column(nullable = false, columnDefinition = "text")
		@NotEmpty(message = "User state is mandatory")
		private String state;
		
		private String status;

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		@Column(nullable = false)
		private int pincode;

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}

		public int getAddress_Id() {
			return address_Id;
		}

		public void setAddress_Id(int address_Id) {
			this.address_Id = address_Id;
		}

		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public String getLine1() {
			return line1;
		}

		public void setLine1(String line1) {
			this.line1 = line1;
		}

		public String getLine2() {
			return line2;
		}

		public void setLine2(String line2) {
			this.line2 = line2;
		}

		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

		public String getState() {
			return state;
		}

		public void setState(String state) {
			this.state = state;
		}

		public int getPincode() {
			return pincode;
		}

		public void setPincode(int pincode) {
			this.pincode = pincode;
		}

		

}
