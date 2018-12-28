package com.yc.project.service;

import com.yc.project.dao.UserDao;
import com.yc.project.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserService{
	
	@Autowired
	UserDao userDao;

	public User getUserById(int id) {
		return userDao.getUserById(id);
	}

	public User getUserByName(String name) {
		return userDao.getUserByName(name);
	}

	public List<User> getAll(){
		return userDao.getAll();
	}

	public Integer saveOrUpdate(User user){
		if(user.getId() == 0){
			return insert(user);
		}else{
			userDao.update(user);
			return null;
		}

	}

	public void del(int id){
		userDao.del(id);
	}

	public int insert(User user){
		return userDao.insert(user);
	}
	
}
