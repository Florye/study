package com.study.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.user.pojo.Teacher;

public interface TeacherMapper {
    int deleteByPrimaryKey(Integer teacherId);

    int insert(Teacher record);

    int insertSelective(Teacher record);

    Teacher selectByPrimaryKey(Integer teacherId);

    int updateByPrimaryKeySelective(Teacher record);

    int updateByPrimaryKey(Teacher record);
    
    Teacher queryTeacherByTeacherNameAndPwd(@Param(value="teacherName")String teacherName,@Param(value="teacherPwd")String teacherPwd);
    
    List<Teacher> listTeacherByRoleId(Integer roleId);
    
    List<Teacher> listAllTeacher();
    
    
}