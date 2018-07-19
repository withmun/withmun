package bean;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

// 메일전송에 사용되는 계정의 정보
public class MyAuthenticator extends Authenticator{ 
	PasswordAuthentication pa;

	public PasswordAuthentication getPasswordAuthentication() {
		String user = "rlaehdrlehdrl@naver.com";
		String pwd = "kdk236236";
		pa = new PasswordAuthentication(user, pwd);
		
		return pa;
	}
}
