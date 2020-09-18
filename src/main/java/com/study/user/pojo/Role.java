package com.study.user.pojo;

import java.util.List;

public class Role {

	private Integer roleId;

	private String roleName;

	private List<Rights> rightsList;

	@Override
	public String toString() {
		return "Role [roleId=" + roleId + ", roleName=" + roleName + ", rightsList=" + rightsList + "]";
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public List<Rights> getRightsList() {
		return rightsList;
	}

	public void setRightsList(List<Rights> rightsList) {
		this.rightsList = rightsList;
	}

}