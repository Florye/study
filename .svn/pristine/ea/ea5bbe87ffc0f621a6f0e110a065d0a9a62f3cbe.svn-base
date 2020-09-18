package com.study.user.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.study.user.pojo.Role;
import com.study.user.pojo.Teacher;
import com.study.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@RequestMapping(path="/login",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView login(String teacherName, String teacherPwd , HttpSession session) throws Exception{
		ModelAndView mv=new ModelAndView();
		Teacher teacher=userService.login(teacherName, teacherPwd);
		if (teacher != null ) {
			session.setAttribute("teacher", teacher);
			Role role=userService.queryRoleAndRightsByRoleId(teacher.getRole().getRoleId());
			session.setAttribute("rightsList", role.getRightsList());
			mv.setViewName("back/main");
		} else {
			mv.addObject("msg","用户名或密码错误");
			mv.setViewName("back/login");
		}
		return mv;
	}
	@RequestMapping(path="/rolemain",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView roleList(String teacherName, String teacherPwd , HttpSession session) throws Exception{
		ModelAndView mv=new ModelAndView();
		List<Role> list=userService.listAllRole();
		if (list.size()>0) {
			mv.addObject("roleList", list);
		} else {
			mv.addObject("msg", "当前无数据");
		}
		mv.setViewName("back/role");
		return mv;
	}
	@RequestMapping(path="/rolerightmodify/{rid}",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView roleRightModify(@PathVariable("rid") Integer roleId) throws Exception{
		ModelAndView mv=new ModelAndView();
		Role role=userService.queryRoleAndRightsByRoleId(roleId);
		System.out.println(role);
		mv.addObject("role", role);
		mv.setViewName("back/roleedit");
		return mv;
	}
	@RequestMapping(path="/rolerightsave",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView roleRightSave(Integer roleId,@RequestParam(value="rights",required=false)List<Integer> ids) throws Exception{
		ModelAndView mv=new ModelAndView();
		userService.updateRoleRights(roleId, ids);
		mv.setViewName("forward:/user/rolemain");
		return mv;
	}
	@RequestMapping(path="/teachermain",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView teacherMain() throws Exception {
		ModelAndView mv=new ModelAndView();
		List<Teacher> teacherList=userService.listAllTeacher();
		List<Role> roleList=userService.listAllRole();
		if (teacherList.size()>0) {
			mv.addObject("teacherList", teacherList);
			mv.addObject("roleList", roleList);
		} else {
			mv.addObject("msg", "当前无数据");
		}
		mv.setViewName("back/teacher");
		return mv;
	}
	@RequestMapping(path="/editteacher",method={RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Teacher editTeacher(Integer id) throws Exception {
		Teacher teacher=userService.selectTeacherByTeacherId(id);
		return teacher;
	}
	@RequestMapping(path="/saveteacher",method={RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Teacher saveTeacher(Teacher teacher) throws Exception {
		if (teacher.getTeacherId() == null) {//新增
			userService.insertTeacherSelective(teacher);
			return teacher;
		} 
		return userService.updateTeacherSelective(teacher);
	}
	@RequestMapping(path="/deleteteacher",method={RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody boolean deleteTeacher(@RequestBody Teacher teacher) throws Exception {
		return userService.updateTeacherStatus(teacher);
	}
	@RequestMapping(path="/editrole")
	public @ResponseBody Role editRole(Integer id) throws Exception {
		System.out.println(id);
		return userService.queryRoleByRoleId(id);
	}
	@RequestMapping(path="/saverole")
	public @ResponseBody Role saveRole(Role role) throws Exception {
		System.out.println(role);
		
		if (role.getRoleId() == null) {
			return userService.addRole(role);
		}
		return userService.updateRole(role);
	}
	@RequestMapping(path="/deleterole")
	public @ResponseBody boolean deleteRole(Integer id) throws Exception {
		return userService.deleteOneRoleById(id);
	}
}
