package com.kh.herb.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	@RequestMapping("test.do")
	public ModelAndView test(ModelAndView mav) {
		mav.setViewName("test");
		return mav;
	}
	
	@RequestMapping("cktest.do")
	public ModelAndView cktest(ModelAndView mav) {
		mav.setViewName("cktest");
		return mav;
	}
}
