package com.study.charts.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.study.charts.pojo.Option;
import com.study.charts.pojo.Series;
import com.study.charts.pojo.Series.Questype;
import com.study.charts.service.IChartsService;
import com.study.common.page.PageInfo;
import com.study.question.pojo.Question;

@Controller
@RequestMapping("/charts")
public class dataController{

	@Autowired
	private IChartsService chartsService;
	
	@RequestMapping(path="/countmain",method={RequestMethod.GET,RequestMethod.POST})
	public  ModelAndView statistics() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/back/pie");//跳转到饼图
		return mv;
	}
	@RequestMapping(path="/pie",method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Option pie(PageInfo pageInfo,Option option) throws Exception {
		
		//组装数据
		Series series=new Series();
		series.setName("访问来源");
		series.setType("pie");
		series.setRadius("55%");
		
		List<Question> list1 = chartsService.showQuestionByTypeId(1);
		List<Question> list2 = chartsService.showQuestionByTypeId(2);
		List<Question> list3 = chartsService.showQuestionByTypeId(3);
	
		Series.Questype typ1=series.new Questype("1.技术问答:"+list1.size()+"条",list1.size());
		Series.Questype typ2=series.new Questype("2.面试题:"+list3.size()+"条",list2.size());
		Series.Questype typ3=series.new Questype("3.作业问答:"+list2.size()+"条",list3.size());
		series.setData(new Questype[]{typ1,typ2,typ3});
		option.setSeries(series);
		
		return option;
	}
}
