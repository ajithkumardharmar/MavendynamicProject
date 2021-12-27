package com.mobilesalesapp.impl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.mobilesalesapp.connection.ConnectionPro;
import com.mobilesalesapp.dao.UserDao;
import com.mobilesalesapp.model.ContactUsPojo;
import com.mobilesalesapp.model.RegisterPojo;

public class UserImpl implements UserDao {
	public void register(RegisterPojo p) {

		Connection con = ConnectionPro.connect();

		String query = "insert into users_table (first_name,email,phone_number,password,confirm_password) values(?,?,?,?,?)";
		String query2 = "commit";
		PreparedStatement pre;
		try {
			pre = con.prepareStatement(query);
			pre.setString(1, p.getName());
			pre.setString(2, p.getEmail());
			pre.setLong(3, p.getPhone_number());
			pre.setString(4, p.getPassword());
			pre.setString(5, p.getConfirm_password());
			System.out.println("print");
			pre.executeUpdate();
			pre.executeUpdate(query2);
			System.out.println("print1");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// System.out.println(i);
	}

	public ResultSet fetch(RegisterPojo login) {
		// List<LoginPojo> loginpojo = new ArrayList();
		Connection con = ConnectionPro.connect();
		String query = "select * from users_table  where email in ? and password in ?";
		PreparedStatement pre;
		ResultSet rs = null;
		try {
			
			pre = con.prepareStatement(query);
			pre.setString(1, login.getEmail());
			pre.setString(2, login.getPassword());
			rs = pre.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rs;

	}

	public ResultSet userDetails() {
		Connection con = ConnectionPro.connect();
		String query = "select pk_user_id,first_name,email,phone_number,wallet from users_table";
		Statement st;
		ResultSet ns = null;
		try {
			st = con.createStatement();
			// st.executeQuery(query);
			ns = st.executeQuery(query);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ns;

	}
	public void contactUs(ContactUsPojo contactUs) {
		Connection con = ConnectionPro.connect();
		String query = "insert into contactus values(?,?,?,?) ";
		try {
			PreparedStatement pre =con.prepareStatement(query);
			pre.setString(1, contactUs.getName());
			pre.setString(2, contactUs.getEmail());
			pre.setLong(3, contactUs.getPhoneNumber());
			pre.setString(4, contactUs.getDescription());
			int i=pre.executeUpdate();
			System.out.println(i);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
