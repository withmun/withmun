package servlet;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.ApplyDao;
import bean.ApplyVo;

public class ApplyServlet extends HttpServlet {

	/*
	 * 필드
	 */
	
	// 작업처리결과를 넣어줄 msg 변수
	String msg = "";
	
	// 파일 업로드 처리
	MultipartRequest multi = null;
	String uploadDir = "D:/withmun_upload";
	String encType="UTF-8";
	int fileSize = 1024*1024*10;				// 용량제한 10MB
	
	
	// jsp에 파라미터로 include 페이지 전달
	String content ="";
	
	
	// Get, Post요청을 모두 여기서 처리
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String jobs = req.getRequestURI();
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		
		
		if (jobs.indexOf("apply_enter.ap") >= 0) {
			content = "./page/apply/apply_enter.jsp";
		}
		else if (jobs.indexOf("apply_privacy.ap") >= 0) {
			content="./page/apply/apply_privacy.jsp";
		}
		else if (jobs.indexOf("apply_introduce.ap") >= 0) {
			content="./page/apply/apply_introduce.jsp";
		}
		else if (jobs.indexOf("apply_profile.ap") >= 0) {
			content="./page/apply/apply_profile.jsp";
		}
		else if (jobs.indexOf("apply_write.ap") >= 0) {
			content="./page/apply/apply_write.jsp";
		}
		else if (jobs.indexOf("apply_preview.ap") >= 0) {
			content="./page/apply/apply_preview.jsp";
		}
		else if (jobs.indexOf("apply_submit.ap") >= 0) {
			content="./page/apply/apply_submit.jsp";
		}
		else if (jobs.indexOf("apply_manage.ap") >= 0) {
			content="./page/apply/apply_manage.jsp";
		}
		else if (jobs.indexOf("apply_pool.ap") >= 0) {
			content="./page/apply/apply_pool.jsp";
		}
		else if (jobs.indexOf("apply_review.ap") >= 0) {
			content="./page/apply/apply_review.jsp";
		}
		else if (jobs.indexOf("apply_reviewY.ap") >= 0) {
			content="./page/apply/apply_reviewY.jsp";
		}
		
		// 입사지원서 새로 작성
		else if (jobs.indexOf("apply_new.ap") >= 0) {
			content="./page/apply/apply_profile.jsp";
			
			// apply_write.jsp에서 받아서
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String pwd = req.getParameter("pwd");
			
			// apply_profile.jsp로 넘긴다
			HttpSession session = req.getSession();
			
			// email은 session 영억으로 보낸다
			session.setAttribute("email", email);
			
			// name, pwd는 requestScope로 보낸다 
			req.setAttribute("name", name);
			req.setAttribute("pwd", pwd);
			
			
		}
		
		else if (jobs.indexOf("profileInsert.ap") >=0) {
			content="./page/apply/apply_introduce.jsp";
			
			ApplyVo piVo = null;	// profileInsertVo
			ApplyDao piDao = null;	// profileInsertDao
			
			try {
				// <form encType='multipart/form-data'> 으로부터 넘오는 값 받기 위해
				multi = new MultipartRequest(req, uploadDir, fileSize, encType, new DefaultFileRenamePolicy());
				
				piVo = piSetVo(multi);
				piDao = new ApplyDao();
				
			}catch(Exception ex) {
				ex.printStackTrace();
			}
			
			if (piDao.profileInsert(piVo)) {
				msg = "정상적으로 applyProfile 페이지 내용이 저장되었습니다";
			}else {
				msg = "applyProfile페이지 저장 중 에러 발생!";
			}
			
			req.setAttribute("msg", msg);
			req.setAttribute("piVo", piVo);
			
		}
		else if (jobs.indexOf("introduceUpdate.ap") >= 0) {
			content="./page/apply/apply_preview.jsp";
			
			System.out.println("세션 email 뿌려보기");
			System.out.println(req.getSession().getAttribute("email"));
			
			
			ApplyVo iuVo = iuSetVo(req);
			ApplyDao iuDao = new ApplyDao();
			
			
			
			
			
		}
		
		
		
		
		
		RequestDispatcher disp = req.getRequestDispatcher("index.jsp?content="+content);
		disp.forward(req, resp);
		
		
		
	} // End of Service()
	
	
	
	
	
	
	
	/*
	 * 사용자 정의 메소드
	 */
	
	
	
	// 일반 setVo()
	public ApplyVo setVo(HttpServletRequest req) {
		ApplyVo reqVo = new ApplyVo();
		/*reqVo.setId(req.getParameter("id"));
		reqVo.setName(req.getParameter("name"));
		reqVo.setAddress(req.getParameter("address"));
		reqVo.setEmail(req.getParameter("email"));
		reqVo.setPhone(req.getParameter("phone"));
		reqVo.setPost(req.getParameter("post"));
		reqVo.setPwd(req.getParameter("pwd"));*/
		
		return reqVo;
	}
	
	// <form enctype='multipart/form-data'> 를 위한 setVo 오버로딩
	//request.getParameter() 기능을 multi가 대신 처리
	public ApplyVo piSetVo(MultipartRequest multi) {
		ApplyVo piVo = new ApplyVo();
		
		
		// 기본사항
		piVo.setaNo(0);
		piVo.setEmail(multi.getParameter("email"));
		piVo.setPwd(multi.getParameter("pwd"));
		piVo.setName(multi.getParameter("name"));
		
		piVo.setField(multi.getParameter("field"));
		piVo.setJumin1((multi.getParameter("jumin1")));
		piVo.setJumin2((multi.getParameter("jumin2")));
		piVo.setAddr(multi.getParameter("addr"));
		piVo.setZipCode(multi.getParameter("zipCode"));
		
		piVo.setTel(multi.getParameter("tel1") + "-" + multi.getParameter("tel2") + "-" + multi.getParameter("tel3"));
		piVo.setMobile(multi.getParameter("mobile1") + "-" + multi.getParameter("mobile2") + "-" + multi.getParameter("mobile3"));
		
		// 학업사항
		piVo.setHighName(multi.getParameter("highName"));
		piVo.setHighStart(multi.getParameter("highStart"));
		piVo.setHighFinish(multi.getParameter("highFinish"));
		piVo.setHighJolUp((multi.getParameter("radioHighJolUp")));
		
		piVo.setColName(multi.getParameter("colName"));
		piVo.setColStart(multi.getParameter("colStart"));
		piVo.setColFinish(multi.getParameter("colFinish"));
		piVo.setColMajor(multi.getParameter("colMajor"));
		piVo.setColGrade((multi.getParameter("colGrade")));
		piVo.setColJolUp((multi.getParameter("radioColJolUp")));
		
		piVo.setUnivName(multi.getParameter("univName"));
		piVo.setUnivStart(multi.getParameter("univStart"));
		piVo.setUnivFinish(multi.getParameter("univFinish"));
		piVo.setUnivMajor(multi.getParameter("univMajor"));
		piVo.setUnivGrade((multi.getParameter("univGrade")));
		piVo.setUnivJolUp((multi.getParameter("radioUnivJolUp")));
		
		piVo.setGradName(multi.getParameter("gradName"));
		piVo.setGradStart(multi.getParameter("gradStart"));
		piVo.setGradFinish(multi.getParameter("gradFinish"));
		piVo.setGradMajor(multi.getParameter("gradMajor"));
		piVo.setGradGrade((multi.getParameter("gradGrade")));
		piVo.setGradJolUp((multi.getParameter("radioGradJolUp")));
		
		// 병역사항
		piVo.setGunByul(multi.getParameter("gunByul"));
		piVo.setGunByung(multi.getParameter("gunByung"));
		piVo.setGunGye(multi.getParameter("gunGye"));
		piVo.setGunStart(multi.getParameter("gunStart"));
		piVo.setGunFinish(multi.getParameter("gunFinish"));
		piVo.setGunPil((multi.getParameter("radioGunPil")));
		piVo.setGunMiPilWhy(multi.getParameter("gunMiPilWhy"));
		
		
		// 외국어
		piVo.setLang1Name(multi.getParameter("lang1Name"));
		piVo.setLang1Score((multi.getParameter("lang1Score")));
		piVo.setLang1Date(multi.getParameter("lang1Date"));
		piVo.setLang2Name(multi.getParameter("lang2Name"));
		piVo.setLang2Score((multi.getParameter("lang2Score")));
		piVo.setLang2Date(multi.getParameter("lang2Date"));
		
		// 자격면허
		piVo.setLicense1Name(multi.getParameter("license1Name"));
		piVo.setLicense1Date(multi.getParameter("license1Date"));
		piVo.setLicense1Org(multi.getParameter("license1Org"));
		piVo.setLicense2Name(multi.getParameter("license2Name"));
		piVo.setLicense2Date(multi.getParameter("license2Date"));
		piVo.setLicense2Org(multi.getParameter("license2Org"));
		
		// 동아리 및 봉사활동
		piVo.setActivity1Content(multi.getParameter("activity1Content"));
		piVo.setActivity1Start(multi.getParameter("activity1Start"));
		piVo.setActivity1Finish(multi.getParameter("activity1Finish"));
		piVo.setActivity1Org(multi.getParameter("activity1Org"));
		piVo.setActivity2Content(multi.getParameter("activity2Content"));
		piVo.setActivity2Start(multi.getParameter("activity2Start"));
		piVo.setActivity2Finish(multi.getParameter("activity2Finish"));
		piVo.setActivity2Org(multi.getParameter("activity2Org"));		
		
		// 가족관계
		piVo.setFamily1Rel(multi.getParameter("family1Rel"));
		piVo.setFamily1Name(multi.getParameter("family1Name"));
		piVo.setFamily1Birth(multi.getParameter("family1Birth"));
		piVo.setFamily1Academic(multi.getParameter("family1Academic"));
		piVo.setFamily1Job(multi.getParameter("family1Job"));
		piVo.setFamily1Company(multi.getParameter("family1Company"));
		piVo.setFamily1Position(multi.getParameter("family1Position"));
		piVo.setFamily1Livewith(multi.getParameter("radioFamily1Livewith").trim());

		
		piVo.setFamily2Rel(multi.getParameter("family2Rel"));
		piVo.setFamily2Name(multi.getParameter("family2Name"));
		piVo.setFamily2Birth(multi.getParameter("family2Birth"));
		piVo.setFamily2Academic(multi.getParameter("family2Academic"));
		piVo.setFamily2Job(multi.getParameter("family2Job"));
		piVo.setFamily2Company(multi.getParameter("family2Company"));
		piVo.setFamily2Position(multi.getParameter("family2Position"));
		piVo.setFamily2Livewith(multi.getParameter("radioFamily2Livewith").trim());
		
		
		piVo.setFamily3Rel(multi.getParameter("family3Rel"));
		piVo.setFamily3Name(multi.getParameter("family3Name"));
		piVo.setFamily3Birth(multi.getParameter("family3Birth"));
		piVo.setFamily3Academic(multi.getParameter("family3Academic"));
		piVo.setFamily3Job(multi.getParameter("family3Job"));
		piVo.setFamily3Company(multi.getParameter("family3Company"));
		piVo.setFamily3Position(multi.getParameter("family3Position"));
		piVo.setFamily3Livewith(multi.getParameter("radioFamily3Livewith").trim());
		
		piVo.setFamily4Rel(multi.getParameter("family4Rel"));
		piVo.setFamily4Name(multi.getParameter("family4Name"));
		piVo.setFamily4Birth(multi.getParameter("family4Birth"));
		piVo.setFamily4Academic(multi.getParameter("family4Academic"));
		piVo.setFamily4Job(multi.getParameter("family4Job"));
		piVo.setFamily4Company(multi.getParameter("family4Company"));
		piVo.setFamily4Position(multi.getParameter("family4Position"));
		piVo.setFamily4Livewith(multi.getParameter("radioFamily4Livewith").trim());
		
		// 취미 등 기타사항
		piVo.setHobby(multi.getParameter("hobby"));
		piVo.setSpecial(multi.getParameter("special"));
		piVo.setReligion(multi.getParameter("religion"));
		piVo.setBoHun(multi.getParameter("radioBoHun").trim());
		
		// 사진
		// file태그명과 원본파일명, 변경된 파일명의 정보
		Enumeration tags = multi.getFileNames();
		while(tags.hasMoreElements()) {
			String tag = (String)tags.nextElement();
			
			System.out.println("tag: " + tag);
			System.out.println("original: " + multi.getOriginalFileName(tag));
			System.out.println("getFileSystem: " + multi.getFilesystemName(tag));
			
			piVo.setPhotoC(multi.getOriginalFileName(tag));
			piVo.setPhotoS(multi.getFilesystemName(tag));
		}
		
		return piVo;
		
	} // End of psSetVo()
	
	
	
	// introduceUpdate.ap
	public ApplyVo iuSetVo(HttpServletRequest req) {
		
		
		ApplyVo iuVo = new ApplyVo();
		
		
		
		
		iuVo.setSungJang(req.getParameter("sungJang"));
		iuVo.setCharact(req.getParameter("charact"));
		iuVo.setMotive(req.getParameter("motive"));
		iuVo.setFuture(req.getParameter("future"));
		//iuVo.setEmail((String)req.getSession().getAttribute("email"));
		
		return iuVo;
	}
	
	

	
	
	
} // End of ApplyServlet()
