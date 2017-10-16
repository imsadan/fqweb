package fq.us.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.MappingJacksonValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fq.us.common.commonReturn;
import fq.us.pojo.UserList;
import fq.us.service.userService;


@Controller
public class pageController {
	
	@Autowired
	private userService userService;
   
	@RequestMapping("/")
	public String indexPage(){
	  return "index";
 	}
	
	@RequestMapping("/login")
	public String loginPage(){
		return "login";
	}
	
	//登录用户
	@RequestMapping(value="/user/login",method=RequestMethod.POST)
	@ResponseBody
	public commonReturn userLogin(String username,String password,HttpSession httpSession){
		try {
			commonReturn result=userService.userLogin(username, password, httpSession);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return commonReturn.build(500,e.getMessage());
		}
	}
	
	@RequestMapping("/reg")
	public String regPage(){
		return "reg";
	}
	
	//注册
	@RequestMapping(value="/register",method=RequestMethod.POST)
	@ResponseBody
	public commonReturn saveUser(UserList userList){
		try {
			commonReturn res=userService.saveUser(userList);
			return res;
		} catch (Exception e) {
			return commonReturn.build(500,e.getMessage());
		}
	}
	
	//验证注册信息
	@RequestMapping("/check/{param}/{type}")
	@ResponseBody
	public Object checkData(@PathVariable String param,
			@PathVariable Integer type, String callback) {

		commonReturn result = null;

		// 参数有效性校验
		if (StringUtils.isBlank(param)) {
			result = commonReturn.build(400, "校验内容不能为空");
		}
		if (type == null) {
			result = commonReturn.build(400, "校验内容类型不能为空");
		}
		if (type != 1 && type != 2 ) {
			result = commonReturn.build(400, "校验内容类型错误");
		}
		// 校验出错
		if (null != result) {
			if (null != callback) {
				MappingJacksonValue mappingJacksonValue = new MappingJacksonValue(
						result);
				mappingJacksonValue.setJsonpFunction(callback);
				return mappingJacksonValue;
			} else {
				return result;
			}
		}
		// 调用服务
		try {
			result = userService.checkUser(param, type);

		} catch (Exception e) {
			result = commonReturn.build(500, e.getMessage());
		}

		if (null != callback) {
			MappingJacksonValue mappingJacksonValue = new MappingJacksonValue(
					result);
			mappingJacksonValue.setJsonpFunction(callback);
			return mappingJacksonValue;
		} else {
			return result;
		}
	}

	
	
	
	
	
	
	
	
	
	
	
}
