package com.bytetricks.EcomBackend.daoimpl;

import java.util.List;


import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bytetricks.EcomBackend.dao.CategoryDAO;
import com.bytetricks.EcomBackend.model.Category;

@Repository
@Transactional
public class CategoryDAOimpl implements CategoryDAO {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean insertCategory(Category category) {
		try {
			sessionFactory.getCurrentSession().save(category);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean updateCategory(Category category) {
		try {
			sessionFactory.getCurrentSession().update(category);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public List<Category> selectAllCategories() {
		try {
			return sessionFactory.getCurrentSession().createQuery("from Category").list();
		} catch (Exception e) {
			return null;
		}

	}

	@Override
	public Category selectOneCategory(String categname) {
		try {
			return (Category) sessionFactory.getCurrentSession()
					.createQuery("from Category where categname='" + categname + "'").uniqueResult();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public boolean deleteCategory(String categname) {
		try {
			sessionFactory.getCurrentSession().delete(selectOneCategory(categname));
			return true;
		} catch (Exception e) {
			return false;
		}
	}

}
