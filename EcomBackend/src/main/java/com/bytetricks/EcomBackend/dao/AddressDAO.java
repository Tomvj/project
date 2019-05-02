package com.bytetricks.EcomBackend.dao;

import java.util.List;

import com.bytetricks.EcomBackend.model.Address;

public interface AddressDAO {
	boolean createAddress(Address address);

	boolean updateAddress(Address address);

	boolean deleteAddress(Address address);

	List<Address> selectAllAddress(int user_Id);

	Address selectOneAddress(int address_Id);

}
