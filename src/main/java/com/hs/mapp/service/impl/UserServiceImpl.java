package com.hs.mapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hs.mapp.dao.UserDAO;
import com.hs.mapp.model.User;
import com.hs.mapp.service.UserService;
@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	UserDAO dao;
	@Override
	public List<User> loginUser(String user_id, String pwd) {
		return dao.getUser(user_id, pwd);
	}

}
