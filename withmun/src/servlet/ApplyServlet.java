package servlet;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	String uploadDir = "D:/dev/eclipse-workspace/withmun/WebContent/upload";
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
		
		// 입사지원서 새로 작성(insert)
		else if (jobs.indexOf("apply_new.ap") >= 0) {
			content="./page/apply/apply_profile.jsp";
			
			ApplyDao newDao = new ApplyDao();
			ApplyVo newVo = newSetVo(req);
			
			if (newDao.insert(newVo)) {
				msg = "정상적으로 데이터가 저장되었습니다";
			}else {
				msg = "데이터 저장중 오류 발생";
			}
		
			req.setAttribute("newVo", newVo);
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		else if (jobs.indexOf("profileSave.ap") >=0) {
			content="./page/apply/apply_profile.jsp";
			
			ApplyVo psVo = null;	// profileSaveVo
			ApplyDao psDao = null;	// profileSaveDao
			
			
			
			
			// <form encType='multipart/form-data'> 으로부터 넘오는 값 받기 위해
			try {
				multi = new MultipartRequest(req, uploadDir, fileSize, encType, new DefaultFileRenamePolicy());
				
				psVo = psSetVo(multi);
				psDao = new ApplyDao();
			
			}catch(Exception ex) {
				ex.printStackTrace();
			}
			
			
			
			if (psDao.insert(psVo)) {
				msg = "정상적으로 applyProfile 페이지 내용이 저장되었습니다";
			}else {
				msg = "applyProfile페이지 저장 중 에러 발생!";
			}
			
			System.out.println(psVo.getEmail());
			System.out.println(msg);
			
			
			
			req.setAttribute("msg", msg);
			req.setAttribute("psVo", psVo);
			
			
		}
		
		RequestDispatcher disp = req.getRequestDispatcher("index.jsp?content="+content);
		disp.forward(req, resp);
		
		
		
	} // End of Service()
	
	
	/*
	 * 사용자 정의 메소드
	 */
	
	// 입사지원서 작성(insert)용 메소드
	public ApplyVo newSetVo(HttpServletRequest req) {
		ApplyVo nVo = new ApplyVo();
		
		nVo.setName(req.getParameter("name"));
		nVo.setEmail(req.getParameter("email"));
		nVo.setPwd(req.getParameter("pwd"));
		
		return nVo;
	}
	
	
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
	public ApplyVo psSetVo(MultipartRequest multi) {
		
		ApplyVo psVo = new ApplyVo();
		
		// TODO: aNo, photoC, photoS
		
		// 기본사항
		psVo.setEmail(multi.getParameter("email"));
		psVo.setPwd(multi.getParameter("pwd"));
		psVo.setField(multi.getParameter("field"));

		psVo.setJumin1((multi.getParameter("jumin1")));
		psVo.setJumin2((multi.getParameter("jumin2")));
		psVo.setAddr(multi.getParameter("addr"));
		psVo.setZipCode(multi.getParameter("zipCode"));
		
		psVo.setTel1((multi.getParameter("tel1")));
		psVo.setTel2((multi.getParameter("tel2")));
		psVo.setTel3((multi.getParameter("tel3")));
		psVo.setTel1((multi.getParameter("mobile1")));
		psVo.setTel2((multi.getParameter("mobile2")));
		psVo.setTel3((multi.getParameter("mobile3")));
		
		// 학업사항
		psVo.setHighName(multi.getParameter("highName"));
		psVo.setHighStart(multi.getParameter("highStart"));
		psVo.setHighFinish(multi.getParameter("highFinish"));
		psVo.setHighJolup((multi.getParameter("highJolup")));
		
		psVo.setColName(multi.getParameter("colName"));
		psVo.setColStart(multi.getParameter("colStart"));
		psVo.setColFinish(multi.getParameter("colFinish"));
		psVo.setColMajor(multi.getParameter("colMajor"));
		psVo.setColGrade((multi.getParameter("colGrade")));
		psVo.setColJolup((multi.getParameter("colJolup")));
		
		psVo.setUnivName(multi.getParameter("uinvName"));
		psVo.setUnivStart(multi.getParameter("univStart"));
		psVo.setUnivFinish(multi.getParameter("univFinish"));
		psVo.setUnivMajor(multi.getParameter("univMajor"));
		psVo.setUnivGrade((multi.getParameter("univGrade")));
		psVo.setUnivJolup((multi.getParameter("colJolup")));
		
		psVo.setGradName(multi.getParameter("colName"));
		psVo.setGradStart(multi.getParameter("colStart"));
		psVo.setGradFinish(multi.getParameter("colFinish"));
		psVo.setGradMajor(multi.getParameter("colMajor"));
		psVo.setGradGrade((multi.getParameter("colGrade")));
		psVo.setGradJolup((multi.getParameter("colJolup")));
		
		// 병역사항
		psVo.setGunByul(multi.getParameter("gunByul"));
		psVo.setGunByung(multi.getParameter("gunByung"));
		psVo.setGunGye(multi.getParameter("gunGye"));
		psVo.setGunStart(multi.getParameter("gunStart"));
		psVo.setGunFinish(multi.getParameter("gunFinish"));
		psVo.setGunPil((multi.getParameter("gunPil")));
		psVo.setGunMiPilWhy(multi.getParameter("gunMiPilWhy"));
		
		
		// 외국어
		psVo.setLang1Name(multi.getParameter("lang1Name"));
		psVo.setLang1Score((multi.getParameter("lang1Score")));
		psVo.setLang1Date(multi.getParameter("lang1Date"));
		psVo.setLang2Name(multi.getParameter("lang2Name"));
		psVo.setLang2Score((multi.getParameter("lang2Score")));
		psVo.setLang2Date(multi.getParameter("lang2Date"));
		
		// 자격면허
		psVo.setLicense1Name(multi.getParameter("license1Name"));
		psVo.setLicense1Date(multi.getParameter("license1Date"));
		psVo.setLicense1Org(multi.getParameter("license1Org"));
		psVo.setLicense2Name(multi.getParameter("license2Name"));
		psVo.setLicense2Date(multi.getParameter("license2Date"));
		psVo.setLicense2Org(multi.getParameter("license2Org"));
		
		// 동아리 및 봉사활동
		psVo.setActivity1Content(multi.getParameter("activity1Content"));
		psVo.setActivity1Start(multi.getParameter("activity1Start"));
		psVo.setActivity1Finish(multi.getParameter("activity1Finish"));
		psVo.setActivity1Org(multi.getParameter("activity1Org"));
		psVo.setActivity2Content(multi.getParameter("activity2Content"));
		psVo.setActivity2Start(multi.getParameter("activity2Start"));
		psVo.setActivity2Finish(multi.getParameter("activity2Finish"));
		psVo.setActivity2Org(multi.getParameter("activity2Org"));		
		
		// 가족관계
		psVo.setFamily1Rel(multi.getParameter("family1Rel"));
		psVo.setFamily1Name(multi.getParameter("family1Name"));
		psVo.setFamily1Birth(multi.getParameter("famil1Birth"));
		psVo.setFamily1Academic(multi.getParameter("family1Academic"));
		psVo.setFamily1Job(multi.getParameter("family1Job"));
		psVo.setFamily1Company(multi.getParameter("family1Company"));
		psVo.setFamily1Position(multi.getParameter("family1Position"));
		psVo.setFamily1Livewith(("family1LiveWith"));
		
		psVo.setFamily2Rel(multi.getParameter("family2Rel"));
		psVo.setFamily2Name(multi.getParameter("family2Name"));
		psVo.setFamily2Birth(multi.getParameter("famil2Birth"));
		psVo.setFamily2Academic(multi.getParameter("family2Academic"));
		psVo.setFamily2Job(multi.getParameter("family2Job"));
		psVo.setFamily2Company(multi.getParameter("family2Company"));
		psVo.setFamily2Position(multi.getParameter("family2Position"));
		psVo.setFamily2Livewith(("family2LiveWith"));
		
		psVo.setFamily3Rel(multi.getParameter("family3Rel"));
		psVo.setFamily3Name(multi.getParameter("family3Name"));
		psVo.setFamily3Birth(multi.getParameter("famil3Birth"));
		psVo.setFamily3Academic(multi.getParameter("family3Academic"));
		psVo.setFamily3Job(multi.getParameter("family3Job"));
		psVo.setFamily3Company(multi.getParameter("family3Company"));
		psVo.setFamily3Position(multi.getParameter("family3Position"));
		psVo.setFamily3Livewith(("family3LiveWith"));
		
		psVo.setFamily4Rel(multi.getParameter("family4Rel"));
		psVo.setFamily4Name(multi.getParameter("family4Name"));
		psVo.setFamily4Birth(multi.getParameter("famil4Birth"));
		psVo.setFamily4Academic(multi.getParameter("family4Academic"));
		psVo.setFamily4Job(multi.getParameter("family4Job"));
		psVo.setFamily4Company(multi.getParameter("family4Company"));
		psVo.setFamily4Position(multi.getParameter("family4Position"));
		psVo.setFamily4Livewith(("family4LiveWith"));
		
		
		// 취미 등 기타사항
		psVo.setHobby(multi.getParameter("hobby"));
		psVo.setSpecial(multi.getParameter("special"));
		psVo.setReligion(multi.getParameter("religion"));
		psVo.setBoHun((multi.getParameter("boHun")));
		
		// file태그명과 원본파일명, 변경된 파일명의 정보
		Enumeration tags = multi.getFileNames();
		while(tags.hasMoreElements()) {
			String tag = (String)tags.nextElement();
			psVo.setPhotoC(multi.getOriginalFileName(tag));
			psVo.setPhotoS(multi.getFilesystemName(tag));
		}
		return psVo;
		
	} // End of psSetVo()
	
	

	
	
	
} // End of ApplyServlet()
