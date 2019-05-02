package com.bytetricks.EcomFrontend.Controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bytetricks.EcomBackend.dao.UserDAO;
import com.bytetricks.EcomBackend.model.User;

@Controller
public class UserController {
	@Autowired
	UserDAO userdao;

	@RequestMapping("/registerPage")
	String registerPage(Model model) {
		model.addAttribute("myuser", new User());
		model.addAttribute("registerPage", true);
		model.addAttribute("error", false);
		model.addAttribute("message", "");
		model.addAttribute("success", false);
		return "index";
	}

	@RequestMapping("/addcustomer")
	String addCustomer(@Valid @ModelAttribute("myuser") User u, BindingResult bindingResult, Model model) {
		try {
			if (bindingResult.hasErrors()) {
				model.addAttribute("myuser", u);
				model.addAttribute("error", true);
				model.addAttribute("message", "Inappropriate Data");
			} else {
				
				BCryptPasswordEncoder bCryptPasswordEncoder=new BCryptPasswordEncoder();
				u.setPassword(bCryptPasswordEncoder.encode(u.getPassword()));
				if (userdao.insertUser(u)) {
					model.addAttribute("myuser", new User());
					model.addAttribute("success", true);
				} else {
					model.addAttribute("error", true);
					model.addAttribute("message", "please try after some time");
					model.addAttribute("myuser", u);
				}
			}

		} catch (Exception e) {
			model.addAttribute("myuser", u);
			model.addAttribute("error", true);
			model.addAttribute("message", "Duplicate Data");
		}

		model.addAttribute("registerPage", true);
		model.addAttribute("editmode", false);
		return "index";
	}
}