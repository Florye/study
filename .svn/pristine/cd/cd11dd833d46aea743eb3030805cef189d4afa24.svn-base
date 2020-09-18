package com.study.basic.service;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.study.basic.pojo.Classroom;
import com.study.basic.pojo.Cls;
import com.study.basic.pojo.UserInfo;

public class TestBasicServiceImpl {
	@Test
	public void testListAllClassroom () throws Exception{
		ApplicationContext context=new ClassPathXmlApplicationContext("springmvc.xml");
		IBasicService basicService=(IBasicService) context.getBean("basicServiceImpl");
		List<Classroom> list=basicService.listAllClassroom ();
		Assert.assertTrue(list.size()>0);
		for (Classroom classroom:list) {
			System.out.println(classroom);
		}
		((ClassPathXmlApplicationContext)context).registerShutdownHook();
	}
	@Test
	public void testListAllCls () throws Exception{
		ApplicationContext context=new ClassPathXmlApplicationContext("springmvc.xml");
		IBasicService basicService=(IBasicService) context.getBean("basicServiceImpl");
		List<Cls> list=basicService.listAllCls ();
		Assert.assertTrue(list.size()>0);
		for (Cls cls:list) {
			System.out.println(cls);
		}
		((ClassPathXmlApplicationContext)context).registerShutdownHook();
	}
	@Test
	public void testUpdateClsStatus () throws Exception{
		ApplicationContext context=new ClassPathXmlApplicationContext("springmvc.xml");
		IBasicService basicService=(IBasicService) context.getBean("basicServiceImpl");
		Cls cls=new Cls();
		cls.setClsId(1);
		cls.setClsStatus(0);
		Assert.assertTrue(basicService.updateClsStatus(cls));
		((ClassPathXmlApplicationContext)context).registerShutdownHook();
	}
	@Test
	public void testAddClsSelective () throws Exception{
		ApplicationContext context=new ClassPathXmlApplicationContext("springmvc.xml");
		IBasicService basicService=(IBasicService) context.getBean("basicServiceImpl");
		Cls cls=new Cls();
		cls.setClsName("154");
		cls.setClsStatus(1);
		Assert.assertTrue(basicService.addClsSelective(cls)>0);
		System.out.println(cls.getClsId());
		((ClassPathXmlApplicationContext)context).registerShutdownHook();
	}
	@Test
	public void testListAllUserInfo () throws Exception{
		ApplicationContext context=new ClassPathXmlApplicationContext("springmvc.xml");
		IBasicService basicService=(IBasicService) context.getBean("basicServiceImpl");
		List<UserInfo> list=basicService.listAllUserInfo ();
		Assert.assertTrue(list.size()>0);
		for (UserInfo userInfo:list) {
			System.out.println(userInfo);
		}
		((ClassPathXmlApplicationContext)context).registerShutdownHook();
	}
}
