package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PageServlet extends HttpServlet{

	String content ="";
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String jobs = req.getRequestURI();
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");

		if (jobs.indexOf("incorporate.do") >= 0) {
			content="./page/incorporate.jsp";
		}
		else if (jobs.indexOf("land_compensation.do") >= 0) {
			content="./page/land_compensation.jsp";
		}
		else if (jobs.indexOf("licensing.do") >= 0) {
			content="./page/licensing.jsp";
		}
		else if (jobs.indexOf("immigration.do") >= 0) {
			content="./page/immigration.jsp";
		}
		else if (jobs.indexOf("suspension.do") >= 0) {
			content="./page/suspension.jsp";
		}
		else if (jobs.indexOf("english_contract.do") >= 0) {
			content="./page/english_contract.jsp";
		}
		else if (jobs.indexOf("professional_translation.do") >= 0) {
			content="./page/professional_translation.jsp";
		}
		else if (jobs.indexOf("acting_translation.do") >= 0) {
			content="./page/acting_translation.jsp";
		}
		else if (jobs.indexOf("aposcertification.do") >= 0) {
			content="./page/aposcertification.jsp";
		}
		else if (jobs.indexOf("overseas.do") >= 0) {
			content="./page/overseas.jsp";
		}
		else if (jobs.indexOf("certificate.do") >= 0) {
			content="./page/certificate.jsp";
		}
		else if (jobs.indexOf("general_translation.do") >= 0) {
			content="./page/general_translation.jsp";
		}
		else if (jobs.indexOf("acting_translation_personal.do") >= 0) {
			content="./page/acting_translation_personal.jsp";
		}
		else if (jobs.indexOf("aposcertification_genenal.do") >= 0) {
			content="./page/aposcertification_genenal.jsp";
		}
		else if (jobs.indexOf("studying_abroad.do") >= 0) {
			content="./page/studying_abroad.jsp";
		}
		else if (jobs.indexOf("about.do") >= 0) {
			content="./page/about.jsp";
		}
		else if (jobs.indexOf("philosophy.do") >= 0) {
			content="./page/philosophy.jsp";
		}
		else if (jobs.indexOf("location.do") >= 0) {
			content="./page/location.jsp";
		}
		else if (jobs.indexOf("about.do") >= 0) {
			content="./page/about.jsp";
		}
		else if (jobs.indexOf("greetings.do") >= 0) {
			content="./page/greetings.jsp";
		}
		else if (jobs.indexOf("employment_notice.do") >= 0) {
			content="./page/employment_notice.jsp";
		}
		
		else if (jobs.indexOf("service_procedure.do") >= 0) {
			content="./page/service_procedure.jsp";
		}
		else if (jobs.indexOf("site_map.do") >= 0) {
			content="./page/site_map.jsp";
		}
		else if (jobs.indexOf("list.do") >= 0) {
			content ="./page/board/list.jsp";
		}
		else if (jobs.indexOf("mail_result.do") >= 0) {

			content ="./page/mail_result.jsp";
		}
		
		RequestDispatcher disp = req.getRequestDispatcher("index.jsp?content="+content);
		disp.forward(req, resp);
		
	}
}
