package com.bytetricks.EcomFrontend.Controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bytetricks.EcomBackend.dao.AddressDAO;
import com.bytetricks.EcomBackend.dao.CartDAO;
import com.bytetricks.EcomBackend.dao.MyorderDAO;
import com.bytetricks.EcomBackend.dao.ProductDAO;
import com.bytetricks.EcomBackend.dao.UserDAO;
import com.bytetricks.EcomBackend.model.Cart;
import com.bytetricks.EcomBackend.model.Myorder;
import com.bytetricks.EcomBackend.model.Product;
import com.bytetricks.EcomBackend.model.User;

@Controller
@RequestMapping("/user")
public class OrderController {

	@Autowired
	AddressDAO addressdao;

	@Autowired
	CartDAO cartdao;

	@Autowired
	ProductDAO prodao;

	@Autowired
	UserDAO userdao;

	@Autowired
	MyorderDAO myorderdao;

	@RequestMapping("/placeorder")

	String placeOrder(@RequestParam("addressid") int addid, Model model, HttpSession httpSession) {

		Myorder myorder = new Myorder();

		ArrayList<Cart> carts = (ArrayList<Cart>) cartdao
				.selectAllCarts(userdao.selectOneUser(httpSession.getAttribute("emailid").toString()));

		System.out.println(carts);
		Iterator<Cart> iterator = carts.iterator();

		while (iterator.hasNext()) {

			Date d = new Date();

			long id = UUID.randomUUID().getMostSignificantBits();

			String oid = "OD-".concat(String.valueOf(id).replace("-", "5"));

			Cart cart = (Cart) iterator.next();
			System.out.println(cart);

			// Product product=prodao.selectOneProducts(cart.getProduct().getProductid());
			Product p = prodao.selectOneProducts(cart.getProduct().getProductid());
			System.out.println("product=" + p);

			if (p.getProductstock() >= cart.getQuantity())

			{

				myorder.setAddress(addressdao.selectOneAddress(addid));

				myorder.setOrderid(oid);

				System.out.println("id:" + myorder.getOrderid());

				myorder.setOrderDate(d);

				System.out.println("date:" + myorder.getOrderDate());

				myorder.setQuantity(cart.getQuantity());

				System.out.println("qty:" + myorder.getQuantity());
				myorder.setProduct(cart.getProduct());
				System.out.println("pid:" + myorder.getProduct());
				myorder.setSubtotal(cart.getSubtotal());

				myorder.setCustomer(userdao.selectOneUser(httpSession.getAttribute("emailid").toString()));
				System.out.println(myorder.getCustomer());

				int qty = p.getProductid() - cart.getQuantity();

				p.setProductstock(qty);
				System.out.println(myorder);

				if (myorderdao.insertMyOrder(myorder))

				{

					prodao.updateProduct(p);
					cartdao.deleteCart(cartdao.selectOneCart(cart.getItemid()));

				}

			}

		}

		ArrayList<Cart> cartitems = (ArrayList<Cart>) cartdao
				.selectAllCarts(userdao.selectOneUser(httpSession.getAttribute("emailid").toString()));

		httpSession.setAttribute("itemcount", cartitems.size());

		model.addAttribute("orderlist",
				myorderdao.selectAllMyOrders(userdao.selectOneUser(httpSession.getAttribute("emailid").toString())));

		model.addAttribute("orderpage", true);

		return "index";

	}

	@RequestMapping("/vieworders")

	String viewallorders(Model model, HttpSession httpSession)

	{

		model.addAttribute("orderlist",
				myorderdao.selectAllMyOrders(userdao.selectOneUser(httpSession.getAttribute("userid").toString())));

		model.addAttribute("orderpage", true);

		return "index";

	}

	@RequestMapping("/receipt")

	String receipt(@RequestParam("rid") String oid, Model model, HttpSession httpSession)

	{

		model.addAttribute("order", myorderdao.selectOneMyOrder(oid));

		model.addAttribute("receiptpage", true);

		return "index";

	}

}