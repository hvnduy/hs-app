package com.hs.mapp.dao.utils;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.hs.mapp.model.User;

public class UserUtils {
	public static RowMapper<User> getUserByIdPwd(){
		RowMapper<User> mapper = new RowMapper<User>() {
			
			@Override
			public User mapRow(ResultSet rs, int i) throws SQLException {
				User user = new User();
				user.setUser_id(rs.getString(1));
				user.setPwd(rs.getString(2));
				return user;
			}
		};
		return mapper;
		
	}

}
