package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ListDao;
import bean.ListVo;

public class BoardServlet extends HttpServlet{
	
	String method;


	@Override
	protected void service(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String jobs = req.getRequestURI();
		
		if(jobs.indexOf("delete.bo")>=0) {
			String msg = "";
			ListDao dao = new ListDao();
			ListVo vo = setVo(req);
			
			if(dao.delete(vo)) {
				msg = "삭제 되었습니다.";
				RequestDispatcher disp = req.getRequestDispatcher("list.do");
				disp.forward(req,resp);
			}
		}
		
		if(jobs.indexOf("insert.bo")>=0){
			ListDao dao = new ListDao();
			ListVo vo = setVo(req);
			String msg = "";
			
			
			if (dao.insert(vo)) {
				msg = "정상적으로 데이터가 저장되었습니다.";
				System.out.println(msg);
			}else {
				msg ="dsdasd";
				System.out.println(msg);
				
				RequestDispatcher disp = req.getRequestDispatcher("list.do");
				disp.forward(req,resp);
			}
			
		}
		else if(jobs.indexOf("list.bo") >= 0) {
			ListDao dao = new ListDao();
			ListVo vo = setVo(req);
			String findStr = "";
			
		if (req.getParameter("findStr") != null) {
				findStr = req.getParameter("findStr");
		}
			List<ListVo> list = dao.select(findStr);
			
			req.setAttribute("list", list);
			
			RequestDispatcher disp = req.getRequestDispatcher("list.do");
			disp.forward(req,resp);
			
		}
		else if(jobs.indexOf("reply.bo") >= 0) {
			
		}


	}

	public ListVo setVo(HttpServletRequest req) {
		
		ListVo vo = new ListVo();
		
		vo.setName(req.getParameter("qna_name"));
		vo.setPwd(req.getParameter("qna_pwd"));
		vo.setDoc(req.getParameter("document"));

		return vo;	
	}
	
	
	
	
}
