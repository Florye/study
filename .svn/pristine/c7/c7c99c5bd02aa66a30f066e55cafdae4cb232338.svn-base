package com.study.basic.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.basic.pojo.Classroom;
import com.study.common.page.PageInfo;

public interface ClassroomMapper {
    int deleteByPrimaryKey(Integer clsroomId);

    int insert(Classroom record);

    int insertSelective(Classroom record);

    Classroom selectByPrimaryKey(Integer clsroomId);
   
    int updateByPrimaryKeySelective(Classroom record);

    int updateByPrimaryKey(Classroom record);
    List<Classroom> listAllClassroom();
    // 分页方法名字必须以listPage开头,传入PageInfo作为形参
    List<Classroom> listPageClassroom(@Param("pageInfo") PageInfo pageInfo);
    
    Classroom selectByClsroomName(String clsroomName);
}