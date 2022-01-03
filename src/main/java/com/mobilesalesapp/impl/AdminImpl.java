package com.mobilesalesapp.impl;

import java.sql.*;

import com.mobilesalesapp.dao.AdminDao;
import com.mobilesalesapp.model.AdminPojo;
import com.mobilesalesapp.model.RegisterPojo;
import com.mobilesalesapp.util.ConnectionUtil;



public class AdminImpl implements AdminDao  {
	public  boolean login(AdminPojo admin)  {
		
		Connection con =ConnectionUtil.connect();
		String query="select *from admins_table where email in ? and password in ?";
		PreparedStatement pre;
		int i=0;
		try {
			pre = con.prepareStatement(query);
			pre.setString(1, admin.getAdminUserName());
			pre.setString(2, admin.getPassword());
			//System.out.println(AdminUserName+password);
			
			 i=pre.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(i>0) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public int addWalletAmount(RegisterPojo wallet){
			Connection con=ConnectionUtil.connect();
			String query="commit";
			String query2="update users_table set wallet=(select wallet from users_table where pk_user_id= ? )+? where pk_user_id=?";
			int j=0;
			try {
				PreparedStatement pre=con.prepareStatement(query);
				int i=pre.executeUpdate();
				PreparedStatement pre1=con.prepareStatement(query2);
				pre1.setInt(1, wallet.getUserId());
				pre1.setDouble(2, wallet.getWallet());
				pre1.setInt(3, wallet.getUserId());
				System.out.println(wallet.getWallet()+" add "+wallet.getUserId());
				j=pre1.executeUpdate();
				System.out.println(j);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return j; 
			
			
		}
		
		
		


}
