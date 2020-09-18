package com.study.user.pojo;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
@JsonIgnoreProperties(value = { "handler" })
public class Teacher implements Serializable{
	public Integer getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getTeacherPwd() {
		return teacherPwd;
	}

	public void setTeacherPwd(String teacherPwd) {
		this.teacherPwd = teacherPwd;
	}

	public String getTeacherNickname() {
		return teacherNickname;
	}

	public void setTeacherNickname(String teacherNickname) {
		this.teacherNickname = teacherNickname;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Integer getTeacherStatus() {
		return teacherStatus;
	}

	public void setTeacherStatus(Integer teacherStatus) {
		this.teacherStatus = teacherStatus;
	}

	private Integer teacherId;

    private String teacherName;

    private String teacherPwd;

    private String teacherNickname;

    private Role role;

    private Integer teacherStatus;

	@Override
	public String toString() {
		return "Teacher [teacherId=" + teacherId + ", teacherName=" + teacherName + ", teacherPwd=" + teacherPwd
				+ ", teacherNickname=" + teacherNickname + ", role=" + role + ", teacherStatus=" + teacherStatus + "]";
	}
	
}