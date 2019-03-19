package com.bytetricks.EcomBackend.dao;

import java.util.List;

import com.bytetricks.EcomBackend.model.Category;

public interface CategoryDAO 
{

	boolean insertCategory(Category category);
	boolean updateCategory(Category category);
	boolean deleteCategory(String categname);
	List<Category> selectAllCategories();
	Category selectOneCategory(String categname);
	
}
