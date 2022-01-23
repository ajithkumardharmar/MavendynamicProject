package com.mobilesalesapp.dao;

import java.sql.ResultSet;

import com.mobilesalesapp.model.ProductPojo;

public interface ProductDao {
	public void add(ProductPojo obj);

	public int delete(ProductPojo obj1);

	public void update(ProductPojo obj1);
	
	public ResultSet selectProduct(int productId);

}
