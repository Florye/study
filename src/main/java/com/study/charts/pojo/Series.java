package com.study.charts.pojo;

public class Series {
	private String name;
	private String type;
	private String radius;
	private Questype[] data;
	
	public class Questype{
		private String name;
		private Integer value;
		public Questype() {
			super();
		}
		public Questype(String name, Integer value) {
			super();
			this.name = name;
			this.value = value;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public Integer getValue() {
			return value;
		}
		public void setValue(Integer value) {
			this.value = value;
		}
		
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRadius() {
		return radius;
	}

	public void setRadius(String radius) {
		this.radius = radius;
	}

	public Questype[] getData() {
		return data;
	}

	public void setData(Questype[] data) {
		this.data = data;
	}
	
}
