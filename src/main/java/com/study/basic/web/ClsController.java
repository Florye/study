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
import com.study.basic.pojo.Cls;
import com.study.basic.service.IBasicService;
import com.study.user.pojo.Teacher;
import com.study.user.service.UserService;

@Controller
@RequestMapping("/basic")
public class ClsController {
	@Autowired
	private IBasicService basicService;
	@Autowired
	private UserService userService;
	@RequestMapping(path="/clsmain",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView clsMain() throws Exception{
		ModelAndView mv=new ModelAndView();
		List<Cls> list=basicService.listAllCls();
		if (list.size()>0) {
			List<Teacher> teacherList=userService.listTeacherByRoleId(1);
			List<Teacher> managerList=userService.listTeacherByRoleId(2);
			List<Classroom> classroomList=basicService.listAllClassroom();
			mv.addObject("teacherList", teacherList);
			mv.addObject("managerList", managerList);
			mv.addObject("classroomList", classroomList);
			mv.addObject("clsList", list);
		} else {
			mv.addObject("msg", "当前无数据");
		}
		mv.setViewName("back/cls");
		return mv;
	}
	@RequestMapping(path="/editcls",method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Cls editCls(Integer id) throws Exception{
		Cls cls=basicService.selectByClsId(id);
		return cls;
	}
	@RequestMapping(path="/savecls",method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Cls saveCls(Cls cls) throws Exception{
		if(cls.getClsId() == null){//新增
			if(basicService.addClsSelective(cls)>0) {
				System.out.println(cls);
				return cls;
			}
		}
		return basicService.updateCls(cls);
	}
	@RequestMapping(path="/deletecls",method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody boolean deleteCls(@RequestBody Cls cls) throws Exception{
		System.out.println(cls);
		boolean rt=basicService.updateClsStatus(cls);
		System.out.println(rt);
		return rt;
	}
}
