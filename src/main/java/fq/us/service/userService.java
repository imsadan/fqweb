package fq.us.service;

import javax.servlet.http.HttpSession;

import fq.us.common.commonReturn;
import fq.us.pojo.UserList;


public interface userService {
	//登录
	public commonReturn userLogin(String username,String password,HttpSession httpSession);
	//注册
	public commonReturn saveUser(UserList userList);
	//检测注册信息
	public commonReturn checkUser(String content,Integer type);
}
