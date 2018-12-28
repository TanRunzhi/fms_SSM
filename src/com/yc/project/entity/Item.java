package com.yc.project.entity;

public class Item {
	private int id;// int primary key auto_increment,
	private int type;// int,
	private String name;// varchar(60),
	private Item p_Item;//  int  references items(id)

	public Item() {
		super();
	}

	@Override
	public String toString() {
		return "Item [id=" + id + ", type=" + type + ", name=" + name + ", p_Item=" + p_Item + "]";
	}
	public int getId() {
		return id;
	}
	public Item setId(int id) {
		this.id = id;
		return this;
	}
	public int getType() {
		return type;
	}
	public Item setType(int type) {
		this.type = type;
		return this;
	}
	public String getName() {
		return name;
	}
	public Item setName(String name) {
		this.name = name;
		return this;
	}
	public Item getP_Item() {
		return p_Item;
	}
	public Item setP_Item(Item p_Item) {
		this.p_Item = p_Item;
		return this;
	}
}
