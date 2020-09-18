package com.study.basic.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Demo {
	public static void main(String[] args) {
		Date d = new Date();// 当前时间
		System.out.println(d);// 默认格式
		SimpleDateFormat s1 = new SimpleDateFormat("yyyy年MM月dd日hh时mm分ss秒");
		// 按照指定的格式讲Data转化为String
		String str = s1.format(d);
		System.out.println(str);
		String source = "2020-08-09 06:05:09";
		s1.applyPattern("yyyy-MM-dd hh:mm:ss");// 重新设置格式
		str = s1.format(d);
		System.out.println(str);
		Date d1 = null;
		try {
			// String->date
			d1 = s1.parse(source);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		source = s1.format(d1);
		System.out.println(source);
		System.out.println(d1);
	}

}
