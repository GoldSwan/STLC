package kr.ac.hansung.cse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.hansung.cse.model.Token;
import kr.ac.hansung.cse.service.TokenService;

@Controller
public class TokenController {

	@Autowired
	private TokenService tokenService;

	@RequestMapping(value = "/RegisterKey", method = RequestMethod.POST)
	public String registerKey(@RequestParam("Token") String value) {
		if (value != null) {
			Token token = new Token();
			token.setValue(value);
			tokenService.insertToken(token);
		}
		return "empty";
	}
}
