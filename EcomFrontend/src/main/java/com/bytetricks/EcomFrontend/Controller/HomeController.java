package com.bytetricks.EcomFrontend.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bytetricks.EcomBackend.model.Category;

@Controller
public class HomeController {

	@RequestMapping(value = { "/", "/index" })
	String sliderPage(Model model) {
		model.addAttribute("sliderPage", true);
		return "index";

	}

	@RequestMapping("/aboutus")
	String aboutPage(Model model) {
		model.addAttribute("aboutPage", true);
		return "index";

	}

	@RequestMapping("/contact")
	String contactPage(Model model) {
		model.addAttribute("contactPage", true);
		return "index";

	}

}