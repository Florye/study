package com.study.user.service;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.study.user.pojo.Role;
import com.study.user.pojo.Teacher;

public class UserServiceTest {
	@Test
	public void testLogin () throws Exception{
		ApplicationContext context=new ClassPathXmlApplicationContext("springmvc.xml");
		UserService userService=(UserService) context.getBean("userServiceImpl");
		Teacher teacher=userService.login("adminA","123456");
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
}
