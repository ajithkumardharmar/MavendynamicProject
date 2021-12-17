package com.ajith;

import java.sql.*;

public class NewConnection {
	public static void Connect1(RegisterDao p) throws ClassNotFoundException, SQLException {
		//Class.forName("oracle.jdbc.OracleDriver");
		Connection con=ConnectionPro.connect();
		
		String query="insert into users_table (first_name,email,phone_number,password,confirm_password) values(?,?,?,?,?)";
		String query2="commit";
		PreparedStatement pre=con.prepareStatement(query);
		pre.setString(1, p.getName());
		pre.setString(2, p.getEmail());
		pre.setLong(3, p.getPhone_number());
		pre.setString(4, p.getPassword());
		pre.setString(5, p.getConfirm_password());
		System.out.println("print");
		pre.executeUpdate();
		pre.executeUpdate(query2);
		System.out.println("print1");
		//System.out.println(i);
	}
	public static boolean fetch(LoginDao Login) throws Exception{
	
		Connection con=ConnectionPro.connect();
		String query="select * from users_table  where email in ? and password in ?";
		PreparedStatement pre=con.prepareStatement(query);
		pre.setString(1, Login.getUsername());
		pre.setString(2, Login.getPassword());
	ResultSet rs = pre.executeQuery();

	if(rs.next()) {
		return true;
	}
	else
	{
		return false;	
	}
	
	}
	public static ResultSet userDetails() {
		Connection con=ConnectionPro.connect();
		String query="select first_name,email,phone_number from users_table";
		Statement st;
		ResultSet ns=null;
		try {
			st = con.createStatement();
			//st.executeQuery(query);
			ns=st.executeQuery(query);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ns;
		
	}
	
}
