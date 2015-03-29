package com.hs.duyhuynh.common;

public class SQLConstant {
	public static String GET_PREDICTION_BY_DAILY = "SELECT content, (SELECT horoscope_name FROM mobileapp.horoscope t2 where t2.horoscope_id = t1.compatible_love AND t2.language = :language) compatible_love,(SELECT horoscope_name FROM mobileapp.horoscope t2 where t2.horoscope_id = t1.compatible_friendship AND t2.language = :language) compatible_friendship,(SELECT horoscope_name FROM mobileapp.horoscope t2 where t2.horoscope_id = t1.compatible_career AND t2.language = :language) compatible_career,t1.star_love, t1.star_finance, t1.star_mood, t1.star_career, lucky_nbr FROM mobileapp.prediction t1 WHERE t1.horoscope_id = :horoscope_id AND t1.language=:language AND date(t1.post_date)= :post_date AND t1.type=1";
}
