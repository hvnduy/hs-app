package com.hs.mapp.dao;

import java.util.List;

import com.hs.mapp.model.User;

public interface UserDAO {
	List<User> getUser(String user_id, String pwd);
}
