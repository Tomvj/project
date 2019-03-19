package com.bytetricks.EcomBackend.dao;

import java.util.List;

import com.bytetricks.EcomBackend.model.User;



public interface UserDAO
{
	boolean insertUser(User user);
	boolean updateUser(User user);
	boolean deleteUser(String emailid);
	List<User> selectAllUser();
	User selectOneUser(String emailid);
}
