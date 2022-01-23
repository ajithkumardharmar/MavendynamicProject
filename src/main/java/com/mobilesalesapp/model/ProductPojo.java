package com.mobilesalesapp.model;

public class ProductPojo {
	private int id;
	private String productName;
	private String description;
	private double standardCost;
	private double listCost;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getStandardCost() {
		return standardCost;
	}
	public void setStandardCost(double standardCost) {
		this.standardCost = standardCost;
	}
	public double getListCost() {
		return listCost;
	}
	public void setListCost(double listCost) {
		this.listCost = listCost;
	}
	public ProductPojo(int id) {
		super();
		this.id = id;
	}
	public ProductPojo(int id, double standardCost, double listCost) {
		super();
		this.id = id;
		this.standardCost = standardCost;
		this.listCost = listCost;
	}
	public ProductPojo(String productName, String description, double standardCost, double listCost) {
		super();
		this.productName = productName;
		this.description = description;
		this.standardCost = standardCost;
		this.listCost = listCost;
	}
	@Override
	public String toString() {
		return "ProductPojo [id=" + id + ", productName=" + productName + ", description=" + description
				+ ", standardCost=" + standardCost + ", listCost=" + listCost + "]";
	}
	
	
	
}

	