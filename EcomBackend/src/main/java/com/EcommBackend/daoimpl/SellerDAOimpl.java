package com.EcommBackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.bytetricks.EcomBackend.dao.SellerDAO;
import com.bytetricks.EcomBackend.model.Seller;
import com.bytetricks.EcomBackend.model.UserCred;

public class SellerDAOimpl implements SellerDAO {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean insertSeller(Seller seller) {
		try {
			UserCred uc = new UserCred();
			uc.setUsername(seller.getSname());
			uc.setPassword(seller.getPassword());
			uc.setRole("ROLE_SELLER");
			uc.setStatus("false");
			sessionFactory.getCurrentSession().save(seller);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean updateSeller(Seller seller) {
		try {
			sessionFactory.getCurrentSession().update(seller);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public List<Seller> selectAllSellers() {
		try {
			return sessionFactory.getCurrentSession().createQuery("from Seller").list();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Seller selectOneSellers(String sname) {
		try {
			return (Seller) sessionFactory.getCurrentSession().createQuery("from Seller where Sname='" + sname + "'").uniqueResult();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public boolean deleteSeller(String sname) {
		try {
			sessionFactory.getCurrentSession().delete(sname,Seller.class);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

}
