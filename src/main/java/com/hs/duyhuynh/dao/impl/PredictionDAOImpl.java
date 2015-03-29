package com.hs.duyhuynh.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import com.hs.duyhuynh.common.SQLConstant;
import com.hs.duyhuynh.dao.PredictionDAO;
import com.hs.duyhuynh.dao.utils.PredictionUtils;
import com.hs.duyhuynh.vo.PredictionVO;
import com.mysql.jdbc.exceptions.jdbc4.CommunicationsException;

@Component
public class PredictionDAOImpl implements PredictionDAO {

	@Autowired
	NamedParameterJdbcTemplate parameterJdbcTemplate;

	@Override
	public PredictionVO getPredictionByDaily(int hs_id, String date, String lgg) throws EmptyResultDataAccessException, SQLException, CommunicationsException{
		String sql = SQLConstant.GET_PREDICTION_BY_DAILY;
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("horoscope_id", String.valueOf(hs_id));
		parameters.put("language", lgg);
		parameters.put("post_date", date);
		return parameterJdbcTemplate.queryForObject(sql, parameters,
				PredictionUtils.convertToPredictionVORowMapper());
	}

}
