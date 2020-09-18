package com.study.question.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.question.pojo.Answer;
import com.study.question.pojo.Question;
import com.study.question.pojo.VoteHistory;

public interface IQuestionService {
	List<Question> listPageQuestionByTypeId(Integer questiontypeId);
	List<Answer> listPageAnswerByQuestionId(Integer questionId);
	Question selectQuestionByQuestionId(Integer questionId);
	boolean addAnswerSelective(Answer answer);
	boolean addQuestionSelective(Question question);
	List<Question> listPageQuestionLikeQuestionTitle(String questionTitle,Integer questiontypeId);
	int updateQuestionByPrimaryKeySelective(Question record);
	List<Question> listPageQuestionByAnswernum(Integer questiontypeId);
	List<Question> listPageQuestionOrderByViewnum(Integer questiontypeId);
	Question listPageQuestionOrderByAnswerVote(Integer questiontypeId);
	VoteHistory selectVoteByQuestionIdAndUserId(@Param("questionId")Integer questionId,@Param("userId")Integer userId);
	VoteHistory selectVoteByAnwserIdAndUserId(@Param("anwserId")Integer anwserId,@Param("userId")Integer userId);
	int insertSelective(VoteHistory record);
	Answer selectAnswerByPrimaryKey(Integer answerId);
	int updateAnswerByPrimaryKeySelective(Answer record);
	List<VoteHistory> listAllVote();
	List<Question> listAllQuestion();
	List<Answer> listAllAnswerByQuestionid(Integer questionId);
	boolean deleteQuestionById(Integer questionId);
}
