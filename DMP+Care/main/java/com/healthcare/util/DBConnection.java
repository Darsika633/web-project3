package com.healthcare.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		
		String username = "root";
		String password = "123456";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
			    "jdbc:mysql://localhost:3306/dmpcare?characterEncoding=utf8&useSSL=false",
			    username, password
			);
		
		return con;
	}
}
