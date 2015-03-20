package com.hs.mapp.model;

import java.sql.Timestamp;

public class Prediction {
	private int preId;
	private String content;
	private int type;
	private int compatibleLove;
	private int compatibleFriendship;
	private int compatibleCareer;
	private int starLove;
	private int starFinance;
	private int starMood;
	private int starCareer;
	private String luckyNbr;
	private String language;
	private Timestamp postDate;
	private int horoscopeId;
	private String userPost;
	public int getPreId() {
		return preId;
	}
	public void setPreId(int preId) {
		this.preId = preId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getCompatibleLove() {
		return compatibleLove;
	}
	public void setCompatibleLove(int compatibleLove) {
		this.compatibleLove = compatibleLove;
	}
	public int getCompatibleFriendship() {
		return compatibleFriendship;
	}
	public void setCompatibleFriendship(int compatibleFriendship) {
		this.compatibleFriendship = compatibleFriendship;
	}
	public int getCompatibleCareer() {
		return compatibleCareer;
	}
	public void setCompatibleCareer(int compatibleCareer) {
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
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public Timestamp getPostDate() {
		return postDate;
	}
	public void setPostDate(Timestamp postDate) {
		this.postDate = postDate;
	}
	public int getHoroscopeId() {
		return horoscopeId;
	}
	public void setHoroscopeId(int horoscopeId) {
		this.horoscopeId = horoscopeId;
	}
	public String getUserPost() {
		return userPost;
	}
	public void setUserPost(String userPost) {
		this.userPost = userPost;
	}
}
