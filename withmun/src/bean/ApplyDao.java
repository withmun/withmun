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
	
	
	
	/*
	 * 생성자(dao객체 만들자마자 커넥션까지!)
	 */
	public ApplyDao() {
		conn = new DBConnection().getConn();
	}
	
	/*
	 * 메소드들
	 */
	
	
	
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
		
		String sql = " update apply set "
				   + " SUNGJANG = ?, "
				   + " CHARACT = ?, "
				   + " MOTIVE = ?, "
				   + " FUTURE = ?, "
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
	
} // End of ApplyDao
