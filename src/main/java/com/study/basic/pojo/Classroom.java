package com.study.basic.pojo;

import java.io.Serializable;

public class Classroom implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer clsroomId;

    private String clsroomName;

    private Integer clsroomStatus;

    public Integer getClsroomId() {
        return clsroomId;
    }

    public void setClsroomId(Integer clsroomId) {
        this.clsroomId = clsroomId;
    }

    public String getClsroomName() {
        return clsroomName;
    }

    public void setClsroomName(String clsroomName) {
        this.clsroomName = clsroomName == null ? null : clsroomName.trim();
    }

    public Integer getClsroomStatus() {
        return clsroomStatus;
    }

    public void setClsroomStatus(Integer clsroomStatus) {
        this.clsroomStatus = clsroomStatus;
    }

	@Override
	public String toString() {
		return "Classroom [clsroomId=" + clsroomId + ", clsroomName=" + clsroomName + ", clsroomStatus=" + clsroomStatus
				+ "]";
	}
    
}