package com.study.question.dao;

import java.util.List;

import com.study.question.pojo.Answer;

public interface AnswerMapper {
    int deleteByPrimaryKey(Integer answerId);

    int insert(Answer record);

    int insertSelective(Answer record);

    Answer selectByPrimaryKey(Integer answerId);

    int updateByPrimaryKeySelective(Answer record);

    int updateByPrimaryKeyWithBLOBs(Answer record);

    int updateByPrimaryKey(Answer record);
    
    List<Answer> listPageAnswerByQuestionId(Integer questionId);
    
    List<Answer> listPageAnswerOrderByVote(Integer questionId);
    
    List<Answer> listAllAnswerByQuestionid(Integer questionId);
}