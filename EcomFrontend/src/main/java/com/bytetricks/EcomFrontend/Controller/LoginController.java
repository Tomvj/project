package com.bytetricks.EcomFrontend.Controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bytetricks.EcomBackend.dao.UserDAO;
import com.bytetricks.EcomBackend.model.User;

@Controller
public class LoginController {

	@Autowired
	UserDAO userdao;

	@RequestMapping("/login")
	String loginPage(Model model) {
		model.addAttribute("loginPage", true);
		return "index";
	}

	@RequestMapping("/flogin")
	String flogin(Model model) {
		model.addAttribute("error", true);
		model.addAttribute("loginPage", true);
		return "index";
	}

	@RequestMapping("/loginsuccess")
	String loginnsuccess(Model model, HttpSession httpSession) {
		String emailid = SecurityContextHolder.getContext().getAuthentication().getName();
		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
				.getAuthentication().getAuthorities();
		for (GrantedAuthority authority : authorities) {

			if (authority.getAuthority().equals("ROLE_USER")) {
				User user = userdao.selectOneUser(emailid);
				httpSession.setAttribute("username", user.getCname());
				httpSession.setAttribute("userid", user.getCusid());
				httpSession.setAttribute("emailid", user.getEmailid());
				httpSession.setAttribute("Userloggedin", true);
				if (httpSession.getAttribute("pid") != null) {
					return "redirect:/addToCart?pid=" + Integer.parseInt(httpSession.getAttribute("pid").toString())
							+ "&quantity=" + Integer.parseInt(httpSession.getAttribute("qty").toString());
				} else {
					model.addAttribute("sliderPage", true);
				}
			} else if (authority.getAuthority().equals("ROLE_ADMIN")) {
				httpSession.setAttribute("username", "ADMINISTRATOR");
				httpSession.setAttribute("adminloggedin", true);
				model.addAttribute("sliderPage", true);
			} else {
				httpSession.setAttribute("username", "SELLER");
				httpSession.setAttribute("sellerloggedin", true);
				model.addAttribute("sliderPage", true);
			}
		}
		return "index";
	}

}
