package com.hs.mapp.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.hs.mapp.dao.UserDAO;
import com.hs.mapp.dao.utils.UserUtils;
import com.hs.mapp.model.User;
@Component
public class UserImpl implements UserDAO {

	@Autowired
	private JdbcTemplate template;
	@Override
	public List<User> getUser(String user_id, String pwd) {
		String sql = "SELECT * FROM mobileapp.user";
//		System.out.println(template.);
		List<User> users = template.query(sql, UserUtils.getUserByIdPwd());
		System.out.println(users.size());
		return users;
	}

}
