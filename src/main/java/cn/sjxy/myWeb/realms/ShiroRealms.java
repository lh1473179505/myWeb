package cn.sjxy.myWeb.realms;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import cn.sjxy.myWeb.domain.User;
import cn.sjxy.myWeb.service.UserService;

public class ShiroRealms extends AuthenticatingRealm {

	@Autowired
	private UserService userService;

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		//1.把AuthenticationToken转为UsernamePasswordToken
		UsernamePasswordToken upToken=(UsernamePasswordToken)token;
		
		//2.从UsernamePasswordToken中获取name
		String name=upToken.getUsername();
		
		//3.调用数据库方法，从数据库查询name对应的记录
		User user=userService.findName(name);
		//4.若用户不存在，抛出UnknownAccountException异常
		if(user==null) {
			throw new UnknownAccountException("用户不存在！");
		}
		//6.根据用户情况，构建AuthenticationInfo对象并返回，通常使用的实现类是SimpleAuthenticationInfo
		//以下信息从数据库获取
		//principal:认证的实体信息，可以是name，也可以是 数据表对应的用户的实体对象，如一个user，一个employee对象
		Object principal=name;
		//credentials:从数据表中获取的密码
		Object credentials=user.getAdminPwd();//"64c8b1e43d8ba3115ab40bcea57f010b";
		
		//盐值，通过ByteSource接口里的内部类Util的bytes()方法实现，bytes()参数一般是惟一的
		ByteSource credentialsSalt = ByteSource.Util.bytes(name);
		//realmName:当前realm对象的name,调用父类的getName()方法就行
		String realmName=getName();
		SimpleAuthenticationInfo info=null;//new SimpleAuthenticationInfo(principal, credentials, realmName);
		info=new SimpleAuthenticationInfo(principal, credentials, credentialsSalt, realmName);
		System.out.println(info);
		return info;

		
	}
	public static void main(String[] args) {
		String algorithmName="Md5";
		Object source="123";
		Object salt=ByteSource.Util.bytes("cat");
		int hashIterations=1024;
		
		Object result=new SimpleHash(algorithmName, source, salt, hashIterations);
		System.out.println(result);
	}
	

	

}
