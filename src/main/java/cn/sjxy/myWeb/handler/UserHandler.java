package cn.sjxy.myWeb.handler;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
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

	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(@RequestParam("adminName") String name,
			@RequestParam("adminPwd") String password,
			HttpServletRequest request,HttpSession session) {
		Subject currentUser = SecurityUtils.getSubject();
		 if (!currentUser.isAuthenticated()) {
	        	// 把用户名和密码封装为 UsernamePasswordToken 对象
	            UsernamePasswordToken token = new UsernamePasswordToken(name, password);
	           
	            // 记住我的信息
	            token.setRememberMe(true);
	            try {
	            	 //执行登录
	            	//调用login()方法，把token对象传到realm做校验和加密
	                currentUser.login(token);
	            } 
	            // 所有认证时的异常的父类. 
	            catch (AuthenticationException ae) {
	                //unexpected condition?  error?
	            	System.out.println("登录失败1"+ae.getMessage());
	            }
	        }
		String msg="登录成功";
		    User user0=new User();
		    user0.setAdminName(name);
		    user0.setAdminPwd(password);
		 	User user1=userService.adminLogin(user0);
			session.setAttribute("AdminName", name);
			userService.updateUser(user1);
			 request.setAttribute("msg",msg);
			 request.setAttribute("url","admin/includeAdmin.jsp");
			 return "forward/forward";
		
	}
		
	//@RequestMapping(value="/logout")
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
		if(userService.findName(user.getAdminName()) != null) {
			msg="用户已存在";
		}else {
			String password = request.getParameter("adminPwd");
			String name = request.getParameter("adminName");
			String algorithmName="Md5";
			Object source=password;
			Object salt=ByteSource.Util.bytes(name);
			int hashIterations=1024;
			
			Object result=new SimpleHash(algorithmName, source, salt, hashIterations);
			user.setAdminPwd(result.toString());
			user.setAdminName(name);
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
