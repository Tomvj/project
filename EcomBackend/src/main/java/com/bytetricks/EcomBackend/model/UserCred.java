package com.bytetricks.EcomBackend.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class UserCred {
	@Id
	private String Username;
	private String Password;
	private String Role;
	private String Status;

	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
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
