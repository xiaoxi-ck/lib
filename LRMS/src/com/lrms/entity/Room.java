package com.lrms.entity;

/**
 * @author songyx
 *
 */
public class Room {
	private int id;
	private int stuNum;        //��������
	private String name;       //����
	private String location;   //λ��
	private String remark;     //��ע
	private int state;         //״̬      �ǳ־û��ֶΣ����ݿ����û������ֶ�
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getStuNum() {
		return stuNum;
	}
	public void setStuNum(int stuNum) {
		this.stuNum = stuNum;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
}
