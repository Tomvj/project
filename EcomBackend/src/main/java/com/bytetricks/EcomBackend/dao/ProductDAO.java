package com.bytetricks.EcomBackend.dao;

import java.util.List;

import com.bytetricks.EcomBackend.model.Product;

public interface ProductDAO 
{
	boolean insertProduct(Product products);
	boolean updateProduct(Product products);
	boolean deleteProduct(int productid);
	List<Product> selectAllProducts();
	List<Product> selectcatProducts(int id);
	Product selectOneProducts(int productid);

}
