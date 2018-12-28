package com.yc.project.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yc.project.entity.User;
import com.yc.project.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	UserService us;

	@RequestMapping("/")
	public ModelAndView hello() {
		return new ModelAndView("login");
	}

	@RequestMapping("/tologin")
	public ModelAndView tologin(HttpSession session) {
		session.invalidate();
		return new ModelAndView("login");
	}
	
	@RequestMapping("/login")
	public ModelAndView login(String name,String pwd,HttpSession session) {
		User u = us.getUserByName(name);
		if(u!=null && u.getPwd().equals(pwd)) {
			session.setAttribute("loginUser", u);
			return new ModelAndView("index");
		}else {
			return new ModelAndView("login")
					.addObject("name",name)
					.addObject("pwd",pwd)
					.addObject("flag", 2);
		}
	}
	
}
