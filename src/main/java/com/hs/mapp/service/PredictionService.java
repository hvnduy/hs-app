package com.hs.mapp.service;

import java.sql.SQLException;

import org.springframework.dao.EmptyResultDataAccessException;

import com.hs.mapp.vo.PredictionVO;
import com.mysql.jdbc.exceptions.jdbc4.CommunicationsException;

public interface PredictionService {
	PredictionVO getPredictionByDaily(int hs_id, String date, String lgg) throws EmptyResultDataAccessException, SQLException, CommunicationsException;
}
