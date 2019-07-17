package cn.sjxy.myWeb.dao;

import java.util.List;

import cn.sjxy.myWeb.domain.User;

public interface UserMapper {

	public User login(User user);
	
	public List<User> findAllUser();
	
	public void addUser(User user);
	
	public void deleteUser(int adminID);
	
	public void updateUser(User user);
	
	public User findById(int adminID);
	
	public User findByname(String adminName);
	
	
}
