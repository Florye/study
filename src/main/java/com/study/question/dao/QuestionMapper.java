package com.study.question.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.question.pojo.Question;

public interface QuestionMapper {
    int deleteByPrimaryKey(Integer questionId);

    int insert(Question record);

    int insertSelective(Question record);

    Question selectByPrimaryKey(Integer questionId);

    int updateByPrimaryKeySelective(Question record);

    int updateByPrimaryKeyWithBLOBs(Question record);

    int updateByPrimaryKey(Question record);
    
    List<Question> listPageQuestionByTypeId(Integer questiontypeId);
    
    List<Question> listPageQuestionLikeQuestionTitle(@Param("questionTitle")String questionTitle,@Param("questiontypeId")Integer questiontypeId);
    
    List<Question> listPageQuestionByAnswernum(Integer questiontypeId);
    
    List<Question> listPageQuestionOrderByViewnum(Integer questiontypeId);
    
    Question listPageQuestionOrderByAnswerVote(Integer questiontypeId);
    
    List<Question> listAllQuestion();
}