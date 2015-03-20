package com.hs.mapp.ws;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;
import com.hs.mapp.model.Track;
import com.hs.mapp.service.UserService;

@Component
@Path("/payment")
public class Print {

	@Autowired
	private UserService service;
	@Autowired
	private Gson gson;
	
	@GET
	@Path("/mkyong")
	@Produces(MediaType.APPLICATION_JSON + "; charset=UTF-8")
	public Response savePayment() {
		return Response.status(200).entity("Giây phút “cháy” hết mình trên sân khấu khiến không ít ca sĩ gặp những tình huống khó xử như sự cố trang phục, lộ giọng hát yếu").build();

	}
	@POST
	@Path("track/post")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response createTrackInJSON(Track track) {
		System.out.println("===>");
		String result = "Track saved : " + track;
		return Response.status(415).entity(result).build();
		
	}

}