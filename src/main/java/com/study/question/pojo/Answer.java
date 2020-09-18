package com.study.question.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.study.basic.pojo.UserInfo;
@JsonIgnoreProperties(value = { "handler" })
public class Answer {
    private Integer answerId;

    private Integer answerQuestionid;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date answerCreatetime;

    private UserInfo userInfo;

    private Integer answerVote;

    private Integer answerStatus;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date answerModified;

    private String answerContent;

	public Integer getAnswerId() {
		return answerId;
	}

	public void setAnswerId(Integer answerId) {
		this.answerId = answerId;
	}

	public Integer getAnswerQuestionid() {
		return answerQuestionid;
	}

	public void setAnswerQuestionid(Integer answerQuestionid) {
		this.answerQuestionid = answerQuestionid;
	}

	public Date getAnswerCreatetime() {
		return answerCreatetime;
	}

	public void setAnswerCreatetime(Date answerCreatetime) {
		this.answerCreatetime = answerCreatetime;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public Integer getAnswerVote() {
		return answerVote;
	}

	public void setAnswerVote(Integer answerVote) {
		this.answerVote = answerVote;
	}

	public Integer getAnswerStatus() {
		return answerStatus;
	}

	public void setAnswerStatus(Integer answerStatus) {
		this.answerStatus = answerStatus;
	}

	public Date getAnswerModified() {
		return answerModified;
	}

	public void setAnswerModified(Date answerModified) {
		this.answerModified = answerModified;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	@Override
	public String toString() {
		return "Answer [answerId=" + answerId + ", answerQuestionid=" + answerQuestionid + ", answerCreatetime="
				+ answerCreatetime + ", userInfo=" + userInfo + ", answerVote=" + answerVote + ", answerStatus="
				+ answerStatus + ", answerModified=" + answerModified + ", answerContent=" + answerContent + "]";
	}

}