package com.study.basic.pojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.study.user.pojo.Teacher;
@JsonIgnoreProperties(value = { "handler" })
public class Cls {
	private Integer clsId;

	private String clsName;

	private Teacher teacher;

	private Teacher manager;

	private Classroom classroom;

	private Integer clsStatus;

	public Integer getClsId() {
		return clsId;
	}

	public void setClsId(Integer clsId) {
		this.clsId = clsId;
	}

	public String getClsName() {
		return clsName;
	}

	public void setClsName(String clsName) {
		this.clsName = clsName;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public Teacher getManager() {
		return manager;
	}

	public void setManager(Teacher manager) {
		this.manager = manager;
	}

	public Classroom getClassroom() {
		return classroom;
	}

	public void setClassroom(Classroom classroom) {
		this.classroom = classroom;
	}

	public Integer getClsStatus() {
		return clsStatus;
	}

	public void setClsStatus(Integer clsStatus) {
		this.clsStatus = clsStatus;
	}

	@Override
	public String toString() {
		return "Cls [clsId=" + clsId + ", clsName=" + clsName + ", teacher=" + teacher + ", manager=" + manager
				+ ", classroom=" + classroom + ", clsStatus=" + clsStatus + "]";
	}

	

   
}