package com.bytetricks.EcomBackend.dao;

import java.util.List;

import com.bytetricks.EcomBackend.model.Seller;

public interface SellerDAO
{
	boolean insertSeller(Seller seller);
	boolean updateSeller(Seller seller);
	boolean deleteSeller(String sname);
	List<Seller> selectAllSellers();
	Seller selectOneSellers(String sname);

}
