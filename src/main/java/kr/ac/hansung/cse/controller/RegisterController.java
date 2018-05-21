package kr.ac.hansung.cse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.hansung.cse.model.User;
import kr.ac.hansung.cse.service.UserService;

@Controller
public class RegisterController {

	@Autowired
	private UserService userService;

	@Autowired
	private User user;

	@RequestMapping(value = "/RegisterKey", method = RequestMethod.POST)
	public String registerKey(@RequestParam("Token") String token) {
		if (token != null) {
			user.setToken(token);
			userService.insert(user);
		}

		return "home";
	}
}
