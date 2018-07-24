package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.http.fileupload.FileUpload;

import com.oreilly.servlet.MultipartRequest;

public class ApplyDao {
	
	/*
	 * 필드
	 */
	
	// DB처리 관련 변수들
	Connection conn = null;
	PreparedStatement ps = null;
	
	
	// 페이징 처리를 위한 11개의 변수 (3개는 초기값 지정해주기)
	int listSize = 5;
	int blockSize = 3;
	int nowPage = 1;
	
	int totSize = 0;
	int totPage = 0;
	int totBlock = 0;
	int nowBlock = 0;
	
	int endPage = 0;
	int startPage = 0;
	int endNo = 0;
	int startNo = 0;
	
	
	/*
	 * 페이징처리 관련변수 Getter/Setter
	 */
	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getTotSize() {
		return totSize;
	}

	public void setTotSize(int totSize) {
		this.totSize = totSize;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}

	public int getTotBlock() {
		return totBlock;
	}

	public void setTotBlock(int totBlock) {
		this.totBlock = totBlock;
	}

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	
	
	/*
	 * 생성자(dao객체 만들자마자 커넥션까지!)
	 */
	public ApplyDao() {
		conn = new DBConnection().getConn();
	}
	
	/*
	 * 메소드들
	 */
	
	// 페이징처리 계산메소드
	public void pageCompute(String findStr) {
		String sql = " select count(serial) cnt from board where "
				   + " id like ? "
				   + " subject like ? "
				   + " doc like ? ";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			ps.setString(3, "%" + findStr + "%");
			
			ResultSet rs = ps.executeQuery();
			rs.next();
			
			totSize = rs.getInt("cnt");
			
			// totSize를 가져왔으므로, 이제 아래 변수들을 공식에 따라 계산할 수 있따.
			totPage = (int)Math.ceil(totSize/(double)listSize);
			totBlock = (int)Math.ceil(totPage/(double)blockSize);
			nowBlock = (int)Math.ceil(nowPage/(double)blockSize);
			
			endPage = nowBlock*blockSize;
			startPage = endPage - blockSize +1;
			if (endPage > totPage) endPage = totPage;
			if (startPage <1) startPage = 1;
			
			endNo = nowPage * listSize;
			startNo = endNo - listSize;
			if (endNo > totSize) endNo = totSize;
			if (startNo <1) startNo = 1;
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	
	// profileInsert.ap
	public boolean profileInsert(ApplyVo piVo) {
		boolean b = true;
		String sql =
		  " insert into APPLY ( "
		+ " ANO,EMAIL,PWD,NAME,FIELD, "
		+ " JUMIN1,JUMIN2,ADDR,ZIPCODE,TEL,MOBILE, "
		+ " HIGH_NAME,HIGH_START,HIGH_FINISH,HIGH_JOLUP, "
		+ " COL_NAME,COL_START,COL_FINISH,COL_MAJOR,COL_GRADE,COL_JOLUP, "
		+ " UNIV_NAME,UNIV_START,UNIV_FINISH,UNIV_MAJOR,UNIV_GRADE,UNIV_JOLUP, "
		+ " GRAD_NAME,GRAD_START,GRAD_FINISH,GRAD_MAJOR,GRAD_GRADE,GRAD_JOLUP,  "
		+ "	GUN_BYUL,GUN_BYUNG,GUN_GYE,GUN_START,GUN_FINISH,GUN_PIL,GUN_MIPILWHY, "
		+ " LANG1_NAME,LANG1_SCORE,LANG1_DATE, "
		+ "	LANG2_NAME,LANG2_SCORE,LANG2_DATE, "
		+ "	LICENSE1_NAME,LICENSE1_DATE,LICENSE1_ORG, "
		+ " LICENSE2_NAME,LICENSE2_DATE,LICENSE2_ORG, "
		+ "	ACTIVITY1_CONTENT,ACTIVITY1_START,ACTIVITY1_FINISH,ACTIVITY1_ORG, "
		+ "	ACTIVITY2_CONTENT,ACTIVITY2_START,ACTIVITY2_FINISH,ACTIVITY2_ORG, "
		+ " FAMILY1_REL,FAMILY1_NAME,FAMILY1_BIRTH,FAMILY1_ACADEMIC,FAMILY1_JOB,FAMILY1_COMPANY,FAMILY1_POSITION,FAMILY1_LIVEWITH, "
		+ "	FAMILY2_REL,FAMILY2_NAME,FAMILY2_BIRTH,FAMILY2_ACADEMIC,FAMILY2_JOB,FAMILY2_COMPANY,FAMILY2_POSITION,FAMILY2_LIVEWITH, "
		+ "	FAMILY3_REL,FAMILY3_NAME,FAMILY3_BIRTH,FAMILY3_ACADEMIC,FAMILY3_JOB,FAMILY3_COMPANY,FAMILY3_POSITION,FAMILY3_LIVEWITH, "
		+ "	FAMILY4_REL,FAMILY4_NAME,FAMILY4_BIRTH,FAMILY4_ACADEMIC,FAMILY4_JOB,FAMILY4_COMPANY,FAMILY4_POSITION,FAMILY4_LIVEWITH, "
		+ "	HOBBY,SPECIAL,RELIGION,BOHUN, "
		+ "	SUNGJANG,CHARACT,MOTIVE,FUTURE, "
		+ "	PHOTOC,PHOTOS ) "
		
		+ " VALUES ( "		
		+ " ?, ?, ?, ?, ?, "
		+ " ?, ?, ?, ?, ?, ?, "
		+ " ?, ?, ?, ?, "
		+ " ?, ?, ?, ?, ?, ?,  "
		+ " ?, ?, ?, ?, ?, ?, "
		+ " ?, ?, ?, ?, ?, ?,  "
		+ " ?, ?, ?, ?, ?, ?, ?, "
		+ " ?, ?, ?, "
		+ " ?, ?, ?, "
		+ " ?, ?, ?, "
		+ " ?, ?, ?, "
		+ " ?, ?, ?, ?, "
		+ " ?, ?, ?, ?, " 
		+ " ?, ?, ?, ?, ?, ?, ?, ?, " 
		+ " ?, ?, ?, ?, ?, ?, ?, ?,  "
		+ " ?, ?, ?, ?, ?, ?, ?, ?,  "
		+ " ?, ?, ?, ?, ?, ?, ?, ?, "
		+ " ?, ?, ?, ?, "
		+ " ?, ?, ?, ?, "
		+ " ?, ? ) ";
				
				
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, piVo.getaNo() );
			ps.setString(2, piVo.getEmail()) ;
			ps.setString(3, piVo.getPwd() );
			ps.setString(4, piVo.getName() );
			ps.setString(5, piVo.getField() );
			
			ps.setString(6, piVo.getJumin1() );
			ps.setString(7, piVo.getJumin2() );
			ps.setString(8, piVo.getAddr() );
			ps.setString(9, piVo.getZipCode()  );
			ps.setString(10, piVo.getTel()  );
			ps.setString(11, piVo.getMobile());
			
			// 학업
			ps.setString(12, piVo.getHighName()  );
			ps.setString(13, piVo.getHighStart()  );
			ps.setString(14, piVo.getHighFinish()  );
			ps.setString(15, piVo.getHighJolUp().trim());
		
			ps.setString(16, piVo.getColName()  );
			ps.setString(17, piVo.getColStart()  );
			ps.setString(18, piVo.getColFinish()  );
			ps.setString(19, piVo.getColMajor()  );
			ps.setString(20, piVo.getColGrade() );
			ps.setString(21, piVo.getColJolUp().trim() );
		
			ps.setString(22, piVo.getUnivName() );
			ps.setString(23, piVo.getUnivStart() );
			ps.setString(24, piVo.getUnivFinish() );
			ps.setString(25, piVo.getUnivMajor() );
			ps.setString(26, piVo.getUnivGrade());
			ps.setString(27, piVo.getUnivJolUp().trim() );
			
			ps.setString(28, piVo.getGradName());
			ps.setString(29, piVo.getGradStart() );
			ps.setString(30, piVo.getGradFinish() );
			ps.setString(31, piVo.getGradMajor() );
			ps.setString(32, piVo.getGradGrade() );
			ps.setString(33, piVo.getGradJolUp().trim() );
			
			ps.setString(34, piVo.getGunByul() );
			ps.setString(35, piVo.getGunByung() );
			ps.setString(36, piVo.getGunGye() );
			ps.setString(37, piVo.getGunStart() );
			ps.setString(38, piVo.getGunFinish() );
			ps.setString(39, piVo.getGunPil() );
			ps.setString(40, piVo.getGunMiPilWhy() );
			
			ps.setString(41, piVo.getLang1Name() );
			ps.setString(42, piVo.getLang1Score() );
			ps.setString(43, piVo.getLang1Date() );
			ps.setString(44, piVo.getLang2Name() );
			ps.setString(45, piVo.getLang2Score() );
			ps.setString(46, piVo.getLang2Date() );
			
			ps.setString(47, piVo.getLicense1Name() );
			ps.setString(48, piVo.getLicense1Date() );
			ps.setString(49, piVo.getLicense1Org() );
			ps.setString(50, piVo.getLicense2Name() );
			ps.setString(51, piVo.getLicense2Date() );
			ps.setString(52, piVo.getLicense2Org() );
			
			ps.setString(53, piVo.getActivity1Content() );
			ps.setString(54, piVo.getActivity1Start() );
			ps.setString(55, piVo.getActivity1Finish() );
			ps.setString(56, piVo.getActivity1Org() );
			ps.setString(57, piVo.getActivity2Content() );
			ps.setString(58, piVo.getActivity2Start() );
			ps.setString(59, piVo.getActivity2Finish() );
			ps.setString(60, piVo.getActivity2Org() );
			
			ps.setString(61, piVo.getFamily1Rel()       );
			ps.setString(62, piVo.getFamily1Name()      );
			ps.setString(63, piVo.getFamily1Birth()        );
			ps.setString(64, piVo.getFamily1Academic()    );
			ps.setString(65, piVo.getFamily1Job()        );
			ps.setString(66, piVo.getFamily1Company()    );
			ps.setString(67, piVo.getFamily1Position()    );
			ps.setString(68, piVo.getFamily1Livewith()   );
			
			ps.setString(69, piVo.getFamily2Rel()       );
			ps.setString(70, piVo.getFamily2Name()      );
			ps.setString(71, piVo.getFamily2Birth()     );
			ps.setString(72, piVo.getFamily2Academic()  );
			ps.setString(73, piVo.getFamily2Job()       );
			ps.setString(74, piVo.getFamily2Company()   );
			ps.setString(75, piVo.getFamily2Position()  );
			ps.setString(76, piVo.getFamily2Livewith()  );
			
			ps.setString(77, piVo.getFamily3Rel()       );
			ps.setString(78, piVo.getFamily3Name()      );
			ps.setString(79, piVo.getFamily3Birth()     );
			ps.setString(80, piVo.getFamily3Academic()  );
			ps.setString(81, piVo.getFamily3Job()       );
			ps.setString(82, piVo.getFamily3Company()   );
			ps.setString(83, piVo.getFamily3Position()  );
			ps.setString(84, piVo.getFamily3Livewith()  );
			
			ps.setString(85, piVo.getFamily4Rel()       );
			ps.setString(86, piVo.getFamily4Name()      );
			ps.setString(87, piVo.getFamily4Birth()     );
			ps.setString(88, piVo.getFamily4Academic()  );
			ps.setString(89, piVo.getFamily4Job()       );
			ps.setString(90, piVo.getFamily4Company()   );
			ps.setString(91, piVo.getFamily4Position()  );
			ps.setString(92, piVo.getFamily4Livewith()  );
			
			ps.setString(93, piVo.getHobby()  );
			ps.setString(94, piVo.getSpecial()  );
			ps.setString(95, piVo.getReligion()  );
			ps.setString(96, piVo.getBoHun()  );
			
			// 자기소개 페이지			
			ps.setString(97, ""  );
			ps.setString(98, ""  );
			ps.setString(99, ""  );
			ps.setString(100, "" );
			
			// photoC, photoS
			ps.setString(101, piVo.getPhotoC());
			ps.setString(102, piVo.getPhotoS());

			
			int cnt = ps.executeUpdate();
			if (cnt <=0) 	b = false;
		}catch(Exception ex) {
			ex.printStackTrace();
			b = false;
		}
		return b;
	}
	
	
	
	
	
	// 게시물 목록 구하기(Apply - list)
/*	public List<ApplyVo> select(String findStr) {
		
		pageCompute(findStr);
		List<ApplyVo> list = new ArrayList<>();
		
		// 3중 쿼리!!!
		String sql = " select * from ( "
				   + "	  select rownum num, r.* from ( "
				   + " 		 select * from board where "
				   + " 			id like ? or "
				   + " 			subject like ? "
				   + "          doc like ? "
				   + "        )r "
				   + "     ) where num between ? and ? ";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			ps.setString(3, "%" + findStr + "%");
			ps.setInt(4,  startNo);
			ps.setInt(5, endNo);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ApplyVo v = new ApplyVo();
				v.setSerial(rs.getInt("serial"));
				v.setMdate(rs.getString("mdate").toString());		// ".toString()" 필요한지는 확인해보자.
				v.setId(rs.getString("id"));
				v.setPwd(rs.getString("pwd"));
				v.setSerial(rs.getInt("serial"));
				v.setDoc(rs.getString("doc"));
				
				v.setHit(rs.getInt("hit"));
				v.setGrp(rs.getInt("hit"));
				v.setDeep(rs.getString("deep"));
				v.setAttfile(rs.getString("attfile"));
				v.setFileori(rs.getString("fileori"));
				
				list.add(v);
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
			list = null;
		
		}finally {
			try {
				conn.close();				// 커넥션을 닫는다
				conn = null;				// GC가 빠르게 청소하게
			}catch(SQLException sqle) {
				sqle.printStackTrace();
			}
			return list;
		}
	}*/
	
	
	String method;
	String nav="";				// r기본값 주기
	String sess="";
	String aside="";
	
	
	//파일업로드 처리를 위한 변수들
	String uploadDir = "D:/bong/eclipse-workspace/1802_web3/WebContent/upload";
	String encType="UTF-8";
	int fileSize = 1024*1024*10;			// 용량제한 10MB
	
	
	
	/*
	 * 생성자 (객체 생성되면서 커넥션 마들어지도록
	 */
	
	/*
	 * 메소드들 분기
	 */
	
	// 글 새로 쓰기
	/*public boolean register(HttpServletRequest req) {
		boolean b = true;
		
		// 파일업로드 처리
		MultipartRequest multi = fileUpload(req);
		
		BoardDao dao = new BoardDao();
		BoardVo v = setVo(multi);
		String msg = "";
		
		// 데이터 저장
		String sql = " insert into board values( "
				   + " SEQ_BOARD.NEXTVAL, "
				   + " SYSDATE, "
				   + " ?, ?, ?, ? "						// ID, PWD, SUBJCT, DOC
				   + " 0, "
				   + " SEQ_BOARD.CURRVAL, "
				   + " SEQ_BOARD.CURRVAL, "
				   + " ?, ?"							// ATTFILE. FILEORI
				   + " ) ";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, v.getId());
			ps.setString(2, v.getPwd());
			ps.setString(3, v.getSubject());
			ps.setString(4, v.getDoc());
			ps.setString(5, v.getAttfile());
			ps.setString(6, v.getFileori());
			
		}catch(Exception ex) {
			ex.printStackTrace();
			b = false;
		}finally {
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		return b;
	}*/
	
	public List<ApplyVo> list(String findStr) {
		List<ApplyVo> list = null;
		
		return list;
	}
	
	public ApplyVo seletcOne(int serial) {
		ApplyVo vo = null;
		
		return vo;
	}
	


	
	public boolean delete(int serial) {
		boolean b = true;
		
		return b;
	}
	
	
	public boolean rep() {
		boolean b = true;
		
		return b;
	}
	
	

	
	

	
	
	// registerR, modifyR, repR
	/*public BoardVo setVo (MultipartRequest multi) {
		BoardVo v = new BoardVo();
		
		// 공통적으로 필요함
		v.setId(multi.getParameter("id"));
		v.setPwd(multi.getParameter("pwd"));
		v.setSubject(multi.getParameter("subject"));
		v.setDoc(multi.getParameter("doc"));
		
		// 수정할때만 필요함
		if (multi.getParameter("serial") != null) {
			v.setSerial(Integer.parseInt(multi.getParameter("serial")));
		}
		
		// 답변글 처리시에만 사용
		if (multi.getParameter("grp") !=null) {
			v.setGrp(Integer.parseInt(multi.getParameter("grp")));
			v.setDeep(multi.getParameter("deep"));
		}
		
//		v.setHit(Integer.parseInt(multi.getParameter("hit")));
//		v.setMdate(multi.getParameter("mdata"));
		
		// file 태그명과 원본파일명, 변경된 파일명의 정보
		Enumeration tags = multi.getFileNames();
		while(tags.hasMoreElements()) {
			String tag = (String)tags.nextElement();
			String fileNmae = multi.getOriginalFileName(tag);		// 클라이언트에서의 파일명(업로드 전)
			String reName = multi.getFilesystemName(tag);			// 서버에서의 파일명(업로드 후)
			
			v.setAttfile(reName);
			v.setFileori(fileNmae);
		}
		return v;
	}*/
	
	
	// list, view, modify (오버로딩)
	/*public BoardVo setVo (ResultSet rs) {
		BoardVo v = new BoardVo();
		
		try {
			
			v.setSerial(rs.getInt("serial"));
			v.setMdate(rs.getString("mdate").toString());		// ".toString()" 필요한지는 확인해보자.
			v.setId(rs.getString("id"));
			v.setPwd(rs.getString("pwd"));
			v.setSubject(rs.getInt("subject"));
			v.setDoc(doc);
			
			v.setHit(hit);
			v.setGrp(grp);
			v.setDeep(deep);
			v.setAttfile(attfile);
			v.setFileori(fileori);
		
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		
		
		// 공통적으로 필요함
		
		v.setId(multi.getParameter("id"));
		v.setPwd(multi.getParameter("pwd"));
		v.setSubject(multi.getParameter("subject"));
		v.setDoc(multi.getParameter("doc"));
		
		// 수정할때만 필요함
		if (multi.getParameter("serial") != null) {
			v.setSerial(Integer.parseInt(multi.getParameter("serial")));
		}
		
		// 답변글 처리시에만 사용
		if (multi.getParameter("grp") !=null) {
			v.setGrp(Integer.parseInt(multi.getParameter("grp")));
			v.setDeep(multi.getParameter("deep"));
		}
		
//		v.setHit(Integer.parseInt(multi.getParameter("hit")));
//		v.setMdate(multi.getParameter("mdata"));
		
		// file 태그명과 원본파일명, 변경된 파일명의 정보
		Enumeration tags = multi.getFileNames();
		while(tags.hasMoreElements()) {
			String tag = (String)tags.nextElement();
			String fileNmae = multi.getOriginalFileName(tag);		// 클라이언트에서의 파일명(업로드 전)
			String reName = multi.getFilesystemName(tag);			// 서버에서의 파일명(업로드 후)
			
			v.setAttfile(reName);
			v.setFileori(fileNmae);
		}
		return v;
	}*/
	
} // End of BoardDao
