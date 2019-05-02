package com.bytetricks.EcomBackend.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class UserCred {
	@Id
	private String UserEmail;
	private String Password;
	private String Role;
	private String Status;

	
	public String getUserEmail() {
		return UserEmail;
	}

	public void setUserEmail(String userEmail) {
		UserEmail = userEmail;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}
	public String getRole() {
		return Role;
	}

	public void setRole(String role) {
		Role = role;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	

}
