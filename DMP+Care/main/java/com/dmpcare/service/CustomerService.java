package com.dmpcare.service;

import java.sql.ResultSet;
import java.sql.Statement;

import com.dmpcare.model.Customer;
import com.dmpcare.utils.DBConnect;

public class CustomerService {
	
	public void regCustomer(Customer cus) {
		try {
			String query = "insert into customer values('"+cus.getEmail()+"','"+cus.getName()+"','"+cus.getPassword()+"')";
			
			Statement statement = DBConnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public boolean validate(Customer cus) {
		try {
			String query ="select * from customer where email = '"+cus.getEmail()+"' and password = '"+cus.getPassword()+"'";
			
			Statement statement = DBConnect.getConnection().createStatement();
			
			ResultSet rs = statement.executeQuery(query);
			
			if(rs.next()) {
				cus.setName(rs.getString("name")); 
				return true;
			}
				
	} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public Customer getOne(Customer cus) {
		try {
			String query ="select * from customer where email = '"+cus.getEmail()+"' and password = '"+cus.getPassword()+"'";
			
			Statement statement = DBConnect.getConnection().createStatement();
			
			ResultSet rs = statement.executeQuery(query);
			
			if(rs.next()) {
				cus.setName(rs.getString("name")); 
				cus.setEmail(rs.getString("email"));
				cus.setPassword(rs.getString("password"));
				return cus;
			}
				
	} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
