package com.hs.duyhuynh.vo;

import java.sql.Timestamp;

public class PredictionVO {
	private String content;
	private String compatibleLove;
	private String compatibleFriendship;
	private String compatibleCareer;
	private int starLove;
	private int starFinance;
	private int starMood;
	private int starCareer;
	private String luckyNbr;
//	private int horoscopeId;

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getCompatibleLove() {
		return compatibleLove;
	}
	public void setCompatibleLove(String compatibleLove) {
		this.compatibleLove = compatibleLove;
	}
	public String getCompatibleFriendship() {
		return compatibleFriendship;
	}
	public void setCompatibleFriendship(String compatibleFriendship) {
		this.compatibleFriendship = compatibleFriendship;
	}
	public String getCompatibleCareer() {
		return compatibleCareer;
	}
	public void setCompatibleCareer(String compatibleCareer) {
		this.compatibleCareer = compatibleCareer;
	}
	public int getStarLove() {
		return starLove;
	}
	public void setStarLove(int starLove) {
		this.starLove = starLove;
	}
	public int getStarFinance() {
		return starFinance;
	}
	public void setStarFinance(int starFinance) {
		this.starFinance = starFinance;
	}
	public int getStarMood() {
		return starMood;
	}
	public void setStarMood(int starMood) {
		this.starMood = starMood;
	}
	public int getStarCareer() {
		return starCareer;
	}
	public void setStarCareer(int starCareer) {
		this.starCareer = starCareer;
	}
	public String getLuckyNbr() {
		return luckyNbr;
	}
	public void setLuckyNbr(String luckyNbr) {
		this.luckyNbr = luckyNbr;
	}
	
}
