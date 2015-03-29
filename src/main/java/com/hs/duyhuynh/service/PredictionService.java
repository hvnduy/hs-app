package com.hs.duyhuynh.service;

import java.sql.SQLException;

import org.springframework.dao.EmptyResultDataAccessException;

import com.hs.duyhuynh.vo.PredictionVO;
import com.mysql.jdbc.exceptions.jdbc4.CommunicationsException;

public interface PredictionService {
	PredictionVO getPredictionByDaily(int hs_id, String date, String lgg) throws EmptyResultDataAccessException, SQLException, CommunicationsException;
}
