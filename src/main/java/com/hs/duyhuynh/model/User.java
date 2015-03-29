package com.hs.duyhuynh.model;


public class User {
	private String user_id;
	private String pwd;
	private boolean isAdmin;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public boolean isAdmin() {
		return isAdmin;
	}
	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
/*	@Override
	public String toString() {
		return "User[user_id="+user_id+ ", pwd="+pwd+"]";
	}*/

}
