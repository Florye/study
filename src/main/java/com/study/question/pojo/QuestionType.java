package com.study.question.pojo;

public class QuestionType {
    private Integer questiontypeId;

    private String questiontypeName;
    
    
    public Integer getQuestiontypeId() {
        return questiontypeId;
    }

    @Override
	public String toString() {
		return "QuestionType [questiontypeId=" + questiontypeId + ", questiontypeName=" + questiontypeName + "]";
	}

	public void setQuestiontypeId(Integer questiontypeId) {
        this.questiontypeId = questiontypeId;
    }

    public String getQuestiontypeName() {
        return questiontypeName;
    }

    public void setQuestiontypeName(String questiontypeName) {
        this.questiontypeName = questiontypeName == null ? null : questiontypeName.trim();
    }
}