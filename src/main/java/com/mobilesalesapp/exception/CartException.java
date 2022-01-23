package com.mobilesalesapp.exception;

public class CartException extends Exception {

	private static final long serialVersionUID = 1L;

	public String cartSame() {
		
		return "Already Item is Cart";
	}
}
