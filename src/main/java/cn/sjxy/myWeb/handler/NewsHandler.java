package cn.sjxy.myWeb.handler;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.sjxy.myWeb.domain.News;
import cn.sjxy.myWeb.service.NewsService;

@Controller
public class NewsHandler {

	@Autowired
	private NewsService newsService;

	@RequestMapping(value="/findNews")
	public String findAllNews(Map<String,Object>map) {
		map.put("news", newsService.findNews());
		return "forward/includeNews";
	}
	
	
	@RequestMapping(value="/showAllNews")
	public String showAllNews(Map<String,Object>map) {
		map.put("news", newsService.findNews());
		return "admin/news";
	}
	
	@RequestMapping(value="/showNews")
	public String findOneNews(@RequestParam(value="newsID",defaultValue="1")int newsID,Map<String,Object>map,HttpSession session) {
		News n=newsService.findNews(newsID);
		String details=n.getNewsContent();
		//session.setAttribute("news", details);
		map.put("news", details);
		//System.out.println(n.toString());
		return "forward/includeC";
	}
	
	@RequestMapping(value="/deleteNews")
	public String deleteNews(@RequestParam(value="newsID",defaultValue="1")int newsID,HttpServletRequest request) {
		String msg="";
		newsService.delete(newsID);
		msg="删除成功！";
		
		request.setAttribute("msg",msg);
		 request.setAttribute("url","admin/includeRedirect.jsp");
		return "forward/forward";
		
	}
	
	@RequestMapping(value="/addNews",method=RequestMethod.POST)
	public String addNews(HttpServletRequest request,News news) {
		//System.out.println("我是第一个："+news.getNewsTitle());
		String msg="";
		
		String adminName=(String) request.getSession().getAttribute("AdminName");
		
		news.setAdminName(adminName);
		
		newsService.insertNews(news);
		msg="添加成功！";
		request.setAttribute("msg",msg);
		 request.setAttribute("url","admin/includeRedirect.jsp");
		return "forward/forward";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updateNews(@RequestParam(value="newsID",defaultValue="1")int newsID,News news,HttpServletRequest request) {
		String msg="";
		news.setNewsID(newsID);
		newsService.update(news);
		msg="修改成功";
		request.setAttribute("msg",msg);
		 request.setAttribute("url","admin/includeRedirect.jsp");
		return "forward/forward";
	}
}
