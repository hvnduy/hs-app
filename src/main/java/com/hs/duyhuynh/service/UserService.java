package com.hs.duyhuynh.service;

import java.util.List;

import com.hs.duyhuynh.model.User;


public interface UserService {
	List<User> loginUser(String user_id, String pwd);
}
