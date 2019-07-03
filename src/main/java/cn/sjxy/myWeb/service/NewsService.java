package cn.sjxy.myWeb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.sjxy.myWeb.dao.NewsMapper;
import cn.sjxy.myWeb.domain.News;

@Service
@Transactional(isolation=Isolation.DEFAULT,propagation=Propagation.REQUIRED)

public class NewsService {

	@Autowired
	private NewsMapper newsMapper;

	public NewsMapper getNewsMapper() {
		return newsMapper;
	}

	public void setNewsMapper(NewsMapper newsMapper) {
		this.newsMapper = newsMapper;
	}
	
	public List<News> findNews(){
		return newsMapper.findAll();
	}
	
	public News findNews(int newsID) {
		return newsMapper.findNews(newsID);
	}
	public void delete(int newsID) {
		newsMapper.deleteNews(newsID);
	}
	
	public void insertNews(News news) {
		newsMapper.addNews(news);
	}
	
	public void update(News news) {
		newsMapper.updateNews(news);
	}
	
}
