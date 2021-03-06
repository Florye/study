package com.study.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.study.question.dao.AnswerMapper;
import com.study.question.dao.QuestionMapper;
import com.study.question.dao.VoteHistoryMapper;
import com.study.question.pojo.Answer;
import com.study.question.pojo.Question;
import com.study.question.pojo.VoteHistory;

@Service
public class QuestionServiceImpl implements IQuestionService{
	@Autowired
	private QuestionMapper questionMapper;
	@Autowired
	private AnswerMapper answerMapper;
	@Autowired
	private VoteHistoryMapper voteHistoryMapper;
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public List<Question> listPageQuestionByTypeId(Integer questiontypeId) {
		return questionMapper.listPageQuestionByTypeId(questiontypeId);
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public List<Answer> listPageAnswerByQuestionId(Integer questionId) {
		return answerMapper.listPageAnswerByQuestionId(questionId);
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public Question selectQuestionByQuestionId(Integer questionId) {
		return questionMapper.selectByPrimaryKey(questionId);
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public boolean addAnswerSelective(Answer answer) {
		Question question=questionMapper.selectByPrimaryKey(answer.getAnswerQuestionid());
		question.setQuestionAnswernum(question.getQuestionAnswernum()+1);
		questionMapper.updateByPrimaryKeySelective(question);
		return answerMapper.insertSelective(answer)>0;
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public boolean addQuestionSelective(Question question) {
		return questionMapper.insertSelective(question)>0;
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public List<Question> listPageQuestionLikeQuestionTitle(String questionTitle,Integer questiontypeId) {
		return questionMapper.listPageQuestionLikeQuestionTitle("%"+questionTitle+"%",questiontypeId);
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public int updateQuestionByPrimaryKeySelective(Question record) {
		return questionMapper.updateByPrimaryKeySelective(record);
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public List<Question> listPageQuestionByAnswernum(Integer questiontypeId) {
		return questionMapper.listPageQuestionByAnswernum(questiontypeId);
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public List<Question> listPageQuestionOrderByViewnum(Integer questiontypeId) {
		return questionMapper.listPageQuestionOrderByViewnum(questiontypeId);
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public Question listPageQuestionOrderByAnswerVote(Integer questiontypeId) {
		return questionMapper.listPageQuestionOrderByAnswerVote(questiontypeId);
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public VoteHistory selectVoteByQuestionIdAndUserId(Integer questionId, Integer userId) {
		return voteHistoryMapper.selectVoteByQuestionIdAndUserId(questionId, userId);
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public VoteHistory selectVoteByAnwserIdAndUserId(Integer anwserId, Integer userId) {
		return voteHistoryMapper.selectVoteByAnwserIdAndUserId(anwserId, userId);
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public int insertSelective(VoteHistory record) {
		return voteHistoryMapper.insertSelective(record);
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public Answer selectAnswerByPrimaryKey(Integer answerId) {
		return answerMapper.selectByPrimaryKey(answerId);
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public int updateAnswerByPrimaryKeySelective(Answer record) {
		return answerMapper.updateByPrimaryKeySelective(record);
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public List<VoteHistory> listAllVote() {
		return voteHistoryMapper.listAllVote();
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public List<Question> listAllQuestion() {
		// TODO Auto-generated method stub
		return questionMapper.listAllQuestion();
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public List<Answer> listAllAnswerByQuestionid(Integer questionId) {
		// TODO Auto-generated method stub
		return answerMapper.listAllAnswerByQuestionid(questionId);
	}
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public boolean deleteQuestionById(Integer questionId) {
		// TODO Auto-generated method stub
		return questionMapper.deleteByPrimaryKey(questionId)>0;
	}
}
