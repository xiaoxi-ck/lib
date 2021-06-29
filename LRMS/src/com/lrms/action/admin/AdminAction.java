package com.lrms.action.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;
import com.lrms.entity.Admin;
import com.lrms.entity.User;
import com.lrms.service.AdminService;

@SuppressWarnings("serial")
public class AdminAction extends ActionSupport{
	private int id;
	private Admin admin;
	private String message;
	private AdminService adminService;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	@JSON(serialize=false)
	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	public String add(){
		Admin ad=this.getAdminService().findAdminByNo(getAdmin().getNo());
		if(ad!=null)
		{
			message="����Ա����Ѵ��ڣ�";
			return "addFailure";
		}
		if(admin.getPwd()!=null&&admin.getPwd().trim().equals(""))
			admin.setPwd(admin.getNo());
		this.getAdminService().save(admin);
		message="��ӳɹ���";
		return "addSuccess";
	}
	public String delete(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User user=(User) session.getAttribute("user");
		Admin ad=getAdminService().findAdminById(id);
		if(ad==null)
		{
			message="����δ֪���⣡";
			return "deleteFailure";
		}else if(ad.getNo().equals(user.getNo()))
		{
			message="����ɾ���Լ���";
			return "deleteFailure";
		}
		this.getAdminService().delete(ad);
		message="ɾ���ɹ���";
		return "deleteSuccess";
	}
	public String update(){
		Admin ad=this.getAdminService().findAdminById(id);
		if(ad==null)
		{
			message="����δ֪���⣡";
			return "updateFailure";
		}
		if(admin.getPwd()!=null&&!admin.getPwd().trim().equals(""))
			ad.setPwd(admin.getPwd().trim());
		if(admin.getPhone()!=null&&!admin.getPhone().trim().equals(""))
			ad.setPhone(admin.getPhone().trim());
		if(admin.getName()!=null&&!admin.getName().trim().equals(""))
			ad.setName(admin.getName().trim());
		this.getAdminService().update(ad);
		message="���³ɹ���";
		return "updateSuccess";
	}
	public String edit(){
		admin=getAdminService().findAdminById(id);
		return "edit";
	}
}
