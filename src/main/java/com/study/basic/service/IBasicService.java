package com.study.basic.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.basic.pojo.Classroom;
import com.study.basic.pojo.Cls;
import com.study.basic.pojo.UserInfo;
import com.study.common.page.PageInfo;

public interface IBasicService {
	List<Classroom> listAllClassroom();
	
	List<Classroom> listPageClassroom(PageInfo pageInfo);
	
	boolean updateClsroomStatus(Classroom record);
	
	Classroom queryOneClassroomById(Integer clsroomId);
	
	Classroom updateClassroom(Classroom record);
	
	boolean addClassroom(Classroom record);
	
	Classroom selectByClsroomName(String clsroomName);
	
	List<Cls> listAllCls();
	
	Cls selectByClsId(Integer clsId);
	
	Cls updateCls(Cls cls);
	
	boolean updateClsStatus(Cls cls);
	
	int addClsSelective(Cls cls);
	
	List<UserInfo> listAllUserInfo();
	
	UserInfo selectByPrimaryKey(Integer userId);
	
	UserInfo updateUserInfo(UserInfo userInfo);
	
	int addUserInfoSelective(UserInfo userInfo);
	
	boolean updateUserStatus(UserInfo userInfo);
	
	UserInfo queryUserByNameAndPwd(String userLogin,String userPasswd);
	
	boolean updateUserPwd(UserInfo userInfo);
}
