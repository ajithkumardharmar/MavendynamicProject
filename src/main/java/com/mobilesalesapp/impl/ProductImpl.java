package com.mobilesalesapp.impl;

import java.sql.*;

import com.mobilesalesapp.dao.ProductDao;
import com.mobilesalesapp.model.ProductPojo;
import com.mobilesalesapp.util.ConnectionUtil;

public class ProductImpl implements ProductDao {
	public void add(ProductPojo obj) {
		

			Connection con = ConnectionUtil.connect();

			String query = "insert into products (product_name,description,standard_price,list_price) values(?,?,?,?)";
			try {
			PreparedStatement pre = con.prepareStatement(query);
			pre.setString(1, obj.getProductName());
			pre.setString(2, obj.getDescription());
			pre.setDouble(3, obj.getStandardCost());
			pre.setDouble(4, obj.getListCost());
			pre.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public int delete(ProductPojo obj1) {
		Connection con = ConnectionUtil.connect();
		String query = "Delete from products where pk_product_id=?";
		int i=0;
		try {
			PreparedStatement pre = con.prepareStatement(query);
			pre.setInt(1, obj1.getId());
			 i = pre.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;

	}

	public void update(ProductPojo obj1) {
		String query = "update products set standard_price=?,list_price=? where pk_product_id=?";
		Connection con = ConnectionUtil.connect();
		try {
			PreparedStatement pre = con.prepareStatement(query);
			pre.setDouble(1, obj1.getStandardCost());
			pre.setDouble(2, obj1.getListCost());
			pre.setInt(3, obj1.getId());
			pre.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	public ResultSet showAllProduct() {
		String query = "select pk_product_id,product_name,description,standard_price,list_price,url from products ";
		Connection con = ConnectionUtil.connect();
		
		ResultSet rs=null;
		try 
		{
			Statement st = con.createStatement();
			rs = st.executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet selectProduct(int productId) {
		String query = "select pk_product_id,product_name,description,standard_price,list_price,url from products where pk_product_id= '"+productId+"'";
		Connection con = ConnectionUtil.connect();
		
		ResultSet rs=null;
		try 
		{
			Statement st = con.createStatement();
			rs = st.executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
}
