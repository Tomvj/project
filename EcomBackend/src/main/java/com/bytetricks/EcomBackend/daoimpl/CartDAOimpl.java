package com.bytetricks.EcomBackend.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bytetricks.EcomBackend.dao.CartDAO;
import com.bytetricks.EcomBackend.model.Cart;
import com.bytetricks.EcomBackend.model.User;

@Transactional
@Repository
public class CartDAOimpl implements CartDAO {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean insertCart(Cart cart) {
		try {
			sessionFactory.getCurrentSession().save(cart);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean updateCart(Cart cart) {
		try {
			sessionFactory.getCurrentSession().update(cart);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean deleteCart(Cart cart) {
		try {
			sessionFactory.getCurrentSession().delete(cart);
			return true;
		} catch (Exception e) {
			return false;

		}
	}

	@Override
	public List<Cart> selectAllCarts(User customer) {
		try {
			return sessionFactory.getCurrentSession().createQuery("from Cart where customer_cusid="+customer.getCusid()).list();
		} catch (Exception e) {
			return new ArrayList<Cart>();
		}
	}

	@Override
	public Cart selectOneCart(int itemid) {
		try {
			return (Cart)sessionFactory.getCurrentSession().createQuery("from Cart where itemid="+itemid).uniqueResult();
		}
		catch (Exception e) 
		{
		return null;
	}}


}
