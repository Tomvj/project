package com.bytetricks.EcomBackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bytetricks.EcomBackend.dao.MyorderDAO;
import com.bytetricks.EcomBackend.model.Myorder;
import com.bytetricks.EcomBackend.model.User;

@Repository
@Transactional
public class MyorderDAOimpl implements MyorderDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean insertMyOrder(Myorder myorder) {
		try {
			sessionFactory.getCurrentSession().save(myorder);
			return true;
		} catch (Exception e) {
			return false;
		}

	}

	@Override
	public boolean updateMyOrder(Myorder myorder) {
		try {
			sessionFactory.getCurrentSession().update(myorder);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean deleteMyOrder(String orderid) {
		try {
			sessionFactory.getCurrentSession().delete(selectOneMyOrder("orderid"));
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public List<Myorder> selectAllMyOrders(User customer) {
		try {
			return sessionFactory.getCurrentSession().createQuery("from Myorder where customer_cusid=" + customer.getCusid())
					.list();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Myorder selectOneMyOrder(String orderid) {
		try {
			return (Myorder) sessionFactory.getCurrentSession()
					.createQuery("from Myorder where orderid='" + orderid + "'").uniqueResult();
		} catch (Exception e) {
			return null;
		}
	}

}
