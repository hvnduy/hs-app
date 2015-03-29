package com.hs.duyhuynh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hs.duyhuynh.dao.UserDAO;
import com.hs.duyhuynh.model.User;
import com.hs.duyhuynh.service.UserService;
@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	UserDAO dao;
	@Override
	public List<User> loginUser(String user_id, String pwd) {
		return dao.getUser(user_id, pwd);
	}

}
