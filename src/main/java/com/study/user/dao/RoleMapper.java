package com.study.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.user.pojo.Role;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer roleId);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer roleId);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    
    List<Role> listAllRole();
    
    Role queryRoleAndRightsByRoleId(Integer roleId);
    // 给某个角色添加一个权限
    void addRight(@Param("roleId") Integer roleId,@Param("rightId") Integer rightId);
    // 给某个角色删除一个权限
    void removeRight(@Param("roleId") Integer roleId,@Param("rightId") Integer rightId);
}