package kr.ac.hansung.cse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/traffics")
public class TrafficRestController {

	@Autowired
	private MessageController messageController;
	
	@RequestMapping(value="/{id}")
	public String getTraffics(Model model, @PathVariable("id") int id) {
		model.addAttribute("id", id);
		return "trafficstatus";
	}
	
}
