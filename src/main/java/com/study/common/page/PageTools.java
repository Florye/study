package com.study.common.page;

//工具类
public class PageTools {
	//计算分页所需的当前区间
	/**
	 * currentPage:当前第几条记录,showCount:每页的显示数量
	 */
	public static Integer calculatePagePeriod(Integer currentPage,Integer showCount){
		System.out.print("当前第"+currentPage+"条记录,每页的显示数量"+showCount+"结果在第");
		return (int)Math.floor((currentPage+showCount-1)/showCount);
	}
	
	public static void main(String[] args) {
		System.out.println(calculatePagePeriod(1,5)+"页");
		System.out.println(calculatePagePeriod(5,5));
		System.out.println(calculatePagePeriod(6,5));
		System.out.println(calculatePagePeriod(10,5));
		System.out.println(calculatePagePeriod(11,5));
		System.out.println(calculatePagePeriod(15,5));
	}
	
}
