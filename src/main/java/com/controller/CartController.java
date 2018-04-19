package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.leanne.backend.daoimpl.CartImpl;
import com.leanne.backend.daoimpl.ProductImpl;
import com.leanne.backend.model.Cart;
import com.leanne.backend.model.Product;



@Controller
public class CartController {

	@Autowired
	private ProductImpl productImpl;

	@Autowired
	private CartImpl cartImpl;

	@RequestMapping("/cart/{productId}")
	public String cart(@PathVariable("productId") int productId, @RequestParam int units, Model model) {
		Product product = productImpl.getProductById(productId);
		model.addAttribute("product", product);
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername();
		System.out.println(username);
		List<Cart> cartitems = cartImpl.getCartByUsername(username);

		for (Cart cartitem : cartitems) {
			if (cartitem.getProducts().getProductId() == productId) {
				cartitem.setQuantity(cartitem.getQuantity() + 1);
				cartitem.setTotal(product.getPrice() * cartitem.getQuantity());
				productImpl.saveProduct(product);
				cartImpl.saveCart(cartitem);
				model.addAttribute("units", cartitem.getQuantity());
				return "redirect:/mycart";
			}

		}
		Cart cart = new Cart();
		cart.setProductName(product.getProductName());
		cart.setPrice(product.getPrice());
		cart.setQuantity(units);
		cart.setTotal(product.getPrice());
		cart.setUser(username);
		cart.setProducts(product);
		productImpl.saveProduct(product);
		cartImpl.saveCart(cart);
		return "redirect:/mycart";
	}

	@RequestMapping("/mycart")
	public String getcart(HttpSession session, Model model) {
		int tot = 0;
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername();
		System.out.println(username);
		List<Cart> cart = cartImpl.getCartByUsername(username);
		for (Cart c : cart) {
			tot = tot + c.getTotal();
		}
		model.addAttribute("total", tot);
		model.addAttribute("i", cart);
		session.setAttribute("count", cart.size());

		return "cart";
	}

	@RequestMapping("/cart/minus/{id}")
	public String minus(@PathVariable int id, Model model) {
		Product product = productImpl.getProductById(id);
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername();
		List<Cart> cartitems = cartImpl.getCartByUsername(username);

		for (Cart cartitem : cartitems) {
			if (cartitem.getProducts().getProductId() == id) {
				if (cartitem.getQuantity() > 1) {
					cartitem.setQuantity(cartitem.getQuantity() - 1);
					cartitem.setTotal(cartitem.getProducts().getPrice() * cartitem.getQuantity());
					productImpl.saveProduct(product);
					cartImpl.saveCart(cartitem);

				}
			}
		}
		return "redirect:/mycart";
	}

	@RequestMapping("/cart/plus/{id}")
	public String plus(@PathVariable int id, Model model) {
		Product product = productImpl.getProductById(id);
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername();
		List<Cart> cartitems = cartImpl.getCartByUsername(username);
		
		System.out.println(cartitems.size());
		for (Cart cartitem : cartitems) {
			if (cartitem.getProducts().getProductId() == id) {
				cartitem.setQuantity(cartitem.getQuantity() + 1);
				cartitem.setTotal(cartitem.getProducts().getPrice() * cartitem.getQuantity());
				productImpl.saveProduct(product);
				cartImpl.saveCart(cartitem);
				System.out.println(cartitem.getQuantity());
			}
		}
		return "redirect:/mycart";
	}

	@RequestMapping("/cart/removecartitem/{cartitemid}")
	public String removecartitem(@PathVariable int cartitemid, Model model) {

		cartImpl.removeCartItem(cartitemid);
		return "redirect:/mycart";
	}

	@RequestMapping("/cart/removecart")
	public String removecart(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername();

		cartImpl.removeAllCartItem(username);
		return "redirect:/mycart";
	}

}
