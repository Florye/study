package com.study.question.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.question.pojo.VoteHistory;

public interface VoteHistoryMapper {
    int deleteByPrimaryKey(Integer historyId);

    int insert(VoteHistory record);

    int insertSelective(VoteHistory record);

    VoteHistory selectByPrimaryKey(Integer historyId);

    int updateByPrimaryKeySelective(VoteHistory record);

    int updateByPrimaryKey(VoteHistory record);
    
    VoteHistory selectVoteByQuestionIdAndUserId(@Param("questionId")Integer questionId,@Param("userId")Integer userId);
    
    VoteHistory selectVoteByAnwserIdAndUserId(@Param("anwserId")Integer anwserId,@Param("userId")Integer userId);

    List<VoteHistory> listAllVote();
}