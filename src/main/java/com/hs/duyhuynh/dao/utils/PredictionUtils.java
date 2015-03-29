package com.hs.duyhuynh.dao.utils;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.hs.duyhuynh.vo.PredictionVO;

public class PredictionUtils {
	public static RowMapper<PredictionVO> convertToPredictionVORowMapper(){
		RowMapper<PredictionVO> mapper = new RowMapper<PredictionVO>() {
			
			@Override
			public PredictionVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				PredictionVO vo = new PredictionVO();
				vo.setContent(rs.getString("CONTENT"));
				vo.setCompatibleLove(rs.getString("COMPATIBLE_LOVE"));
				vo.setCompatibleFriendship(rs.getString("COMPATIBLE_FRIENDSHIP"));
				vo.setCompatibleCareer(rs.getString("COMPATIBLE_CAREER"));
				vo.setStarLove(rs.getInt("STAR_LOVE"));
				vo.setStarFinance(rs.getInt("STAR_FINANCE"));
				vo.setStarMood(rs.getInt("STAR_MOOD"));
				vo.setStarCareer(rs.getInt("STAR_CAREER"));
				vo.setLuckyNbr(rs.getString("LUCKY_NBR"));
				return vo;
			}
		};
		return mapper;
	}

}
