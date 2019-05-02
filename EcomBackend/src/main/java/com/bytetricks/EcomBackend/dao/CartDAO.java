package com.bytetricks.EcomBackend.dao;

import java.util.List;

import com.bytetricks.EcomBackend.model.Cart;
import com.bytetricks.EcomBackend.model.User;

public interface CartDAO {
	boolean insertCart(Cart cart);
	boolean updateCart(Cart cart);
	boolean deleteCart(Cart cart);
	List<Cart>selectAllCarts(User customer);
	Cart selectOneCart(int itemid);

}
