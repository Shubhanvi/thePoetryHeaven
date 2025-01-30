package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.user.Post;

public class PostDAO {

	private Connection con;

	public PostDAO(Connection con) {
		super();
		this.con = con;
	}

	public boolean addPoetry(String ti, String co, int ui) {
		boolean f = false;

		try {

			String q = "insert into post (title,content,uid) values (?,?,?)";

			PreparedStatement ps = con.prepareStatement(q);
			ps.setString(1, ti);
			ps.setString(2, co);
			ps.setInt(3, ui);

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public List<Post> getData(int id) {

		List<Post> list = new ArrayList<Post>();
		Post p;

		try {
			String q = "select * from post where uid = ? order by id DESC";

			PreparedStatement ps = con.prepareStatement(q);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new Post();
				p.setId(rs.getInt(1));
				p.setTitle(rs.getString(2));
				p.setContent(rs.getString(3));
				p.setPdate(rs.getTimestamp(4));
				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Post getDataById(int poetryid) {
		Post p = null;
		
		try {
			String q = "select * from post where id=?";
			PreparedStatement ps = con.prepareStatement(q);
			ps.setInt(1, poetryid);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				p = new Post();
				p.setId(rs.getInt(1));
				p.setTitle(rs.getString(2));
				p.setContent(rs.getString(3));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return p;
	}
	
	public boolean postUpdate(int pid, String ti, String co) {
		boolean f = false;
		
		try {
			String q = "update post	set title = ?, content = ? where id = ?";
			PreparedStatement ps = con.prepareStatement(q);
			
			ps.setString(1, ti);
			ps.setString(2,co);
			ps.setInt(3, pid);
			
			int i = ps.executeUpdate();
			
			if(i == 1)  f = true;
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean deletePoetry(int pid) {
		boolean f = false;
		
			try {
				String q = "delete from post where id = ?";
				PreparedStatement ps = con.prepareStatement(q);
				ps.setInt(1, pid);
				
				int i = ps.executeUpdate();
				if(i==1) f = true;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		return f;
	}

}
