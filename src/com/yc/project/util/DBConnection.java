package com.yc.project.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;


public class DBConnection {
	// 获得Connection对象
	public static Connection getConnection(){
		// 里面的参数放入到配置文件 .properties
		//读取db.properties里面的参数
		Connection conn=null;
		try {
			Properties p = new Properties();
			p.load(DBConnection.class.getResourceAsStream("/db.properties"));
			String driverName = p.getProperty("driverName");
			String url =  p.getProperty("url");
			String username =  p.getProperty("loginname");
			String pwd =  p.getProperty("password");
			Class.forName(driverName);
			conn=DriverManager.getConnection(url, username, pwd);
		}catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		return conn;
	}
	
	public static void main(String[] args) throws Exception {
		Connection conn=DBConnection.getConnection();
		System.out.println(conn);
		
		
	}

}
