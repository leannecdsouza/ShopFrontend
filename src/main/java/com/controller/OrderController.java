package com.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.leanne.backend.model.Cart;
import com.leanne.backend.model.Order;
import com.leanne.backend.daoimpl.CartImpl;
import com.leanne.backend.daoimpl.OrderImpl;

@Controller
public class OrderController {

	@Autowired
	private CartImpl cartImpl;

	@Autowired
	private OrderImpl orderImpl;

	@RequestMapping("/payment")
	public String payment(@RequestParam int id, Model model) {
		model.addAttribute("ShippingId", id);
		return "payment";
	}

	@RequestMapping("/order")
	public String order(@RequestParam int id, Model model) {
		int tot = 0;
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername();
		System.out.println(username);
		List<Cart> cartitems = cartImpl.getCartByUsername(username);
		Order order = new Order();
		order.setCartitems(cartitems);
		order.setUser(username);
		orderImpl.saveOrder(order);
		for (Cart c : cartitems) {
			tot = tot + c.getTotal();
		}
		model.addAttribute("total", tot);
		Date date = new Date();
		String pattern = "dd-MM-yyyy";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		Random rand = new Random();
		int i = 2 + rand.nextInt(3);
		c.add(Calendar.DATE, i);
		String d = sdf.format(c.getTime());
		System.out.println(d);
		int dd = c.get(Calendar.DATE);
		long yy = c.get(Calendar.YEAR);
		String mm = new SimpleDateFormat("MMM").format(c.getTime());
		String day = new SimpleDateFormat("EE").format(c.getTime());
		String delivery = day + ", " + mm + " " + dd + " " + yy;
		model.addAttribute("delivery", delivery);
		model.addAttribute("count", cartitems.size());
		model.addAttribute("orders", orderImpl.list(username));
		return "order";
	}

	@RequestMapping("/thankyou")
	public String thankyou(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername();
		orderImpl.removeAllOrderItems(username);
		cartImpl.removeAllCartItem(username);
		return "thankyou";
	}

}
