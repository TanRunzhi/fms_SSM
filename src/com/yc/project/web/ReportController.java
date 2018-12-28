package com.yc.project.web;

import com.yc.project.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/report")
public class ReportController {
	
	@Autowired
	AccountService as;
	
	@RequestMapping("/bbtj")
	public ModelAndView list(HttpSession s) {
		return new ModelAndView("report/bbtj");
	}



}
