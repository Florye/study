package com.study.charts.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.study.common.page.PageInfo;
import com.study.question.dao.QuestionMapper;
import com.study.question.pojo.Question;
@Service
public class ChartsServiceImpl implements IChartsService{

	@Autowired
	private QuestionMapper questionMapper;

	//饼图
	
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public List<Question> showQuestionByTypeId(Integer questionTypeId) {
		// TODO Auto-generated method stub
		return questionMapper.listPageQuestionByTypeId(questionTypeId);
	}
	
}
