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

/**
 * @author JHTA
 *
 */
public class ApplyDao {
	
	/*
	 * 필드
	 */
	
	// DB처리 관련 변수들
	Connection conn = null;
	PreparedStatement ps = null;
	
	// 페이징처리 관련 변수들
	   int listSize = 5; // 한 페이지안에 데이터 수
	   int blockSize = 2; // 
	   int nowPage = 1; // 현제 페이지

	   int totSize = 0 ; // 전체 데이터 양
	   int totPage = 0;
	   int totBlock = 0;
	   int nowBlock = 0;

	   int endPage = 0;
	   int startPage = 0;

	   int endNo = 0; 
	   int startNo = 0;
	   
	   
	
	
	/*
	 * 생성자(dao객체 만들자마자 커넥션까지!)
	 */
	public ApplyDao() {
		conn = new DBConnection().getConn();
	}
	
	/*
	 * 메소드들
	 */
	
	/* 이력서 리스트 페이지 */
	   public void pageCompute(String findstr) {
	      String sql = 
	             "select count(pwd) cnt from apply where "
	            + "field like ? "
	            + "or name like ? "
	            + "or email like ? ";
	      
	      try {
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ps.setString(1,  "%" + findstr + "%");
	         ps.setString(2,  "%" + findstr + "%");
	         ps.setString(3,  "%" + findstr + "%");
	         
	         ResultSet rs = ps.executeQuery();
	         rs.next();
	         totSize = rs.getInt("cnt");
	         
	         totPage = (int)Math.ceil(totSize/(double)listSize);
	         totBlock = (int)Math.ceil(totPage/(double)blockSize);
	         nowBlock = (int)Math.ceil(nowPage/(double)blockSize);
	         
	         endPage = nowBlock * blockSize;
	         if(totPage < endPage) {
	            endPage = totPage;
	         }
	         
	         if((totSize % listSize) != 0) { // 전체 데이터가 리스트사아즈랑 맞아떨어지지않을때
	            if(nowPage == totPage) {
	            listSize = (totSize % listSize); // 마지막페이지의 리스트크기는 (전체데이터/리스트사이즈)의 나이머지 크기만큼으로 변환
	            }
	         }

	         startPage = endPage - blockSize + 1;
	         
	         if(startPage < 1) {
	            startPage = 1;
	         }

	         endNo = nowPage * listSize;
	         if(totSize < endNo) {
	            endNo = totSize;
	         }
	         startNo = endNo - listSize + 1;
	         if(startNo < 1) {
	            startNo = 1;
	         }
	      }catch(Exception ex) {
	         ex.printStackTrace();
	      }finally {
	      }
	   }   
	   
	   // 이력서 리스트
	   public List<ApplyVo> selectList(String findstr){
	      pageCompute(findstr);
	      List<ApplyVo> list = new ArrayList<>();
	      String sql = "select * from(select rownum nu, r.* from(select * from apply where "
	      + "field like ? "
	      + "or name like ? "
	      + "or email like ?)r )where nu between ? and ? and apply_date is not null";
	      
	      try {
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ps.setString(1,  "%" + findstr + "%");
	         ps.setString(2,  "%" + findstr + "%");
	         ps.setString(3,  "%" + findstr + "%");
	         ps.setInt(4, startNo);
	         ps.setInt(5, endNo);
	         
	         ResultSet rs = ps.executeQuery();
	         while(rs.next()) {
	            ApplyVo v = new ApplyVo();
	            v.setaNo(rs.getInt("ano"));
	            v.setField(rs.getString("field"));
	            v.setEmail(rs.getString("email"));
	            v.setName(rs.getString("name"));
	            v.setApplyDate(rs.getString("apply_date"));
	            
	            list.add(v);
	         }
	         
	      }catch(Exception ex) {
	         ex.printStackTrace();
	         list = null;
	      }finally {
	         try {
	            conn.close();
	            conn = null;
	         }catch(SQLException e) {
	            e.printStackTrace();
	         }
	         return list;
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
	
	
	// introduceUpdate.ap
	public boolean introduceUpdate(ApplyVo iuVo) {
		boolean b = true;
		
		String sql = " update APPLY set "
				   + " SUNGJANG = ?, "
				   + " CHARACT = ?, "
				   + " MOTIVE = ?, "
				   + " FUTURE = ? "
				   + " where EMAIL = ?";
				
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, iuVo.getSungJang());
			ps.setString(2, iuVo.getCharact());
			ps.setString(3, iuVo.getMotive());
			ps.setString(4, iuVo.getFuture());
			ps.setString(5, iuVo.getEmail());
			
			int cnt = ps.executeUpdate();
			if (cnt <=0) 		b=false;
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return b;
		}
	}
	
	
	// 입사지원 미리보기(apply_preview.jsp에서 사용)
	public ApplyVo selectOne(String email) {
		ApplyVo prvVo = null;
		String sql = " select * from apply where email = ? ";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,  email);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				prvVo = new ApplyVo();
				
				prvVo.setaNo(rs.getInt("ANO"));
				prvVo.setEmail(rs.getString("EMAIL"));
				prvVo.setPwd(rs.getString("PWD"));
				prvVo.setName(rs.getString("NAME"));
				prvVo.setField(rs.getString("FIELD"));
				prvVo.setJumin1(rs.getString("JUMIN1"));
				prvVo.setJumin2(rs.getString("JUMIN2"));
				prvVo.setAddr(rs.getString("ADDR"));
				prvVo.setZipCode(rs.getString("ZIPCODE"));

				
				// tel 자르기
				String rsTel;
				String[] arrTel;
				String tel1, tel2, tel3;
				
				rsTel = rs.getString("TEL");
				arrTel = rsTel.split("-");
				
				tel1 = arrTel[0];
				tel2 = arrTel[1];
				tel3 = arrTel[2];
				
				prvVo.setTel1(tel1);
				prvVo.setTel2(tel2);
				prvVo.setTel3(tel3);
				
				
				// mobile 자르기
				String rsMobile;
				String[] arrMobile;
				String mobile1, mobile2, mobile3;
				
				rsMobile = rs.getString("MOBILE");
				arrMobile = rsMobile.split("-");
				
				mobile1 = arrMobile[0];
				mobile2 = arrMobile[1];
				mobile3 = arrMobile[2];
				
				prvVo.setMobile1(mobile1);
				prvVo.setMobile2(mobile2);
				prvVo.setMobile3(mobile3);
				
				
				prvVo.setHighName(rs.getString("HIGH_NAME"));
				prvVo.setHighStart(rs.getString("HIGH_START").substring(0, 10));
				prvVo.setHighFinish(rs.getString("HIGH_FINISH").substring(0, 10));
				prvVo.setHighJolUp(rs.getString("HIGH_JOLUP"));
				
				prvVo.setColName(rs.getString("COL_NAME"));
				prvVo.setColStart(rs.getString("COL_START").substring(0, 10));
				prvVo.setColFinish(rs.getString("COL_FINISH").substring(0, 10));
				prvVo.setColMajor(rs.getString("COL_MAJOR"));
				prvVo.setColGrade(rs.getString("COL_GRADE"));
				prvVo.setColJolUp(rs.getString("COL_JOLUP"));
				
				prvVo.setUnivName(rs.getString("UNIV_NAME"));
				prvVo.setUnivStart(rs.getString("UNIV_START").substring(0, 10));
				prvVo.setUnivFinish(rs.getString("UNIV_FINISH").substring(0, 10));
				prvVo.setUnivMajor(rs.getString("UNIV_MAJOR"));
				prvVo.setUnivGrade(rs.getString("UNIV_GRADE"));
				prvVo.setUnivJolUp(rs.getString("UNIV_JOLUP"));
				
				prvVo.setGradName(rs.getString("GRAD_NAME"));
				prvVo.setGradStart(rs.getString("GRAD_START").substring(0, 10));
				prvVo.setGradFinish(rs.getString("GRAD_FINISH").substring(0, 10));
				prvVo.setGradMajor(rs.getString("GRAD_MAJOR"));
				prvVo.setGradGrade(rs.getString("GRAD_GRADE"));
				prvVo.setGradJolUp(rs.getString("GRAD_JOLUP"));
				
				prvVo.setGunByul(rs.getString("GUN_BYUL"));
				prvVo.setGunByung(rs.getString("GUN_BYUNG"));
				prvVo.setGunGye(rs.getString("GUN_GYE"));
				prvVo.setGunStart(rs.getString("GUN_START").substring(0, 10));
				prvVo.setGunFinish(rs.getString("GUN_FINISH").substring(0, 10));
				prvVo.setGunPil(rs.getString("GUN_PIL"));
				prvVo.setGunMiPilWhy(rs.getString("GUN_MIPILWHY"));
				
				prvVo.setLang1Name(rs.getString("LANG1_NAME"));
				prvVo.setLang1Score(rs.getString("LANG1_SCORE"));
				prvVo.setLang1Date(rs.getString("LANG1_DATE").substring(0, 10));
				prvVo.setLang2Name(rs.getString("LANG2_NAME"));
				prvVo.setLang2Score(rs.getString("LANG2_SCORE"));
				prvVo.setLang2Date(rs.getString("LANG2_DATE").substring(0, 10));
				
				prvVo.setLicense1Name(rs.getString("LICENSE1_NAME"));
				prvVo.setLicense1Date(rs.getString("LICENSE1_DATE").substring(0, 10));
				prvVo.setLicense1Org(rs.getString("LICENSE1_ORG"));
				prvVo.setLicense2Name(rs.getString("LICENSE2_NAME"));
				prvVo.setLicense2Date(rs.getString("LICENSE2_DATE").substring(0, 10));
				prvVo.setLicense2Org(rs.getString("LICENSE2_ORG"));
				
				prvVo.setActivity1Content(rs.getString("ACTIVITY1_CONTENT"));
				prvVo.setActivity1Start(rs.getString("ACTIVITY1_START").substring(0, 10));
				prvVo.setActivity1Finish(rs.getString("ACTIVITY1_FINISH").substring(0, 10));
				prvVo.setActivity1Org(rs.getString("ACTIVITY1_ORG"));
				prvVo.setActivity2Content(rs.getString("ACTIVITY2_CONTENT"));
				prvVo.setActivity2Start(rs.getString("ACTIVITY2_START").substring(0, 10));
				prvVo.setActivity2Finish(rs.getString("ACTIVITY2_FINISH").substring(0, 10));
				prvVo.setActivity2Org(rs.getString("ACTIVITY2_ORG"));
				
				prvVo.setFamily1Rel(rs.getString		("FAMILY1_REL"));
				prvVo.setFamily1Name(rs.getString		("FAMILY1_NAME"));
				prvVo.setFamily1Birth(rs.getString		("FAMILY1_BIRTH").substring(0, 10));
				prvVo.setFamily1Academic(rs.getString	("FAMILY1_ACADEMIC"));
				prvVo.setFamily1Job(rs.getString		("FAMILY1_JOB"));
				prvVo.setFamily1Company(rs.getString	("FAMILY1_COMPANY"));
				prvVo.setFamily1Position(rs.getString	("FAMILY1_POSITION"));
				prvVo.setFamily1Livewith(rs.getString	("FAMILY1_LIVEWITH"));
				
				prvVo.setFamily2Rel(rs.getString		("FAMILY2_REL"));        
				prvVo.setFamily2Name(rs.getString		("FAMILY2_NAME"));       
				prvVo.setFamily2Birth(rs.getString		("FAMILY2_BIRTH").substring(0, 10));      
				prvVo.setFamily2Academic(rs.getString	("FAMILY2_ACADEMIC"));   
				prvVo.setFamily2Job(rs.getString		("FAMILY2_JOB"));        
				prvVo.setFamily2Company(rs.getString	("FAMILY2_COMPANY"));    
				prvVo.setFamily2Position(rs.getString	("FAMILY2_POSITION"));   
				prvVo.setFamily2Livewith(rs.getString	("FAMILY2_LIVEWITH"));   
				
				prvVo.setFamily3Rel(rs.getString		("FAMILY3_REL"));        
				prvVo.setFamily3Name(rs.getString		("FAMILY3_NAME"));       
				prvVo.setFamily3Birth(rs.getString		("FAMILY3_BIRTH").substring(0, 10));      
				prvVo.setFamily3Academic(rs.getString	("FAMILY3_ACADEMIC"));   
				prvVo.setFamily3Job(rs.getString		("FAMILY3_JOB"));        
				prvVo.setFamily3Company(rs.getString	("FAMILY3_COMPANY"));    
				prvVo.setFamily3Position(rs.getString	("FAMILY3_POSITION"));   
				prvVo.setFamily3Livewith(rs.getString	("FAMILY3_LIVEWITH"));   
				
				prvVo.setFamily4Rel(rs.getString		("FAMILY4_REL"));        
				prvVo.setFamily4Name(rs.getString		("FAMILY4_NAME"));       
				prvVo.setFamily4Birth(rs.getString		("FAMILY4_BIRTH").substring(0, 10));      
				prvVo.setFamily4Academic(rs.getString	("FAMILY4_ACADEMIC"));   
				prvVo.setFamily4Job(rs.getString		("FAMILY4_JOB"));        
				prvVo.setFamily4Company(rs.getString	("FAMILY4_COMPANY"));    
				prvVo.setFamily4Position(rs.getString	("FAMILY4_POSITION"));   
				prvVo.setFamily4Livewith(rs.getString	("FAMILY4_LIVEWITH"));   
				
				prvVo.setHobby(rs.getString("HOBBY"));
				prvVo.setSpecial(rs.getString("SPECIAL"));
				prvVo.setReligion(rs.getString("RELIGION"));
				prvVo.setBoHun(rs.getString("BOHUN"));
				
				prvVo.setSungJang(rs.getString("SUNGJANG"));
				prvVo.setCharact(rs.getString("CHARACT"));
				prvVo.setMotive(rs.getString("MOTIVE"));
				prvVo.setFuture(rs.getString("FUTURE"));
				
				prvVo.setPhotoC(rs.getString("PHOTOC"));
				prvVo.setPhotoS(rs.getString("PHOTOS"));
			}
			
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
			prvVo = null;
			
		}finally {
			return prvVo;
			
		}
		
		
	}
	
	
	/*
	 * Getters and Setters
	 */
	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public PreparedStatement getPs() {
		return ps;
	}

	public void setPs(PreparedStatement ps) {
		this.ps = ps;
	}

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
	
	
	
	
	
	
	
	
	
	
	
	
	
} // End of ApplyDao
