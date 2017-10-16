package fq.us.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import fq.us.common.Mailpojo;
import fq.us.common.commonReturn;
import fq.us.service.emailService;

@Controller
public class emailController {
   
	@Autowired
	private emailService emailService;
	
	@RequestMapping("/send/mail")
	@ResponseBody
	public commonReturn sendMail(Mailpojo mailpojo){
		emailService.sendMail(mailpojo);
        return commonReturn.ok();
	}  
}
