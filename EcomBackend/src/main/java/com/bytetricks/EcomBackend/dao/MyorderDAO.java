package com.bytetricks.EcomBackend.dao;

import java.util.List;

import com.bytetricks.EcomBackend.model.Myorder;
import com.bytetricks.EcomBackend.model.User;

public interface MyorderDAO {
	boolean insertMyOrder(Myorder myorder);
	boolean updateMyOrder(Myorder myorder);
	boolean deleteMyOrder(String orderid);
	List<Myorder>selectAllMyOrders(User customer);
	Myorder selectOneMyOrder(String orderid);

}
