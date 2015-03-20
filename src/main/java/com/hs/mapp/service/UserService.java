package com.hs.mapp.service;

import java.util.List;

import com.hs.mapp.model.User;


public interface UserService {
	List<User> loginUser(String user_id, String pwd);
}
