package com.bytetricks.EcomFrontend.Controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bytetricks.EcomBackend.dao.AddressDAO;
import com.bytetricks.EcomBackend.model.Address;
import com.bytetricks.EcomBackend.model.Category;

@Controller
@RequestMapping("/user")
public class AddressController {

	@Autowired
	AddressDAO addressdao;

	@RequestMapping("/address")
	String addressPage(Model model, HttpSession httpsession) {
		model.addAttribute("addressobject", new Address());
		model.addAttribute("addressPage", true);
		model.addAttribute("error", false);
		model.addAttribute("message", "");
		model.addAttribute("success", false);
		model.addAttribute("editmode", false);
		model.addAttribute("addresslist",
				addressdao.selectAllAddress(Integer.parseInt(httpsession.getAttribute("userid").toString())));

		return "index";
	}

	@RequestMapping("/addaddress")
	String addaddress(@Valid @ModelAttribute("addressobject") Address address, BindingResult bindingResult, Model model,
			HttpSession httpsession) {
		try {
			if (bindingResult.hasErrors()) {
				model.addAttribute("addressobject", address);
				model.addAttribute("error", true);
				model.addAttribute("message", "InValid data");

			} else {
				if (addressdao.createAddress(address)) {
					model.addAttribute("addressobject", new Address());
					model.addAttribute("success", true);

				} else {
					model.addAttribute("error", true);
					model.addAttribute("message", "please try after sometimes");
					model.addAttribute("addressobject", address);
				}
			}
		} catch (Exception e) {
			model.addAttribute("addressobject", address);
			model.addAttribute("error", true);
			model.addAttribute("message", "Already Exists");
		}
		model.addAttribute("addressPage", true);
		model.addAttribute("addresslist",
				addressdao.selectAllAddress(Integer.parseInt(httpsession.getAttribute("userid").toString())));
		model.addAttribute("editmode", false);
		return "index";
	}

	@RequestMapping("/deleteaddress")
	String deleteaddress(@RequestParam("addressid") int addrid, Address address, Model model, HttpSession httpsession) {
		try {
			if (addressdao.deleteAddress(addressdao.selectOneAddress(addrid))) {
				return "redirect:/user/address";
			} else {
				model.addAttribute("error", true);
				model.addAttribute("message", "Please try After Sometime");
			}
			model.addAttribute("addressobject", new Address());
			model.addAttribute("addressPage", true);
			model.addAttribute("addresslist",
					addressdao.selectAllAddress(Integer.parseInt(httpsession.getAttribute("userid").toString())));
			model.addAttribute("editmode", false);
			return "index";
		} catch (Exception e) {
			model.addAttribute("addressPage", true);
			model.addAttribute("addressobject", new Address());
			model.addAttribute("error1", false);
			model.addAttribute("success", false);
			model.addAttribute("error2", false);
			model.addAttribute("addresslist",
					addressdao.selectAllAddress(Integer.parseInt(httpsession.getAttribute("userid").toString())));
			model.addAttribute("error3", true);
			model.addAttribute("editmode", false);
			return "index";

		}
	}

	@RequestMapping("/editaddress")
	String editCategory(@RequestParam("addressid") int addrid, Model model, HttpSession httpsession) {
		model.addAttribute("addressobject", addressdao.selectOneAddress(addrid));
		model.addAttribute("addresslist",
				addressdao.selectAllAddress(Integer.parseInt(httpsession.getAttribute("userid").toString())));
		model.addAttribute("addressPage", true);
		model.addAttribute("editmode", true);
		model.addAttribute("success", false);
		model.addAttribute("error1", false);
		model.addAttribute("error2", false);
		model.addAttribute("error3", false);
		model.addAttribute("message", "");
		return "index";

	}

	@RequestMapping("/updateAddress")
	String updateAddressPage(@Valid @ModelAttribute("addressobject") Address address, BindingResult bindingResult,
			Model model, HttpSession httpsession) {

		if (bindingResult.hasErrors()) {
			model.addAttribute("addressPage", true);
			model.addAttribute("addressobject", address);
			model.addAttribute("error1", true);
			model.addAttribute("success", false);
			model.addAttribute("error2", false);
			model.addAttribute("addresslist",
					addressdao.selectAllAddress(Integer.parseInt(httpsession.getAttribute("userid").toString())));
			model.addAttribute("error3", false);
			model.addAttribute("editmode", false);

		}

		else {
			try {
				if (addressdao.updateAddress(address)) {
					model.addAttribute("addressPage", true);
					model.addAttribute("addressobject", new Address());
					model.addAttribute("error1", false);
					model.addAttribute("success", true);
					model.addAttribute("error2", false);
					model.addAttribute("addresslist", addressdao
							.selectAllAddress(Integer.parseInt(httpsession.getAttribute("userid").toString())));
					model.addAttribute("error3", false);
					model.addAttribute("editmode", false);
				} else {
					model.addAttribute("addressPage", true);
					model.addAttribute("addressobject", new Address());
					model.addAttribute("error1", false);
					model.addAttribute("success", false);
					model.addAttribute("error2", false);
					model.addAttribute("addresslist", addressdao
							.selectAllAddress(Integer.parseInt(httpsession.getAttribute("userid").toString())));
					model.addAttribute("error3", true);
					model.addAttribute("editmode", false);
				}
			} catch (Exception e) {
				model.addAttribute("addressPage", true);
				model.addAttribute("addressobject", address);
				model.addAttribute("error1", false);
				model.addAttribute("success", false);
				model.addAttribute("error2", true);
				model.addAttribute("addresslist",
						addressdao.selectAllAddress(Integer.parseInt(httpsession.getAttribute("userid").toString())));
				model.addAttribute("error3", false);
				model.addAttribute("editmode", false);
			}

		}
		return "index";
	}
}
