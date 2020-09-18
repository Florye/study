package com.study.basic.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.study.basic.pojo.Classroom;
import com.study.basic.service.IBasicService;
import com.study.common.page.PageInfo;

@Controller
@RequestMapping("/basic")
public class ClassroomController {
	@Autowired
	private IBasicService basicService;
	@RequestMapping(path="/classroommain",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView classroomMain(PageInfo pageInfo) throws Exception{
		ModelAndView mv=new ModelAndView();
		List<Classroom> list=basicService.listPageClassroom(pageInfo);
		if (list.size()>0) {
			mv.addObject("classroomList", list);
		} else {
			mv.addObject("msg", "当前无数据");
		}
		mv.setViewName("back/classroom");
		return mv;
	}
	@RequestMapping(path="/deleteclassroom",method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody boolean deleteClassroom(@RequestBody Classroom classroom) throws Exception{
		boolean rt=basicService.updateClsroomStatus(classroom);
		return rt;
	}
	@RequestMapping(path="/editclassroom",method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Classroom editClassroom(Integer id) throws Exception{
		Classroom classroom=basicService.queryOneClassroomById(id);
		return classroom;
	}
	@RequestMapping(path="/saveclassroom",method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Classroom saveClassroom(Classroom classroom) throws Exception{
		System.out.println(classroom.getClsroomId());
		if (classroom.getClsroomId() == null) {	
			if (basicService.addClassroom(classroom)) {
				classroom=basicService.selectByClsroomName(classroom.getClsroomName());
				return classroom;
			}
		}
		return basicService.updateClassroom(classroom);
	}
}
