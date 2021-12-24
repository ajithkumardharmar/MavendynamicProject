package com.mobilesalesapp.dao;

import java.sql.ResultSet;

import com.mobilesalesapp.model.OrderPojo;
import com.mobilesalesapp.model.UpdateWalletPojo;

public interface OrderDao {
	public int updateWallet1(UpdateWalletPojo obj1);

	public int insertOrder(OrderPojo obj2);
	
	public ResultSet viewAllOrders(OrderPojo orderPojo);
	
	public void orderCancel(OrderPojo orderPojo);

}
