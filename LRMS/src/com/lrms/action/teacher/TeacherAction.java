package com.lrms.action.teacher;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;
import com.lrms.entity.Teacher;
import com.lrms.entity.User;
import com.lrms.service.TeacherService;

public class TeacherAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 302800222973177652L;
	private int id;
	private Teacher teacher;
	private TeacherService teacherService;
	private String message;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	@JSON(serialize=false)
	public TeacherService getTeacherService() {
		return teacherService;
	}
	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String add(){
		Teacher tc=getTeacherService().findTeacherByNo(getTeacher().getNo());
		if(tc!=null)
		{
			message="�̹����Ѵ��ڣ�";
			return "addFailure";
		}
		
		teacher.setPwd(teacher.getNo());
		System.out.println(teacher.getNo());
		this.getTeacherService().save(teacher);
		message="��ӳɹ���";
		return "addSuccess";
	}
	public String delete(){
		Teacher tc=getTeacherService().findTeacherById(id);
		if(tc==null)
		{
			message="����δ֪���⣡";
			return "deleteFailure";
		}
		this.getTeacherService().delete(tc);
		message="ɾ���ɹ���";
		return "deleteSuccess";
	}
	public String update(){
		Teacher tc=getTeacherService().findTeacherById(id);
		if(tc==null)
		{
			message="����δ֪���⣡";
			return "updateFailure";
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		if(user.getType()==2)
		{
			if(!user.getNo().equals(tc.getNo()))
			{
				message="�޷��޸�������Ϣ��";
				return "updateFailure";
			}
		}
		if(user.getType()==3||user.getNo().equals(tc.getNo()))
		{
			if(teacher.getPwd()!=null&&!teacher.getPwd().trim().equals(""))
				tc.setPwd(teacher.getPwd().trim());
			if(teacher.getName()!=null&&!teacher.getName().trim().equals(""))
				tc.setName(teacher.getName().trim());
			if(teacher.getPhone()!=null&&!teacher.getPhone().trim().equals(""))
				tc.setPhone(teacher.getPhone().trim());
			this.getTeacherService().update(tc);
			user.setName(tc.getName());
			session.setAttribute("user",user);
			message="���³ɹ���";
			return "updateSuccess";
		}
		else
		{
			message="�޷��޸���Ϣ��";
			return "updateFailure";
		}
	}
	public String edit(){
		teacher=getTeacherService().findTeacherById(id);
		return "edit";
	}
}
