package com.yc.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import com.yc.project.entity.User;
import org.apache.ibatis.annotations.Update;

public interface UserDao {
	
	@Select("select id,name,realname,pwd from users where id = #{id} and flag = 1")
	User getUserById(int id);

	@Select("select id,name,realname,pwd from users where name = #{name} and flag = 1 ")
	User getUserByName(String name);

	@Select("select id,name,realname,pwd from users where flag = 1")
	List<User> getAll();

	@Update("update users set name=#{name},realname=#{realname},pwd=#{pwd} where id = #{id} and flag = 1")
	void update(User user);

	@Update("update users set flag = 0 where id = #{id}")
	void del(int id);

	@Insert("insert into users(name,realname,pwd) values(#{name},#{realname},#{pwd})")
	@Options(useGeneratedKeys = true , keyProperty = "id")
	int insert(User user);

}
