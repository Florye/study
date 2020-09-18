package com.study.charts.service;

import java.util.List;

import com.study.common.page.PageInfo;
import com.study.question.pojo.Question;

public interface IChartsService {

	List<Question> showQuestionByTypeId(Integer questionTypeId);//查询数量
}
