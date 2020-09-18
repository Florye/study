package com.study.question.dao;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.study.question.pojo.Question;

public class QuestionTest {
	@Test
	public void testQueryQuestionByQuestionId () throws Exception{
		ApplicationContext context=new ClassPathXmlApplicationContext("springmvc.xml");
		QuestionMapper questionMapper=(QuestionMapper) context.getBean("questionMapper");
		Question question=questionMapper.selectByPrimaryKey(1);
		System.out.println("-------------"+question);
		Assert.assertTrue(question!=null);
		((ClassPathXmlApplicationContext)context).registerShutdownHook();
	}
}
