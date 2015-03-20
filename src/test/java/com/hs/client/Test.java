package com.hs.client;

import java.util.Locale;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Locale locale = new Locale("vi");
		System.out.println(locale.getCountry());
		System.out.println(locale.getDisplayCountry());
		System.out.println(locale.getLanguage());
		System.out.println(locale.getDisplayLanguage());
		System.out.println(locale.getISO3Country());
		System.out.println(locale.getISO3Language());

	}

}
