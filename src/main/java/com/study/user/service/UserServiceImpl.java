package com.study.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.study.common.util.MD5;
import com.study.user.dao.RoleMapper;
import com.study.user.dao.TeacherMapper;
import com.study.user.pojo.Rights;
import com.study.user.pojo.Role;
import com.study.user.pojo.Teacher;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private TeacherMapper teacherMapper;
	@Autowired
	private RoleMapper roleMapper;

	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public Teacher login(String teacherName, String teacherPwd) {
		return teacherMapper.queryTeacherByTeacherNameAndPwd(teacherName, MD5.enctypeMD5("haha" + teacherPwd));
	}

	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public List<Role> listAllRole() {
		return roleMapper.listAllRole();
	}

	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public Role queryRoleAndRightsByRoleId(Integer roleId) {
		return roleMapper.queryRoleAndRightsByRoleId(roleId);
	}

	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public void updateRoleRights(Integer roleId, List<Integer> newList) {
		// 老权限
		Role role = roleMapper.queryRoleAndRightsByRoleId(roleId);
		List<Rights> oldList = role.getRightsList();
		// 新权限为空,删除所有权限
		if (newList == null && oldList.size() > 0) {
			for (Rights right : oldList) {
				roleMapper.removeRight(roleId, right.getRightId());
			}
		}
		// 老权限size=0,直接添加权限
		if (newList != null && oldList.size() == 0) {
			for (Integer rightId : newList) {
				roleMapper.addRight(roleId, rightId);
			}
		}
		// 新老都有
		if (newList != null && oldList.size() > 0) {
			// 删除新权限中不存在的元权限
			for (Rights right : oldList) {
				System.out.println(newList.contains(right.getRightId()));
				if (!newList.contains(right.getRightId())) {
					roleMapper.removeRight(roleId, right.getRightId());
				}
			}
			// 添加新增加的新权限
			for (Integer rightId : newList) {
				Rights newright=new Rights();
				newright.setRightId(rightId);
				// 老的里面不包含新的,需添加
				if(!oldList.contains(newright)) {
					roleMapper.addRight(roleId, rightId);
				}
				
			}
		}
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public List<Teacher> listTeacherByRoleId(Integer roleId) {
		return teacherMapper.listTeacherByRoleId(roleId);
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public List<Teacher> listAllTeacher() {
		return teacherMapper.listAllTeacher();
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public Teacher selectTeacherByTeacherId(Integer teacherId) {
		return teacherMapper.selectByPrimaryKey(teacherId);
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public Teacher updateTeacherSelective(Teacher teacher) {
		teacher.setTeacherPwd(MD5.enctypeMD5("haha"+teacher.getTeacherPwd()));
		Teacher teacher2=null;
			if (teacherMapper.updateByPrimaryKeySelective(teacher)>0) {
				teacher2=teacherMapper.selectByPrimaryKey(teacher.getTeacherId());
			}
		return teacher2;
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public boolean updateTeacherStatus(Teacher teacher) {
		return teacherMapper.updateByPrimaryKeySelective(teacher)>0;
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public Teacher insertTeacherSelective(Teacher teacher) {
		if (teacherMapper.insertSelective(teacher)>0) {
			return teacher;
		} else {
			return null;
		}
		
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, readOnly = true)
	public Role queryRoleByRoleId(Integer roleId) {
		return roleMapper.selectByPrimaryKey(roleId);
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public Role updateRole(Role role) {
		Role newRole=null;
		if (roleMapper.updateByPrimaryKeySelective(role)>0) {
			newRole=roleMapper.selectByPrimaryKey(role.getRoleId());
		}
		return newRole;
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public boolean deleteOneRoleById(Integer id) {
		return roleMapper.deleteByPrimaryKey(id)>0;
	}
	@Transactional(propagation = Propagation.SUPPORTS, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public Role addRole(Role role) {
		Role newRole=null;
		if (roleMapper.insertSelective(role)>0) {
			newRole=role;
		}
		return newRole;
	}
}
