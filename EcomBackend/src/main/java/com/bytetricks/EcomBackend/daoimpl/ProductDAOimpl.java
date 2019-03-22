package com.bytetricks.EcomBackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bytetricks.EcomBackend.dao.ProductDAO;
import com.bytetricks.EcomBackend.model.Product;

@Repository
@Transactional
public class ProductDAOimpl implements ProductDAO
 {
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public boolean insertProduct(Product products) {
		try {
			sessionFactory.getCurrentSession().save(products);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean updateProduct(Product products) {
		try {
			sessionFactory.getCurrentSession().update(products);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean deleteProduct(int productid) {
		try {
			sessionFactory.getCurrentSession().delete(productid);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public List<Product> selectAllProducts() {
		try {
			return sessionFactory.getCurrentSession().createQuery("from Product").list();
		} catch (Exception e) {
			return null;
		}
	}

	
	@Override
	public Product selectOneProducts(int productid) {
		try {
			return (Product) sessionFactory.getCurrentSession().createQuery("from User where productid='" + productid + "'").uniqueResult();
		} catch (Exception e) {
			return null;
		}	
	}

}
