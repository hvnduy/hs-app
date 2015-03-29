package com.hs.duyhuynh.dao;

import java.util.List;

import com.hs.duyhuynh.model.User;

public interface UserDAO {
	List<User> getUser(String user_id, String pwd);
}
