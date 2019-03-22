package com.bytetricks.EcomBackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bytetricks.EcomBackend.dao.UserDAO;
import com.bytetricks.EcomBackend.model.User;
import com.bytetricks.EcomBackend.model.UserCred;

@Transactional
@Repository
public class UserDAOimpl implements UserDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean insertUser(User user) {
		try {
			UserCred uc = new UserCred();
			uc.setUsername(user.getEmailid());
			uc.setPassword(user.getPassword());
			uc.setRole("ROLE_USER");
			uc.setStatus("false");
			sessionFactory.getCurrentSession().save(user);
			return true;
		} catch (Exception e) {
			return false;
		}

	}

	@Override
	public boolean updateUser(User user) {
		try {
			sessionFactory.getCurrentSession().update(user);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public List<User> selectAllUser() {
		try {
			  return sessionFactory.getCurrentSession().createQuery("from User").list();
		    }
		catch(Exception e)
		{
			return null;
		}
		
	}

	@Override
	public User selectOneUser(String emailid) {
		try 
		{
		    return(User)sessionFactory.getCurrentSession().createQuery("from User where emailid='"+emailid+"'").uniqueResult();	
		}
		catch(Exception e)
		{
			return null;
		}
	}

	@Override
	public boolean deleteUser(String emailid) 
	{
		try {
			sessionFactory.getCurrentSession().delete(emailid,User.class);
			return true;
		} catch (Exception e) {
			return false;
		}
	}


}
