package com.yc.project.web;

import javax.servlet.http.HttpSession;

import com.yc.project.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yc.project.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService us;
	
	@RequestMapping("/list")
	public ModelAndView list(HttpSession s) {
		return new ModelAndView("user/list")
				.addObject("users", us.getAll());
	}

	@RequestMapping("/edit")
	public ModelAndView edit(String id) {
		return new ModelAndView("user/edit")
				.addObject("user",id==null?new User():us.getUserById(Integer.parseInt(id)));
	}

	@RequestMapping("/update")
	public ModelAndView update(User user) {
		System.out.println("UserController.update "+user);
		us.saveOrUpdate(user);
		return new ModelAndView("redirect:/user/list");
	}

	@RequestMapping("/del")
	public ModelAndView del(int id) {
		System.out.println("UserController.del " + id);
		us.del(id);
		return new ModelAndView("redirect:/user/list");
	}

	@RequestMapping("/modifyName")
	@ResponseBody
	public boolean modifyName(String name,String oldName) {
		System.out.println("UserController.modifyName+:" + name + oldName );
		User u = us.getUserByName(name);
		return u==null || u.getName().equals(oldName);
	}


}
