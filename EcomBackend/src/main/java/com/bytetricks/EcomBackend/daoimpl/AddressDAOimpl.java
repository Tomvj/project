package com.bytetricks.EcomBackend.daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bytetricks.EcomBackend.dao.AddressDAO;
import com.bytetricks.EcomBackend.model.Address;

	@Repository("addressDAO")
	@Transactional
	public class AddressDAOimpl implements AddressDAO {
		@Autowired
		SessionFactory sessionFactory;

		public boolean createAddress(Address address) {
			try {
				address.setStatus("active");
				sessionFactory.getCurrentSession().save(address);
				return true;

			} catch (Exception e) {
				System.out.println(e.getMessage());
				return false;
			}
		}

		public boolean updateAddress(Address address) {
			// TODO Auto-generated method stub
			try {
				sessionFactory.getCurrentSession().update(address);
				return true;
			} catch (Exception e) {
				System.out.println(e.getMessage());
				return false;
			}
		}

		public boolean deleteAddress(Address address) {
			// TODO Auto-generated method stub
			try {
				address.setStatus("inactive");
				sessionFactory.getCurrentSession().update(address);
				return true;

			} catch (Exception e) {
				System.out.println(e.getMessage());
				return false;
			}
		}

		public List<Address> selectAllAddress(int user_Id) {
			// TODO Auto-generated method stub
			try {
				return sessionFactory.getCurrentSession().createQuery("from Address where user_cusid="+user_Id+"and status='active'").list();
			} catch (Exception e) {
				System.out.println(e.getMessage());
				return null;
			}
		}

		public Address selectOneAddress(int address_Id) {
			// TODO Auto-generated method stub
			try {
				return (Address) sessionFactory.getCurrentSession().createQuery("from Address where address_Id=" + address_Id).uniqueResult();

			} catch (Exception e) {
				System.out.println(e.getMessage());
				return null;
			}
		}

}
