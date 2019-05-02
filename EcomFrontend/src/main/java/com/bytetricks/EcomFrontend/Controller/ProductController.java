package com.bytetricks.EcomFrontend.Controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bytetricks.EcomBackend.dao.CategoryDAO;
import com.bytetricks.EcomBackend.dao.ProductDAO;
import com.bytetricks.EcomBackend.dao.SellerDAO;
import com.bytetricks.EcomBackend.model.Category;
import com.bytetricks.EcomBackend.model.Product;
import com.bytetricks.EcomBackend.model.Seller;

@Controller
public class ProductController {

	@Autowired
	ProductDAO prodao;
	@Autowired
	CategoryDAO catdao;
	@Autowired
	SellerDAO seldao;

	void addimage(MultipartFile f, int id) {
		try {
			String path = "D:\\Ecommerce\\EcomFrontend\\src\\main\\webapp\\resources\\productimages\\";
			path = path + String.valueOf(id) + ".jpg";
			if (!f.isEmpty()) {
				byte[] imagebytes = f.getBytes();
				File x = new File(path);
				if (x.exists()) {
					x.delete();
					BufferedOutputStream bs = new BufferedOutputStream(new FileOutputStream(x));
					bs.write(imagebytes);
					bs.close();
				} else {
					BufferedOutputStream bs = new BufferedOutputStream(new FileOutputStream(x));
					bs.write(imagebytes);
					bs.close();
				}
			}
			Thread.sleep(5000);
		} catch (Exception e) {

		}
	}

	void deleteimage(int id) {
		try {
			String path = "D:\\Ecommerce\\EcomFrontend\\src\\main\\webapp\\resources\\productimages\\";
			path = path + String.valueOf(id) + ".jpg";
			File x = new File(path);
			if (x.exists()) {
				x.delete();
			}
			Thread.sleep(5000);
		} catch (Exception e) {

		}
	}

	@RequestMapping("/admin/product")
	String productPage(Model model) {
		model.addAttribute("prodobject", new Product());
		model.addAttribute("productlist", prodao.selectAllProducts());
		model.addAttribute("categorylist", catdao.selectAllCategories());
		model.addAttribute("sellerlist", seldao.selectAllSellers());
		model.addAttribute("productPage", true);
		return "index";
	}
	
	

	@RequestMapping("/viewproduct")
	String viewproductPage(Model model) {
		model.addAttribute("productlist", prodao.selectAllProducts());
		model.addAttribute("categorylist", catdao.selectAllCategories());
		model.addAttribute("viewproductPage", true);
		return "index";
	}

	@RequestMapping("/viewoneproduct")
	public String viewoneproductpage(Model model, @RequestParam("pid") int prodid) {
 		model.addAttribute("viewoneproductpage", true);
		model.addAttribute("myproduct", prodao.selectOneProducts(prodid));
		return "index";

	}

	@RequestMapping("/selectbycat")
	String viewcatproductPage(@RequestParam("catid")int id,Model model) {
		model.addAttribute("productlist", prodao.selectcatProducts(id));
		model.addAttribute("categorylist", catdao.selectAllCategories());
		model.addAttribute("viewproductPage", true);
		return "index";
	}

	@RequestMapping("/seller/addproduct")
	String addProduct(@Valid @ModelAttribute("prodobject") Product p, BindingResult bindingResult, Model model) {
		try {
			Object s;
			if (bindingResult.hasErrors()) {
				model.addAttribute("prodobject", p);
				model.addAttribute("error", true);
				model.addAttribute("message", "Inapproprite data");

			} else {
				if (prodao.insertProduct(p)) {
					addimage(p.getPimage(), p.getProductid());
					model.addAttribute("prodobject", new Product());
					model.addAttribute("success", true);

				} else {
					model.addAttribute("prodobject", new Product());
					model.addAttribute("message", "pls try after sometimes");
					model.addAttribute("prodobject", p);
				}
			}
		} catch (Exception e) {
			model.addAttribute("prodobject", p);
			model.addAttribute("error", true);
			model.addAttribute("message", "Already Exists");
		}
		model.addAttribute("productPage", true);
		model.addAttribute("productlist", prodao.selectAllProducts());
		model.addAttribute("categorylist", catdao.selectAllCategories());
		model.addAttribute("sellerlist", seldao.selectAllSellers());
		return "index";

	}

	@RequestMapping("/seller/deleteproduct")
	String deleteCategory(@RequestParam("prdid") int productid, Model model) {
		if (prodao.deleteProduct(productid)) {
			deleteimage(productid);
			model.addAttribute("success", true);
		} else {
			model.addAttribute("error", true);
			model.addAttribute("message", "Please try After Sometime");
		}
		model.addAttribute("prodobject", new Product());
		model.addAttribute("productPage", true);
		model.addAttribute("productlist", prodao.selectAllProducts());
		model.addAttribute("categorylist", catdao.selectAllCategories());
		model.addAttribute("sellerlist", seldao.selectAllSellers());

		model.addAttribute("editmode", false);
		return "index";
	}

	@RequestMapping("/seller/editproduct")
	String editCategory(@RequestParam("prdid") int proid, Model model) {
		model.addAttribute("editmode", true);
		model.addAttribute("success", false);
		model.addAttribute("error", false);
		model.addAttribute("message", "");
		model.addAttribute("prodobject", prodao.selectOneProducts(proid));
		model.addAttribute("categorylist", catdao.selectAllCategories());
		model.addAttribute("sellerlist", seldao.selectAllSellers());
		model.addAttribute("productPage", true);
		model.addAttribute("productlist", prodao.selectAllProducts());
		return "index";

	}

	@RequestMapping("/seller/updateproduct")
	String updateCategory(@Valid @ModelAttribute("prodobject") Product p, BindingResult bindingResult, Model model) {
		try {
			if (bindingResult.hasErrors()) {
				model.addAttribute("prodobject", p);
				model.addAttribute("error", true);
				model.addAttribute("message", "Already Exist Data");

			} else {
				if (prodao.updateProduct(p)) {
					model.addAttribute("prodobject", new Category());
					model.addAttribute("success", true);
				} else {
					model.addAttribute("error", true);
					model.addAttribute("message", "Pls try After Sometime");
					model.addAttribute("prodobject", p);
				}
			}
		} catch (Exception e) {
			model.addAttribute("prodobject", p);
			model.addAttribute("error", true);
			model.addAttribute("message", "Duplicate Data");
		}
		model.addAttribute("productPage", true);
		model.addAttribute("productlist", prodao.selectAllProducts());
		model.addAttribute("categorylist", catdao.selectAllCategories());
		model.addAttribute("sellerlist", seldao.selectAllSellers());

		model.addAttribute("editmode", false);
		return "index";
	}

}
