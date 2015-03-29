package com.hs.duyhuynh.ws;

import java.sql.SQLException;

import javax.ws.rs.DefaultValue;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;
import com.hs.duyhuynh.service.PredictionService;
import com.hs.duyhuynh.service.UserService;
import com.hs.duyhuynh.vo.PredictionVO;
import com.mysql.jdbc.exceptions.jdbc4.CommunicationsException;

@Component
@Path("horo-api/tables")
public class PredictionApi {
	@Autowired
	private UserService service;
	@Autowired
	private PredictionService predictionService;
	@Autowired
	private Gson gson;

	@GET
	@Path("/pre/query/prediction")
	@Produces(MediaType.APPLICATION_JSON + "; charset=UTF-8")
	public Response getPredictionByDaily(@QueryParam("horo_id") int horoId,
			@QueryParam("post_date") String postDate,
			@DefaultValue("en-us") @QueryParam("lgg") String lgg) {
		PredictionVO predictionVO = null;

			try {
				predictionVO = predictionService.getPredictionByDaily(horoId,
						postDate, lgg);
			} catch (EmptyResultDataAccessException e) {
				System.out.println(e.getMessage());
			} catch (CommunicationsException e) {
				System.out.println(e.getMessage());
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
 
		return Response.status(Response.Status.BAD_REQUEST)
				.entity(gson.toJson(predictionVO)).build();
	}
	
}
