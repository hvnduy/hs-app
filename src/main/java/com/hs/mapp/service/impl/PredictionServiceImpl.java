package com.hs.mapp.service.impl;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.hs.mapp.dao.PredictionDAO;
import com.hs.mapp.service.PredictionService;
import com.hs.mapp.vo.PredictionVO;
import com.mysql.jdbc.exceptions.jdbc4.CommunicationsException;

@Service
public class PredictionServiceImpl implements PredictionService {

	@Autowired
	private PredictionDAO predictionDAO;
	@Override
	public PredictionVO getPredictionByDaily(int hs_id, String date, String lgg) throws EmptyResultDataAccessException, SQLException, CommunicationsException {
		return predictionDAO.getPredictionByDaily(hs_id, date, lgg);
	}

}
