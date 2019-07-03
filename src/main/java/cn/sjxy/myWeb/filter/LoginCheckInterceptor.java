package cn.sjxy.myWeb.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(request.getSession().getAttribute("AdminName") !=null) {
			return true;
		}else {
			response.sendRedirect(request.getContextPath()+"/login");
			return false;
		}
		

	}

	
}
