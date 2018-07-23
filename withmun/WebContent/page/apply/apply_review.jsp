<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrapper">
	<div class="container">
		<div class ="top">
			<a href="/" >HOME</a>
			> <a href="./service_procedure.do">Other</a>
			> <a href="./apply_enter.ap">입사지원</a>
			> <a href="./apply_review.ap">지원서 보기</a>
		</div>
		
		<div class="toptit">
		    <h2><a href="./apply_review.ap">지원서 보기</a></h2>
			<p>능력있는 인재들의 지원을 기다립니다.</p>
		</div>	
	</div>
</div>
<!------------------------------------------------------------------->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$(".jtoggle_up").click(function(){
		$(".toggle_menu").slideDown();
		$(".jtoggle_down").css("display","block");
		$(".jtoggle_up").css("display","none");	
	});
	$(".jtoggle_down").click(function(){
		$(".toggle_menu").slideUp();
		$(".jtoggle_down").css("display","none");
		$(".jtoggle_up").css("display","block");	
	});

	$(".jtoggle_up2").click(function(){
		$(".toggle_menu2").slideDown();
		$(".jtoggle_down2").css("display","block");
		$(".jtoggle_up2").css("display","none");
	});
	$(".jtoggle_down2").click(function(){
		$(".toggle_menu2").slideUp();
		$(".jtoggle_down2").css("display","none");
		$(".jtoggle_up2").css("display","block");	
	});
});

// 페이지가 로딩되면 실행됨
function pageLoad() {
	var f = document.frm_profile;
	
	// [임시저장] 버튼 클릭시
	f.btnSave.onclick = function() {
		f.action = './profileSave.ap';
		f.submit();
	}
	
	if ( !('{$requestScope.msg}' == null) && !('${requestScope.msg}' == '')) {
		alert('${requestScope.msg}');
	}
	
	
} // End of pageLoad()

</script>
<!------------------------------------------------------------------->
<style>

.content {
	width:100%;
}

#wrap_preview {
	text-align: left;
	padding: 10px;
	border: 1px solid gray;
	margin: 0 auto;
}
#pic {
	border: 1px solid black;
	background-image: url('http://via.placeholder.com/120x90');
	width: 120px;
	height: 90px;
}

.sectionTitle {
	margin-top: 16px;
	margin-bottom: 4px;
}

table {
	display: inline-block;
	border: 1px solid gray;
}

th {
	background-color: skyblue;
}

th, td {
	border: 1px solid black;
}


#sign {
	text-align: right;
}

#buttons {
	margin-top: 30px;
	
	margin-ㄹttom: 20px;
	text-align: center;
}

</style>

<div class="main">
	<div class="main_wrap">
		<div class="content">
			<div class="content_second" style="width:100%;margin-top: 0; text-align: center">
				
				<!-- 여기에 내용을 넣는다 -->
				<div id='wrap_preview'>
					
					<h1>입사지원서</h1>
						<form name='frm_preview' method='post' encType='multipart/form-data'>
								<div id='pic'>
								사진
								</div>
								
								<h5 class='sectionTitle'>지원정보</h5>
								<table>
									<tr>
										<th>지원분야</th>
										<td><input type='text' name='field' /><br></td>
										<th>이름</th>
										<td><input type='text' name='name' /></td>	
									</tr>	
									<tr>
										<th>주민등록번호</th>
										<td><input type='text' name='jumin1' size='6'/> - <input type='text' name='jumin2' size='7'/></td>
										<th>E-Mail</th>
										<td><input type='email' name='email' /></td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td><input type='text' name='pwd' /></td>
										<th>비밀번호확인</th>
										<td><input type='text' name='pwdCheck' /></td>
									</tr>
								</table>
								
								<h5 class='sectionTitle'>연락처</h5>
								<table id='tbl_contact'>
									<tr>
										<th>주소</th>
										<td colspan='5'><input type='text' name='addr'  /></td>
									</tr>
									<tr>
										<th>우편번호</th>
										<td><input type='text' name='zipCode' /></td>
										<th>전화번호</th>
										<td>
											<input type='text' name='tel1' size='3' />-
											<input type='text' name='tel2' size='4'/>-
											<input type='text' name='tel3' size='4 '/>
										</td>
										<th>휴대전화</th>
										<td>
											<input type='text' name='mobile1' size='3' />-
											<input type='text' name='mobile2' size='4'/>-
											<input type='text' name='mobile3' size='4 '/>
											
										</td>
									</tr>
								</table>
								
								
								<h5 class='sectionTitle'>학력사항</h5>
								<table id='tbl_study'>
									<tr>
									<th>기간</th><th>학교명		</th><th>전공</th><th>평점</th><th>졸업여부</th>
									
									<tr>
										<td><input type='date' name='highStart'> -
										<input type='date' name='highFinish'></td>
										<td><input type='text' name='highName' size='6'/>고등학교</td>
										<td>-</td><td>- </td>
										<td><input type='radio' name='radioHighJolup'>졸업
											<input type='radio' name='radioHighJolup'>졸업예정
										</td>
									</tr>
									
									<tr>
										<td><input type='date' name='colStart'> -
										<input type='date' name='colFinish'></td>
										<td><input type='text' name='colName' size='6'/>대학</td>
										<td><input type='text' name='colMajor' size='6'/></td>
										<td><input type='text' name='colGrade' size='6'/></td>
										<td><input type='radio' name='radioHighJolup'>졸업
											<input type='radio' name='radioHighJolup'>졸업예정
										</td>
									</tr>
									
									<tr>
										<td><input type='date' name='univStart'> -
										<input type='date' name='univFinish'></td>
										<td><input type='text' name='univName' size='6'/>대학교</td>
										<td><input type='text' name='univMajor' size='6'/></td>
										<td><input type='text' name='univGrade' size='6'/></td>
										<td><input type='radio' name='radioUnivJolup'>졸업
											<input type='radio' name='radioUnivJolup'>졸업예정
										</td>
									</tr>
									
									<tr>
										<td><input type='date' name='gradStart'> -
										<input type='date' name='gradFinish'></td>
										<td><input type='text' name='gradName' size='6'/>대학원</td>
										<td><input type='text' name='gradMajor' size='6'/></td>
										<td><input type='text' name='gradGrade' size='6'/></td>
										<td><input type='radio' name='radioGradJolup'>졸업
											<input type='radio' name='radioGradJolup'>졸업예정
										</td>
									</tr>
								</table>
				
								<h5 class='sectionTitle'>병역</h5>	
								<table id='tbl_military'>
									<tr>
										<th>군별</th><th>병과</th><th>계급</th><th>복무기간</th><th>제대구분</th><th>미필사유</th>
									</tr>
									<tr>
										<td><input type='text' name='gunByul' size='6' /></td>
										<td><input type='text' name='gunByung' size='6' /></td>
										<td><input type='text' name='gunGye' size='6'/></td>
										<td>
											<input type='date' name='gunStart' /> ~
											<input type='date' name='gunFinish' />
										</td>
										<td>
											<input type='radio' name='radiogunPil' /> 필  
											<input type='radio' name='radiogunPil' /> 미필
										</td>
										<td><input type='text' name='gunMiPilWhy' size='10'/></td>
									</tr>					
								</table>
								
								<h5 class='sectionTitle'>외국어/자격면허</h5>
								<table id='tbl_lang'>
									<tr>
										<th>외국어시험명</th><th>공인점수</th><th>시험일</th>
									</tr>
									<tr>
										<td><input type='text' name='lang1Name' size='6'/></td>
										<td><input type='text' size='3' name='lang1Score'/>점</td>
										<td><input type='date' name='lang1Date' /></td>
										
									</tr>
									<tr>
										<td><input type='text' name='lang2Name' size='6'/></td>
										<td><input type='text' size='3' name='lang2Score'/>점</td>
										<td><input type='date' size='3' name='lang2Date'/></td>
									</tr>
								</table>		
								
								<table id='tbl_license'>
									<tr>
										<th>자격명</th><th>취득일</th><th>시행처</th>
									</tr>
									<tr>
										<td><input type='text' name='license1Name' /></td>
										<td><input type='date' name='license1Date' /></td>
										<td><input type='text' name='license1Org' /></td>						
									</tr>
									<tr>
										<td><input type='text' name='license2Name' /></td>
										<td><input type='date' name='license2Date' /></td>
										<td><input type='text' name='license2Org' /></td>	
									</tr>
								</table>	
								
								<h5 class='sectionTitle'>동아리 및 사회봉사활동</h5>
								<table id='tbl_activity'>
									<tr>
										<th>활동기관(단체)</th><th>활동기간</th><th>활동내용</th>
									</tr>
									<tr>
										<td><input type='text' name='activity1Org' size='10'></td>
										<td>
											<input type='date' name='activity1Start' /> ~
											<input type='date' name='activity1Finish' />
										</td>
										<td>
										<input type='text' name='activity1Content'/>
										</td>
									</tr>
									<tr>
										<td><input type='text' name='activity2Org' size='10'></td>
										<td>
											<input type='date' name='activity2Start' /> ~
											<input type='date' name='activity2Finish' />
										</td>
										<td>
										<input type='text' name='activity2Content'/>
										</td>
									</tr>
								</table>
								
								
								<h5 class='sectionTitle'>가족사항</h5>
								<table id='tbl_family'>
									<tr>
										<th>관계</th><th>성명</th><th>생년월일</th><th>최종학력</th><th>직업</th><th>회사명</th><th>직위</th><th>동거여부</th>
									</tr>
									<tr>
										<td><input type='text' name='family1Rel' size='4' /></td>
										<td><input type='text' name='family1Name' size='4' /> </td>
										<td><input type='date' name='family1Birth'/></td>
										<td><input type='text' name='family1Academic' size='6' /></td>
										<td><input type='text' name='family1Job'  size='6'></td>
										<td><input type='text' name='family1Company'  size='6'></td>
										<td><input type='text' name='family1Position'  size='6'></td>
										<td>
										<input type='radio' name='radioFamily1Livewith' />Y
										<input type='radio' name='radioFamily1Livewith' />N
										</td>
									</tr>
									<tr>
										<td><input type='text' name='family2Rel' size='4' /></td>
										<td><input type='text' name='family2Name' size='4' /> </td>
										<td><input type='date' name='family2Birth'></td>
										<td><input type='text' name='family2Academic' size='6' /></td>
										<td><input type='text' name='family2Job'  size='6'></td>
										<td><input type='text' name='family2Company'  size='6'></td>
										<td><input type='text' name='family2Position'  size='6'></td>
										<td>
										<input type='radio' name='radioFamily2Livewith' />Y
										<input type='radio' name='radioFamily2Livewith' />N
										</td>
									</tr>
									<tr>
										<td><input type='text' name='famly3Rel' size='4' /></td>
										<td><input type='text' name='family3Name' size='4' /> </td>
										<td><input type='date' name='family3Birth'></td>
										<td><input type='text' name='family3Academic' size='6' /></td>
										<td><input type='text' name='family3Job'  size='6'></td>
										<td><input type='text' name='family3Company'  size='6'></td>
										<td><input type='text' name='family3Position'  size='6'></td>
										<td>
										<input type='radio' name='radioFamily3Livewith' />Y
										<input type='radio' name='radioFamily3Livewith' />N
										</td>
									</tr>
									<tr>
										<td><input type='text' name='family4Rel' size='4' /></td>
										<td><input type='text' name='family4Name' size='4' /> </td>
										<td><input type='date' name='family4Birth'></td>
										<td><input type='text' name='family4Academic' size='6' /></td>
										<td><input type='text' name='family4Job'  size='6'></td>
										<td><input type='text' name='family4Company'  size='6'></td>
										<td><input type='text' name='family4Position'  size='6'></td>
										<td>
										<input type='radio' name='radioFamily4Livewith' />Y
										<input type='radio' name='radioFamily4Livewith' />N
										</td>
									</tr>
								
								</table>
								
								<h5 class='sectionTitle'>기타사항</h5>
								<table id='tbl_etc'>
									<tr>
										<th>취미</th><th>특기</th><th>종교</th><th>보훈대상</th>
									</tr>
									
									<tr>	
										<td>
											<input type='text' name='hobby' />
										</td>
										<td>
											<input type='text' name='special' />
										</td>
										<td>
											<input type='text' name='religion' />
										</td>
										<td>
											<input type='radio' name='radioBoHun' />Y
											<input type='radio' name='radioBoHun' />N
										</td>
									</tr>
									
								</table>
								
							<!-- 자기소개 -->
							<h5 class='sectionTitle'>성장과정(1,000자 이내)</h5>
							<textarea name='growing' rows='8' cols='137'>
							</textarea>
								
							<h5 class='sectionTitle'>성격 및 장단점(1,000자 이내)</h5>				
							<textarea name='character' rows='8' cols='137'>
							</textarea>
							
							<h5 class='sectionTitle'>지원동기(1,000자 이내)</h5>
							<textarea name='motive' rows='8' cols='137'>
							</textarea>
							
							<h5 class='sectionTitle'>입사 후 포부(1,000자 이내)</h5>
							<textarea name='future' rows='8' cols='137'>
							</textarea>
								
								
							<div id='sign'>
								<p>지원서의 모든 기재사항은 사실과 다름이 없음을 확인합니다. </p>
								<p>2018 년 07 월 22 일	   </p>
								<p>지원자:   이봉기     (서명) </p>
							</div>
								
				
							<div id='buttons'>
								<input type='button' name='btnPrint' value='Print' />
								<a href='./apply_reviewY.ap'><input type='button' name='btnReviewY' value='검토완료
								' /></a>
							</div>			
						</form>
					
					</div>
				<!-- 내용의 끝 -->
				
			</div>
		</div>
	</div>
</div>	






















	
<script>
pageLoad();
</script>


