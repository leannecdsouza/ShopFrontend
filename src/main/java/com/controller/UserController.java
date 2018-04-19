package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.leanne.backend.model.User;
import com.leanne.backend.daoimpl.UserImpl;

@Controller
public class UserController {

	@Autowired
	private UserImpl userImpl;

	@RequestMapping("/signup")
	public String signup(Model model) {
		model.addAttribute("User", new User());
		return "signup";
	}

	@RequestMapping("/saveUser")
	public String saveuser(@ModelAttribute(name = "user") User user) {

		user.setEnabled(true);
		userImpl.saveUser(user);
		System.out.println(user.getUserName());
		return "redirect:/home";

	}

}
