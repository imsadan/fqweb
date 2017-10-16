package fq.us.service;

import fq.us.common.Mailpojo;
import fq.us.common.commonReturn;


/**
 * 
 * @param 邮件发送模板
 */
public interface emailService {
	//邮件发送
	public commonReturn sendMail(Mailpojo mailpojo);
}
