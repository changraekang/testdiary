package com.cos.dietApp.domain;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class BoardController {

	@GetMapping("/")
	public String diary () {
		
		return "index";
	}
	
	@GetMapping("/new")
	public String calenar () {
		return "NewFile";
	}
}
