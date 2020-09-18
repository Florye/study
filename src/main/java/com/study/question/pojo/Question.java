package com.study.question.pojo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.study.basic.pojo.UserInfo;
@JsonIgnoreProperties(value = { "handler" })
public class Question {
    private Integer questionId;

    private String questionTitle;

    private QuestionType questionType;

    private String questionTag1;

    private String questionTag2;

    private String questionTag3;

    private UserInfo userInfo;

    private Integer questionVotenum;

    private Integer questionAnswernum;

    private Integer questionViewnum;

    private Integer questionStatus;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date questionCreatetime;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date questionModified;

    private String questionContent;
    
    private List<Answer> answerList;

	public Integer getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public QuestionType getQuestionType() {
		return questionType;
	}

	public void setQuestionType(QuestionType questionType) {
		this.questionType = questionType;
	}

	public String getQuestionTag1() {
		return questionTag1;
	}

	public void setQuestionTag1(String questionTag1) {
		this.questionTag1 = questionTag1;
	}

	public String getQuestionTag2() {
		return questionTag2;
	}

	public void setQuestionTag2(String questionTag2) {
		this.questionTag2 = questionTag2;
	}

	public String getQuestionTag3() {
		return questionTag3;
	}

	public void setQuestionTag3(String questionTag3) {
		this.questionTag3 = questionTag3;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public Integer getQuestionVotenum() {
		return questionVotenum;
	}

	public void setQuestionVotenum(Integer questionVotenum) {
		this.questionVotenum = questionVotenum;
	}

	public Integer getQuestionAnswernum() {
		return questionAnswernum;
	}

	public void setQuestionAnswernum(Integer questionAnswernum) {
		this.questionAnswernum = questionAnswernum;
	}

	public Integer getQuestionViewnum() {
		return questionViewnum;
	}

	public void setQuestionViewnum(Integer questionViewnum) {
		this.questionViewnum = questionViewnum;
	}

	public Integer getQuestionStatus() {
		return questionStatus;
	}

	public void setQuestionStatus(Integer questionStatus) {
		this.questionStatus = questionStatus;
	}

	public Date getQuestionCreatetime() {
		return questionCreatetime;
	}

	public void setQuestionCreatetime(Date questionCreatetime) {
		this.questionCreatetime = questionCreatetime;
	}

	public Date getQuestionModified() {
		return questionModified;
	}

	public void setQuestionModified(Date questionModified) {
		this.questionModified = questionModified;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public List<Answer> getAnswerList() {
		return answerList;
	}

	public void setAnswerList(List<Answer> answerList) {
		this.answerList = answerList;
	}

	@Override
	public String toString() {
		return "Question [questionId=" + questionId + ", questionTitle=" + questionTitle + ", questionType="
				+ questionType + ", questionTag1=" + questionTag1 + ", questionTag2=" + questionTag2 + ", questionTag3="
				+ questionTag3 + ", userInfo=" + userInfo + ", questionVotenum=" + questionVotenum
				+ ", questionAnswernum=" + questionAnswernum + ", questionViewnum=" + questionViewnum
				+ ", questionStatus=" + questionStatus + ", questionCreatetime=" + questionCreatetime
				+ ", questionModified=" + questionModified + ", questionContent=" + questionContent + ", answerList="
				+ answerList + "]";
	}
}