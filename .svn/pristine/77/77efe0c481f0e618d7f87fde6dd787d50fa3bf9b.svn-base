package com.study.basic.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.study.basic.dao.ClassroomMapper;
import com.study.basic.dao.ClsMapper;
import com.study.basic.dao.UserInfoMapper;
import com.study.basic.pojo.Classroom;
import com.study.basic.pojo.Cls;
import com.study.basic.pojo.UserInfo;
import com.study.common.page.PageInfo;
import com.study.common.util.MD5;

@Service
public class BasicServiceImpl implements IBasicService {
	@Autowired
	private ClassroomMapper classroomMapper;
	@Autowired
	private ClsMapper clsMapper;
	@Autowired
	private UserInfoMapper userInfoMapper;
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public List<Classroom> listPageClassroom(PageInfo pageInfo) {
		return classroomMapper.listPageClassroom(pageInfo);
	}
	@Override
	public List<Classroom> listAllClassroom() {
		// TODO Auto-generated method stub
		return classroomMapper.listAllClassroom();
	}
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public boolean updateClsroomStatus(Classroom record) {
		return classroomMapper.updateByPrimaryKeySelective(record) > 0;
	}

	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public Classroom queryOneClassroomById(Integer clsroomId) {
		return classroomMapper.selectByPrimaryKey(clsroomId);
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public Classroom updateClassroom(Classroom record) {
		Classroom classroom=null;
		if (classroomMapper.updateByPrimaryKeySelective(record)>0) {
			classroom=classroomMapper.selectByPrimaryKey(record.getClsroomId());
		}
		return classroom;
	}
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public boolean addClassroom(Classroom record) {
		return classroomMapper.insertSelective(record)>0;
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public Classroom selectByClsroomName(String clsroomName) {
		return classroomMapper.selectByClsroomName(clsroomName);
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	@Override
	public List<Cls> listAllCls() {
		// TODO Auto-generated method stub
		return clsMapper.listAllCls();
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public Cls selectByClsId(Integer clsId) {
		// TODO Auto-generated method stub
		return clsMapper.selectByPrimaryKey(clsId);
	}
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public Cls updateCls(Cls cls) {
		Cls cls2=null;
		if (clsMapper.updateByPrimaryKeySelective(cls)>0) {
			cls2=clsMapper.selectByPrimaryKey(cls.getClsId());
		}
		return cls2;
	}
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public boolean updateClsStatus(Cls cls) {
		return clsMapper.updateByPrimaryKeySelective(cls)>0;
	}
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public int addClsSelective(Cls cls) {
		return clsMapper.insertSelective(cls);
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public List<UserInfo> listAllUserInfo() {
		return userInfoMapper.listAllUserInfo();
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public UserInfo selectByPrimaryKey(Integer userId) {
		return userInfoMapper.selectByPrimaryKey(userId);
	}
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public UserInfo updateUserInfo(UserInfo userInfo) {
		UserInfo user=null;
		System.out.println(userInfoMapper.selectByPrimaryKey(userInfo.getUserId()).getUserModified());
		System.out.println(userInfo.getUserModified());
		if (userInfoMapper.selectByPrimaryKey(userInfo.getUserId()).getUserModified().equals(userInfo.getUserModified())) {
			System.out.println(true);
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date=sdf.format(new Date());
			System.out.println(date);
			Date newDate=null;
			try {
				newDate = sdf.parse(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			userInfo.setUserModified(newDate);
			if (userInfoMapper.updateByPrimaryKeySelective(userInfo)>0) {
				user=userInfoMapper.selectByPrimaryKey(userInfo.getUserId());
			}
		}
		return user;
	}
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public int addUserInfoSelective(UserInfo userInfo) {
		return userInfoMapper.insertSelective(userInfo);
	}
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public boolean updateUserStatus(UserInfo userInfo) {
		return userInfoMapper.updateByPrimaryKeySelective(userInfo)>0;
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public UserInfo queryUserByNameAndPwd(String userLogin, String userPasswd) {
		return userInfoMapper.queryUserByNameAndPwd(userLogin, MD5.enctypeMD5("haha"+userPasswd));
	}
	@Override
	public boolean updateUserPwd(UserInfo userInfo) {
		return userInfoMapper.updateByPrimaryKeySelective(userInfo)>0;
	}
}
