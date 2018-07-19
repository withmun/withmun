package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ApplyServlet extends HttpServlet {

	String content ="";
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String jobs = req.getRequestURI();
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		if (jobs.indexOf("apply_introduce.ap") >= 0) {
			content="./page/apply/apply_introduce.jsp";
		}
		else if (jobs.indexOf("apply_privacy.ap") >= 0) {
			content="./page/apply/apply_privacy.jsp";
		}
		else if (jobs.indexOf("apply_profile.ap") >= 0) {
			content="./page/apply/apply_profile.jsp";
		}


		RequestDispatcher disp = req.getRequestDispatcher("index.jsp?content="+content);
		disp.forward(req, resp);
	}
}
