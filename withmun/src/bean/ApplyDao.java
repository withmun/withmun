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
	
	
	public boolean insert(ApplyVo aVo) {
		boolean b = true;
		String sql = "insert into apply "
				   + " (ANO, 					EMAIL,PWD,FIELD,NAME, PHOTOC, PHOTOS, JUMIN1, JUMIN2, ADDR, ZIPCODE) "
				   + " VALUES(SEQ_APPLY.NEXTVAL, ?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, aVo.getEmail());
			ps.setString(2, aVo.getPwd());
			ps.setString(3, aVo.getField());
			ps.setString(4, aVo.getName());
			ps.setString(5, aVo.getPhotoC());
			ps.setString(6, aVo.getPhotoS());
			ps.setString(7, aVo.getJumin1());
			ps.setString(8, aVo.getJumin2());
			ps.setString(9, aVo.getAddr());
			ps.setString(10, aVo.getZipCode());
			
			int cnt = ps.executeUpdate();
			if (cnt <=0) b=false;
 		}catch(Exception ex) {
 			ex.printStackTrace();
 			b = false;
 		}finally {
			return b;
 		}
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
	
	public boolean modify() {
		boolean b = true;
		
		return b;
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
