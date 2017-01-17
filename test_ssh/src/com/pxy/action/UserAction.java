package com.pxy.action;

import java.io.ByteArrayInputStream;
import java.util.List;
import java.io.InputStream;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.pxy.model.User;
import com.pxy.service.UserService;
import com.pxy.service.impl.UserServiceImpl;

public class UserAction extends SuperAction{
	private InputStream inputStream;
    public InputStream getInputStream() {
        return inputStream;
    }
	private User user;
	private List<User> users;
	private String status;
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatus() {
		return status;
	}
	// 接收验证码:
	private String checkcode;
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	private UserService userService = new UserServiceImpl();

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public void setuserservice(UserService userservice) {
		this.userService = userservice;
	}


	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	public String userLogin(){
		if(userService.login(user)!=null){
			if(user.getStatus().equals("0")){
				users=userService.list();
				session.setAttribute("loginUser", user);
				return "login_success";
			}else{
				HttpServletRequest request = ServletActionContext.getRequest(); 
				HttpSession session = request.getSession();
				session.setAttribute("loginUserName", user.getUserName());
				session.setAttribute("loginUser", user);
				return "userLogin_success";
			}
		}else
			return "login_failure";
	}
	/*action->service接口->serviceImpl->dao接口->daoImpl*/
	/*public String adminLogin(){
		if(userService.login(user)!=null){
			users=userService.list();
			return "login_success";
		}else
			return "login_failure";
	}
	public String admin_register(){
		userService.register(user);
		return "admin_register_success";
	}*/
	public String register(){
		// 判断验证码程序:
				// 从session中获得验证码的随机值:
				String checkcode1 = (String) ServletActionContext.getRequest()
						.getSession().getAttribute("checkcode");
				if(!checkcode.equalsIgnoreCase(checkcode1)){
					this.addActionError("验证码输入错误!");
					return "checkcodeFail";
				}
		userService.register(user);
		return "register_success";
	}
	public String check() throws Exception {
	 String userName1 = request.getParameter("userName"); 
		User existUser1 = userService.findByUserName(userName1);
		System.out.printf("username1——2",userName1);
		String str = "";
		if(existUser1!=null){
			str="<font color='red'>用户名已经存在</font>";
		}else{
			str="<font color='green'>用户名可以使用</font>";
		}
		inputStream = new ByteArrayInputStream(str.getBytes("UTF-8"));
        return SUCCESS;
    }
	public String edit(){
		Integer ID=Integer.parseInt(request.getParameter("ID"));
		User user=userService.findByID(ID);
		session.setAttribute("edit_user", user);
		return "edit_success";
	}
	public String save(){
		userService.edit(user);
		return "save_success";
	}
	public String list(){
		users=userService.list();
		return "login_success";
	}
	public String delete(){
		Integer  ID = Integer.parseInt(request.getParameter("ID"));
		userService.delete(ID);
		return "delete_success";
	}
	public String registerPage(){
		return "register";
	}
	public String loginPage(){
		return "login";
	}/**
	 * 用户退出的方法
	 */
	public String quit(){
		if(session.getAttribute("loginUserName")!=null){
			session.removeAttribute("loginUserName");
		}
		return "quit";
	}
	public String order(){
		return NONE;
	}
}
