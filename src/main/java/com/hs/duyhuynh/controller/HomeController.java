/*
 * $Id: HomeController.java,v 1.0 2015/03/28 16:08:03  Exp $
 *
 * Copyright (c) 2015 DH
 * All rights reserved.
 *
 * This software is the confidential and proprietary information
 * of DH.
 */
package com.hs.duyhuynh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hs.duyhuynh.common.Pages;

/**
 * Controller for the Home screen.
 * @author HVND
 */
@Controller
public class HomeController {

	/**
	 * Handles any home page case.
	 * @param model
	 *            Attributes set to jsp
	 * @return the tile for the home page
	 */
	@RequestMapping(value = { Pages.HOME_PATH }, method = RequestMethod.GET)
	public String index(ModelMap model) {
		return Pages.HOME_PAGE;
	}
	
	@RequestMapping(value = { Pages.GENERAL_PATH }, method = RequestMethod.GET)
	public String loadGeneralPage(ModelMap model) {
		return Pages.GENERAL_PAGE;
	}
	
	@RequestMapping(value = { Pages.PANELS_PATH }, method = RequestMethod.GET)
	public String loadPanelsPage(ModelMap model) {
		return Pages.PANELS_PAGE;
	}
	
	@RequestMapping(value = { Pages.BUTTONS_PATH }, method = RequestMethod.GET)
	public String loadButtonsPage(ModelMap model) {
		return Pages.BUTTONS_PAGE;
	}
	
	@RequestMapping(value = { Pages.LOGIN_PATH }, method = RequestMethod.GET)
	public String loadLoginPage(ModelMap model) {
		return Pages.LOGIN_PAGE;
	}
	
	@RequestMapping(value = { Pages.LOCK_SCREEN_PATH }, method = RequestMethod.GET)
	public String loadLockScreenPage(ModelMap model) {
		return Pages.LOCK_SCREEN_PAGE;
	}
}
