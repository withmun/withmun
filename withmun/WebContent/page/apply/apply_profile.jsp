<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>apply_profile</title>

<style>

#profile_wrap {
	width: 1050px;
	border: 1px solid gray;
	margin: 0 auto;
}
#pic {
	border: 1px solid black;
	background-image: url('http://via.placeholder.com/120x90');
	width: 120px;
	height: 90px;
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

#buttons {
	margin-top: 30px;
	margin-bottom: 20px;
	text-align: center;
}


</style>

</head>
<body>
	<div id='profile_wrap'>
	
	<h1>입사지원서</h1>
		<form name='frm_profile'>
				<div id='pic'>
				사진
				</div>
				
				<h5>지원정보</h5>
				<table>
					<tr>
						<th>지원분야</th>
						<td><input type='text' name='apply_position' /><br></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type='text' name='name' /></td>	
					</tr>
					<tr>
						<th>주민등록번호</th>
						<td><input type='text' name='jumin1'> - <input type='text' name='jumin2'></td>
					</tr>
				</table>
				
				<h5>연락처</h5>
				<table id='tbl_contact'>
					<tr>
						<th>주소</th>
						<td colspan='3'><input type='text' name='addr'  /></td>
						<th>우편번호</th>
						<td><input type='text' name='zipcode'  /></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<input type='text' name='tel1' size='3' />-
							<input type='text' name='tel2' size='4'/>-
							<input type='text' name='tel3' size='4 '/>
						</td>
						<td>휴대전화</td>
						<td>1
							<input type='text' name='mobile1' size='3' />-
							<input type='text' name='mobile2' size='4'/>-
							<input type='text' name='mobile3' size='4 '/>
							
						</td>
						<td>E-mail</td>
						<td><input type='email' name='email' /></td>
					</tr>
				</table>
				
				
				<h5>학력사항</h5>
				<table id='tbl_study'>
					<tr>
					<th>기간</th><th>학교명</th><th>전공</th><th>평점</th><th>졸업여부</th>
					
					<tr>
						<td><input type='date' name='startHigh'> -
						<input type='date' name='finishHish'></td>
						<td><input type='text' name='high' size='6'/>고등학교</td>
						<td>-</td><td>- </td>
						<td><input type='radio' name='radio_jolup'>졸업
							<input type='radio' name='radio_jolup'>졸업예정
						</td>
					</tr>
					
					<tr>
						<td><input type='date' name='startCol'> -
						<input type='date' name='finishCol'></td>
						<td><input type='text' name='col' size='6'/>대학</td>
						<td><input type='text' name='col_major' size='6'/></td>
						<td><input type='text' name='col_grade' size='6'/></td>
						<td><input type='radio' name='radio_jolup'>졸업
							<input type='radio' name='radio_jolup'>졸업예정
						</td>
					</tr>
					
					<tr>
						<td><input type='date' name='startUniv'> -
						<input type='date' name='finishUniv'></td>
						<td><input type='text' name='univ' size='6'/>대학교</td>
						<td><input type='text' name='univ_major' size='6'/></td>
						<td><input type='text' name='univ_grade' size='6'/></td>
						<td><input type='radio' name='radio_jolup'>졸업
							<input type='radio' name='radio_jolup'>졸업예정
						</td>
					</tr>
					
					<tr>
						<td><input type='date' name='startGrad'> -
						<input type='date' name='finishGrad'></td>
						<td><input type='text' name='grad' size='6'/>대학원</td>
						<td><input type='text' name='grad_major' size='6'/></td>
						<td><input type='text' name='grad_grade' size='6'/></td>
						<td><input type='radio' name='radio_jolup'>졸업
							<input type='radio' name='radio_jolup'>졸업예정
						</td>
					</tr>
				</table>

				<h5>병역</h5>	
				<table id='tbl_military'>
					<tr>
						<th>군별</th><th>병과</th><th>계급</th><th>복무기간</th><th>제대구분</th><th>미필사유</th>
					</tr>
					<tr>
						<td><input type='text' name='gun' size='6' /></td>
						<td><input type='text' name='byung' size='6' /></td>
						<td><input type='text' name='gye' size='6'/></td>
						<td>
							<input type='date' name='startMil' /> ~
							<input type='date' name='finishMil' />
						</td>
						<td>
							<input type='radio' name='radio_jedae' /> 만기  
							<input type='radio' name='radio_jedae' /> 의가사
						</td>
						<td><input type='text' name='mipil' size='10'/></td>
					</tr>					
				</table>
				
				<h5>외국어/자격면허</h5>
				<table id='tbl_lang'>
					<tr>
						<th>외국어시험명</th><th>공인점수</th><th>시험일</th>
					</tr>
					<tr>
						<td><input type='text' name='lang1' size='6'/></td>
						<td><input type='text' size='3' name='langScore1'/>점</td>
						<td><input type='date' name='langDate1' /></td>
						
					</tr>
					<tr>
						<td><input type='text' name='lang2' size='6'/></td>
						<td><input type='text' size='3' name='langScore2'/>점</td>
						<td><input type='date' size='3' name='langDate2'/></td>
					</tr>
				</table>		
				
				<table id='tbl_license'>
					<tr>
						<th>자격명</th><th>취득일</th><th>시행처</th>
					</tr>
					<tr>
						<td><input type='text' name='license1' /></td>
						<td><input type='date' name='licenseDate1' /></td>
						<td><input type='text' name='licenseOrg1' /></td>						
					</tr>
					<tr>
						<td><input type='text' name='license2' /></td>
						<td><input type='date' name='licenseDate2' /></td>
						<td><input type='text' name='licenseOrg2' /></td>	
					</tr>
				</table>	
				
				<h5>동아리 및 사회봉사활동</h5>
				<table id='tbl_bongsa'>
					<tr>
						<th>활동기관(단체)</th><th>활동기간</th><th>활동내용</th>
					</tr>
					<tr>
						<td><input type='text' name='bongsaOrg1' size='10'></td>
						<td>
							<input type='date' name='startBongsa1' /> ~
							<input type='date' name='finishBongsa1' />
						</td>
						<td>
						<input type='text' name='bongsaContent1'/>
						</td>
					</tr>
					<tr>
						<td><input type='text' name='bongsaOrg2' size='10'></td>
						<td>
							<input type='date' name='startBongsa2' /> ~
							<input type='date' name='finishBongsa2' />
						</td>
						<td>
						<input type='text' name='bongsaContent1'/>
						</td>
					</tr>
				</table>
				
				
				<h5>가족사항</h5>
				<table id='tbl_family'>
					<tr>
						<th>관계</th><th>성명</th><th>생년월일</th><th>최종학력</th><th>직업</th><th>회사명</th><th>직위</th><th>동거여부</th>
					</tr>
					<tr>
						<td><input type='text' name='rel1' size='4' /></td>
						<td><input type='text' name='name1' size='4' /> </td>
						<td><input type='date' name='birth1'/></td>
						<td><input type='text' name='hak1' size='6' /></td>
						<td><input type='text' name='job1'  size='6'></td>
						<td><input type='text' name='company1'  size='6'></td>
						<td><input type='text' name='position1'  size='6'></td>
						<td>
						<input type='radio' name='radio_familywith1' />Y
						<input type='radio' name='radio_familywith1' />N
						</td>
					</tr>
					<tr>
						<td><input type='text' name='rel2' size='4' /></td>
						<td><input type='text' name='name2' size='4' /> </td>
						<td><input type='date' name='birth2'></td>
						<td><input type='text' name='hak2' size='6' /></td>
						<td><input type='text' name='job2'  size='6'></td>
						<td><input type='text' name='company2'  size='6'></td>
						<td><input type='text' name='position2'  size='6'></td>
						<td>
						<input type='radio' name='radio_familywith2' />Y
						<input type='radio' name='radio_familywith2' />N
						</td>
					</tr>
					<tr>
						<td><input type='text' name='rel3' size='4' /></td>
						<td><input type='text' name='name3' size='4' /> </td>
						<td><input type='date' name='birth3'></td>
						<td><input type='text' name='hak3' size='6' /></td>
						<td><input type='text' name='job3'  size='6'></td>
						<td><input type='text' name='company3'  size='6'></td>
						<td><input type='text' name='position3'  size='6'></td>
						<td>
						<input type='radio' name='radio_familywith3' />Y
						<input type='radio' name='radio_familywith3' />N
						</td>
					</tr>
					<tr>
						<td><input type='text' name='rel4' size='4' /></td>
						<td><input type='text' name='name4' size='4' /> </td>
						<td><input type='date' name='birth4'></td>
						<td><input type='text' name='hak4' size='6' /></td>
						<td><input type='text' name='job4'  size='6'></td>
						<td><input type='text' name='company4'  size='6'></td>
						<td><input type='text' name='position4'  size='6'></td>
						<td>
						<input type='radio' name='radio_familywith4' />Y
						<input type='radio' name='radio_familywith4' />N
						</td>
					</tr>
				
				</table>
				
				<h5>기타사항</h5>
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
							<input type='radio' name='radio_bohun' />Y
							<input type='radio' name='radio_bohun' />N
						</td>
					</tr>
					
				</table>

			<div id='buttons'>
				<input type='button' name='btnSave' value='임시저장' />
				<input type='button' name='btnIntroduce' value='저장하고 다음으로' />
			</div>			
		</form>
	
	</div>

</body>

</html>