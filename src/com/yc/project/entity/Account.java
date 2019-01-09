package com.yc.project.entity;

import java.util.Date;

public class Account {
	private int id;// int  primary key auto_increment,
	private Date date;//  date,
	private double amount;// decimal(10,2),
	private String remark;// varchar(100),
	private User user = new User();// int references users(id),
	private Item item = new Item();// int references items(id)

	public Account() {
		super();
	}

	public int getId() {
		return id;
	}

	public Account setId(int id) {
		this.id = id;
		return this;
	}

	public Date getDate() {
		return date;
	}

	public Account setDate(Date date) {
		this.date = date;
		return this;
	}

	public double getAmount() {
		return amount;
	}

	public Account setAmount(double amount) {
		this.amount = amount;
		return this;
	}

	public String getRemark() {
		return remark;
	}

	public Account setRemark(String remark) {
		this.remark = remark;
		return this;
	}

	public User getUser() {
		return user;
	}

	public Account setUser(User user) {
		this.user = user;
		return this;
	}

	public Item getItem() {
		return item;
	}

	public Account setItem(Item item) {
		this.item = item;
		return this;
	}

	@Override
	public String toString() {
		return "Account [id=" + id + ", adate=" + date + ", amount=" + amount + ", remark=" + remark + ", user=" + user
				+ ", item=" + item + "]";
	}
	
}
