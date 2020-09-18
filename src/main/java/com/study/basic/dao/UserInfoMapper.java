package com.study.basic.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.converter.StringHttpMessageConverter;

import com.study.basic.pojo.UserInfo;

public interface UserInfoMapper{
    int deleteByPrimaryKey(Integer userId);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);
    
    List<UserInfo> listAllUserInfo();
    
    UserInfo queryUserByNameAndPwd(@Param("userLogin") String userLogin,@Param("userPasswd")String userPasswd);
}