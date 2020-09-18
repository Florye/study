package com.study.user.dao;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.study.common.util.MD5;
import com.study.user.dao.TeacherMapper;
import com.study.user.pojo.Role;
import com.study.user.pojo.Teacher;
import com.study.user.service.UserService;

public class TeacherTest {
	@Test
	public void testQueryTeacherByTeacherNameAndPwd () throws Exception{
		ApplicationContext context=new ClassPathXmlApplicationContext("springmvc.xml");
		TeacherMapper teacherMapper=(TeacherMapper) context.getBean("teacherMapper");
		Teacher teacher=teacherMapper.queryTeacherByTeacherNameAndPwd("adminA", MD5.enctypeMD5("haha123456"));
		System.out.println(teacher);
		Assert.assertTrue(teacher!=null);
		((ClassPathXmlApplicationContext)context).registerShutdownHook();
	}
	@Test
	public void testListAllRole () throws Exception{
		ApplicationContext context=new ClassPathXmlApplicationContext("springmvc.xml");
		UserService userService=(UserService) context.getBean("userServiceImpl");
		List<Role> list=userService.listAllRole();
		Assert.assertTrue(list.size()>0);
		for (Role role : list) {
			System.out.println(role);
		}
		((ClassPathXmlApplicationContext)context).registerShutdownHook();
	}
	@Test
	public void testListAllTeacher () throws Exception{
		ApplicationContext context=new ClassPathXmlApplicationContext("springmvc.xml");
		UserService userService=(UserService) context.getBean("userServiceImpl");
		List<Teacher> list=userService.listAllTeacher();
		Assert.assertTrue(list.size()>0);
		for (Teacher teacher : list) {
			System.out.println(teacher);
		}
		((ClassPathXmlApplicationContext)context).registerShutdownHook();
	}
}
