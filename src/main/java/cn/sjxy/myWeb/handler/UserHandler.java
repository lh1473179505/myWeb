package cn.sjxy.myWeb.handler;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.sjxy.myWeb.domain.User;
import cn.sjxy.myWeb.service.UserService;

@Controller
public class UserHandler {

	@Autowired
	private UserService userService;

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(User user,HttpServletRequest request,HttpSession session) {
		String msg="";
		String adminName=request.getParameter("adminName");
		String adminPwd=request.getParameter("adminPwd");
		
		user.setAdminName(adminName);
		user.setAdminPwd(adminPwd);
		User user1=userService.adminLogin(user);
		if(user1==null) {
			msg="用户名或密码错误";
			 request.setAttribute("msg",msg);
			 request.setAttribute("url","admin/login.jsp");
			
		}else {
			msg="登录成功";
			session.setAttribute("AdminName", user1.getAdminName());
			userService.updateUser(user1);
			 request.setAttribute("msg",msg);
			 request.setAttribute("url","admin/includeAdmin.jsp");
		}
		return "forward/forward";
	}
	
	@RequestMapping(value="/logout")
	public  String logout(HttpServletRequest request,HttpSession session) {
		String msg="";
		session.invalidate();
		msg="退出成功！";
		 request.setAttribute("msg",msg);
		 request.setAttribute("url","admin/login.jsp");
		return "forward/forward";
		
	}

	@RequestMapping(value="/findAllUser")
	public String findAllUser(Map<String,Object>map) {
		map.put("users", userService.findAll());
		return "admin/adminUser";
	}
	
	@RequestMapping(value="/addUser",method=RequestMethod.POST)
	public String addUser(User user,HttpServletRequest request) {
		String msg="";
		if(userService.finadName(user.getAdminName()) != null) {
			msg="用户名不能为空";
		}else {
			userService.insertUser(user);
			msg="添加成功!";
		}
		
		request.setAttribute("msg",msg);
	    request.setAttribute("url","admin/includeAdmin.jsp");
		return "forward/forward";
	}
	
	@RequestMapping(value="/deleteUser")
	public String deleteUser(@RequestParam(value="adminID",defaultValue="1")int adminID,HttpServletRequest request) {
	System.out.println(request.getSession().getAttribute("AdminName"));
		String msg="";
		User user=userService.findOneUser(adminID);
		System.out.println(user.getAdminName());
		if(user.getAdminName().equals(request.getSession().getAttribute("AdminName"))) {
			msg="删除失败！自己还想删除自己？？";
			
		}else {
			userService.deleteUser(adminID);
			msg="删除成功！";
		}
		
		request.setAttribute("msg",msg);
	    request.setAttribute("url","admin/includeAdmin.jsp");
		return "forward/forward";
	}
	
}
