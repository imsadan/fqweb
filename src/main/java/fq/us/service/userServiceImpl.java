package fq.us.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import fq.us.common.IDUtils;
import fq.us.common.commonReturn;
import fq.us.mapper.UserListMapper;
import fq.us.pojo.UserList;
import fq.us.pojo.UserListExample;
import fq.us.pojo.UserListExample.Criteria;

@Service
public class userServiceImpl implements userService{
    
	@Autowired
	private UserListMapper userListMapper;
	
	
    /**
     *@param 登录模块 
     * 
     */
	@Override
	public commonReturn userLogin(String username, String password,
			HttpSession httpSession) {
		UserListExample example=new UserListExample();
		Criteria criteria=example.createCriteria();
		criteria.andUsernameEqualTo(username);
		List<UserList> list=userListMapper.selectByExample(example);
		if (list.size()==0||list==null) {
			return commonReturn.build(400,"用户名或密码错误");
		}
		
		UserList user=list.get(0);
		userListMapper.updateByPrimaryKey(user);
		//对比密码
		if (!DigestUtils.md5DigestAsHex(password.getBytes()).equals(user.getPassword())) {
			return commonReturn.build(400,"用户名或密码错误");
		}
		
		httpSession.setAttribute("userLogin",user);
		return commonReturn.ok();
	}

    /**
     * 
     *@param  注册
     */
	@Override
	public commonReturn saveUser(UserList userList) {
		long id=IDUtils.genItemId();
		userList.setId(id);
		// 加密
		userList.setPassword(DigestUtils.md5DigestAsHex(userList.getPassword()
				.getBytes()));
		userListMapper.insert(userList);
		return commonReturn.ok();
	}


	@Override
	public commonReturn checkUser(String content, Integer type) {
		// 1,2分别表示username,email
		// 创建查询的条件
		UserListExample example = new UserListExample();
		Criteria criteria = example.createCriteria();
		if (1 == type) {
			criteria.andUsernameEqualTo(content);
		} else if (2 == type) {
			criteria.andEmailEqualTo(content);
		}
		// 查询
		List<UserList> list = userListMapper.selectByExample(example);
		if (list == null || list.size() == 0) {
			return commonReturn.ok(true);
		}
		return commonReturn.ok(false);
	}

}
