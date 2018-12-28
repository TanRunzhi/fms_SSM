package com.yc.project.entity;

public class User {
	private int id;// int primary key auto_increment,
	private String name;// varchar(20),
	private String realname;// varchar(20),
	private String pwd;// varchar(10)
	
	
	public User() {
		super();
	}


	public User(int id, String name, String realname, String pwd) {
		super();
		this.id = id;
		this.name = name;
		this.realname = realname;
		this.pwd = pwd;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getRealname() {
		return realname;
	}


	public void setRealname(String realname) {
		this.realname = realname;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", realname=" + realname + ", pwd=" + pwd + "]";
	}
	
	
	
}
