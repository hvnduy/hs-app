package com.hs.mapp.dao;

import java.sql.SQLException;

import org.springframework.dao.EmptyResultDataAccessException;

import com.hs.mapp.vo.PredictionVO;
import com.mysql.jdbc.exceptions.jdbc4.CommunicationsException;

public interface PredictionDAO {
	PredictionVO getPredictionByDaily(int hs_id, String date, String lgg) throws EmptyResultDataAccessException, SQLException, CommunicationsException;
}
