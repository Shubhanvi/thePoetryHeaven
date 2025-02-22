package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.user.UserDetails;

public class UserDAO {
	
	private Connection con;

	public UserDAO(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean addUser(UserDetails us) {
		boolean f = false;
		
		try {
			
			String q = "insert into users (name,email,password) values(?,?,?)";
			
			PreparedStatement ps = con.prepareStatement(q);
			
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPassword());
			
			int i = ps.executeUpdate();
			if(i == 1) {
				f = true;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	public UserDetails signInuser(UserDetails us) {
		
		UserDetails user = null;
		
		try {
			
			String q = "select * from users where email = ?  and password = ?";
			
			PreparedStatement ps = con.prepareStatement(q);
			
			ps.setString(1, us.getEmail());
			ps.setString(2, us.getPassword());
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				user = new UserDetails();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword("password");
				
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return user;
		
	}
	


}
