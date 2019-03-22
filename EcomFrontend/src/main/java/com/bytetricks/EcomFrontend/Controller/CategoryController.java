package com.bytetricks.EcomFrontend.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bytetricks.EcomBackend.dao.CategoryDAO;
import com.bytetricks.EcomBackend.model.Category;

@Controller
public class CategoryController {
	@Autowired
	CategoryDAO catdao;

	@RequestMapping("/category")
	String categoryPage(Model model) {
		model.addAttribute("catobject", new Category());
		model.addAttribute("categoryPage", true);
		return "index";
	}

	@RequestMapping("/addcategory")
	String addCategory(@ModelAttribute("catobject") Category c, Model model) {
		catdao.insertCategory(c);
		model.addAttribute("categoryPage", true);
		return "index";
	}
}
