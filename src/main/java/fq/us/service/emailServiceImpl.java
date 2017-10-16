package fq.us.service;

import org.springframework.stereotype.Service;

import fq.us.common.Mail;
import fq.us.common.MailUtil;
import fq.us.common.Mailpojo;
import fq.us.common.commonReturn;

@Service
public class emailServiceImpl implements emailService {
    
	@Override
	public commonReturn sendMail(Mailpojo mailpojo) {
		 Mail mail = new Mail();
	        // 设置邮件服务器 
	        mail.setHost("smtp.163.com");
	        // 发件人邮件地址
	        mail.setSender("13646738449@163.com");
	        // 发件人名称(邮箱名代替)
	        mail.setName(mailpojo.getEmail());
	        // 登录账号,一般都是和邮箱名一样吧  
	        mail.setUsername("13646738449@163.com");
	        // 发件人邮箱的登录密码  
	        mail.setPassword("1012665655");
	        // 接收人  
	        mail.setReceiver("1012665655@qq.com");
	        mail.setSubject("番茄官网邮件信息接收反馈");
	        //内容信息
	        mail.setMessage("<h3 style=\"color:red;\">姓名:</h3>"+"<p style=\"font-size:20px;\">"+mailpojo.getUsername()+"</p>"+"<h3 style=\"color:red;\">具体的信息或反馈:</h3>"+"<p style=\"font-size:20px;\">"+mailpojo.getMessage()+"</p>");
	        
	        new MailUtil().send(mail);
		return commonReturn.ok();
	}

}
