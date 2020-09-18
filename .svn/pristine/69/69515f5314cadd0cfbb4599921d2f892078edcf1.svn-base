package com.study.user.service;

import java.util.List;

import com.study.user.pojo.Role;
import com.study.user.pojo.Teacher;

public interface UserService {
	Teacher login(String teacherName, String teacherPwd);

	List<Role> listAllRole();

	Role queryRoleAndRightsByRoleId(Integer roleId);

	void updateRoleRights(Integer roleId, List<Integer> newList);

	List<Teacher> listTeacherByRoleId(Integer roleId);

	List<Teacher> listAllTeacher();
	
	Teacher selectTeacherByTeacherId(Integer teacherId);
	
	Teacher updateTeacherSelective(Teacher teacher);
	
	boolean updateTeacherStatus(Teacher teacher);
	
	Teacher insertTeacherSelective(Teacher teacher);
	
	Role queryRoleByRoleId(Integer roleId);
	
	Role updateRole(Role role);
	
	boolean deleteOneRoleById(Integer id);
	
	Role addRole(Role role);
}
