package cn.sjxy.myWeb.service;

import java.util.List;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.sjxy.myWeb.dao.UserMapper;
import cn.sjxy.myWeb.domain.User;

@Service
@Transactional(isolation=Isolation.DEFAULT,propagation=Propagation.REQUIRED)
public class UserService {

	@Autowired
	private UserMapper userMapper;

	public User adminLogin(User user) {
		return userMapper.login(user);
	}
	
	public List<User> findAll(){
		return userMapper.findAllUser();
	}



	public void insertUser(User user) {
		String algorithmName="Md5";
		Object source=user.getAdminPwd();
		Object salt= ByteSource.Util.bytes(user.getAdminName());
		int hashIterations=1024;

		Object result=new SimpleHash(algorithmName, source, salt, hashIterations);
		String password = result.toString();

		user.setAdminPwd(password);
		userMapper.addUser(user);
	}


	
	public void deleteUser(int adminID) {
		userMapper.deleteUser(adminID);
	}
	
	public void updateUser(User user){
		userMapper.updateUser(user);
	}
	
	public User findOneUser(int adminID) {
		return userMapper.findById(adminID);
	}
	
	public User findName(String adminName) {
		return userMapper.findByname(adminName);
	}
}
