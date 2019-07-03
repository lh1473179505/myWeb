package cn.sjxy.myWeb.dao;

import java.util.List;

import cn.sjxy.myWeb.domain.News;

public interface NewsMapper {

	public List<News> findAll();
	
	public News findNews(int newsID);
	
	public void deleteNews(int newsID);
	
	public void addNews(News news);
	
	public void updateNews(News news);
}
