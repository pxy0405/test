package com.pxy.model;

public class User {
	private int ID;
	private String userName;
	private String passWord;
	private String status;
	//邮箱，电话，地址，激活码
/*	private String email;
	private String phone;
	private String address;
	private String code;*/
	public User() {
		super();
	}
	public User(String userName) {
		super();
		this.userName = userName;
	}
	public User(int iD, String userName, String passWord, String status) {
		super();
		ID = iD;
		this.userName = userName;
		this.passWord = passWord;
		this.status = status;
	}
	public User(String userName, String passWord) {
		super();
		this.userName = userName;
		this.passWord = passWord;
	}
	/*public User(int iD, String userName, String passWord, String status,
			String email, String phone, String address, String code) {
		super();
		ID = iD;
		this.userName = userName;
		this.passWord = passWord;
		this.status = status;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.code = code;
	}*/
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	/*public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}*/
	
}
