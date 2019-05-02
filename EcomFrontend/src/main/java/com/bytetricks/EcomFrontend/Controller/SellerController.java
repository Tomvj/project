package com.bytetricks.EcomFrontend.Controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bytetricks.EcomBackend.dao.SellerDAO;
import com.bytetricks.EcomBackend.model.Seller;

@Controller
public class SellerController {
	@Autowired
	SellerDAO selldao;

	@RequestMapping("/sellerregister")
	String sellerPage(Model model) {
		model.addAttribute("sellobject", new Seller());
		model.addAttribute("sellerlist", selldao.selectAllSellers());
		model.addAttribute("sellerPage", true);
		model.addAttribute("error", false);
		model.addAttribute("message", "");
		model.addAttribute("success", false);
		return "index";

	}

	@RequestMapping("/addseller")
	String addSeller(@Valid @ModelAttribute("sellobject") Seller c, BindingResult bindingResult, Model model) {
		try {
			Object s;
			if (bindingResult.hasErrors()) {
				model.addAttribute("sellobject", c);
				model.addAttribute("error", true);
				model.addAttribute("message", "Inapproprite data");

			} else {
				BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
				c.setPassword(bCryptPasswordEncoder.encode(c.getPassword()));
				if (selldao.insertSeller(c)) {
					model.addAttribute("sellobject", new Seller());
					model.addAttribute("success", true);

				} else {
					model.addAttribute("sellobject", new Seller());
					model.addAttribute("message", "pls try after sometimes");
					model.addAttribute("sellobject", c);
				}
			}
		} catch (Exception e) {
			model.addAttribute("sellobject", c);
			model.addAttribute("error", true);
			model.addAttribute("message", "Already Exists");
		}
		model.addAttribute("sellerPage", true);
		model.addAttribute("sellerlist", selldao.selectAllSellers());
		return "index";

	}

	@RequestMapping("/deleteseller")
	String deleteSeller(@RequestParam("sellname") String sellname, Model model) {
		try {
			if (selldao.deleteSeller(sellname)) {
				model.addAttribute("success", true);
			} else {
				model.addAttribute("error", true);
				model.addAttribute("message", "please try after some time");
			}
		} catch (Exception e) {
			model.addAttribute("error", true);
			model.addAttribute("message", "please delete products first and then delete seller");

		}
		model.addAttribute("sellobject", new Seller());
		model.addAttribute("sellerPage", true);
		model.addAttribute("sellerlist", selldao.selectAllSellers());
		model.addAttribute("editmode", false);
		return "index";
	}

	@RequestMapping("/editseller")
	String editSeller(@RequestParam("sellname") String sellname, Model model) {

		model.addAttribute("editmode", true);
		model.addAttribute("success", false);
		model.addAttribute("error", false);
		model.addAttribute("message", "");
		model.addAttribute("sellobject", selldao.selectOneSellers(sellname));
		model.addAttribute("sellerPage", true);
		model.addAttribute("sellerlist", selldao.selectAllSellers());
		return "index";

	}

	@RequestMapping("/updateseller")
	String updateSeller(@Valid @ModelAttribute("sellobject") Seller s, BindingResult bindingResult, Model model) {
		try {
			if (bindingResult.hasErrors()) {
				model.addAttribute("sellobject", s);
				model.addAttribute("error", true);
				model.addAttribute("message", "Inappropriate Data");
			} else {
				if (selldao.updateSeller(s)) {
					model.addAttribute("sellobject", new Seller());
					model.addAttribute("success", true);
				} else {
					model.addAttribute("error", true);
					model.addAttribute("message", "please try after some time");
					model.addAttribute("sellobject", s);
				}
			}

		} catch (Exception e) {
			model.addAttribute("sellobject", s);
			model.addAttribute("error", true);
			model.addAttribute("message", "Duplicate Data");
		}

		model.addAttribute("sellerPage", true);
		model.addAttribute("sellerlist", selldao.selectAllSellers());
		model.addAttribute("editmode", false);
		return "index";
	}

}
