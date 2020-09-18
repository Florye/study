package com.study.user.dao;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.study.user.pojo.Role;

public class RoleTest {
	@Test
	public void testQueryRoleAndRightsByRoleId () throws Exception{
		ApplicationContext context=new ClassPathXmlApplicationContext("springmvc.xml");
		RoleMapper roleMapper=(RoleMapper) context.getBean("roleMapper");
		Role role=roleMapper.queryRoleAndRightsByRoleId(1);
		System.out.println(role);
		Assert.assertTrue(role!=null);
		((ClassPathXmlApplicationContext)context).registerShutdownHook();
	}
	@Test
	public void testAddRight() throws Exception{
		ApplicationContext context=new ClassPathXmlApplicationContext("springmvc.xml");
		RoleMapper roleMapper=(RoleMapper) context.getBean("roleMapper");
		roleMapper.addRight(1, 1);
		((ClassPathXmlApplicationContext)context).registerShutdownHook();
	}
	@Test
	public void testRemoveRight() throws Exception{
		ApplicationContext context=new ClassPathXmlApplicationContext("springmvc.xml");
		RoleMapper roleMapper=(RoleMapper) context.getBean("roleMapper");
		roleMapper.removeRight(1, 1);
		((ClassPathXmlApplicationContext)context).registerShutdownHook();
	}
}
