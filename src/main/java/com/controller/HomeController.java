package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String home() {
		return "home";
	}

	@RequestMapping("/navbar")
	public String nav() {
		return "navbar";
	}

	@RequestMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model) {
		if (error != null) {
			model.addAttribute("error", "Username or Password Incorrect");
		}

		if (logout != null) {
			model.addAttribute("logout", "Logged Out Successfully");
		}
		return "login";
	}

	@RequestMapping("/about")
	public String about() {
		return "about";
	}

//	@RequestMapping("/shop")
//	public String shop() {
//		return "shop";
//	}

	@RequestMapping("/cart")
	public String cart() {
		return "cart";
	}

	@RequestMapping("/contact")
	public String contact() {
		return "contact";
	}

	@RequestMapping("/newproduct")
	public String newproduct() {
		return "productForm";
	}

	@RequestMapping("/services")
	public String services() {
		return "services";
	}

}
