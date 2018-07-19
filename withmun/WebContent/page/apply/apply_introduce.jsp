<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>apply_introduce</title>

<style>

#wrap_introduce {
	width: 1050px;
	border: 1px solid gray;
	margin: 0 auto;
}

#buttons {
	margin-top: 30px;
	margin-bottom: 20px;
	text-align: center;
}


</style>

</head>
<body>
	<div id='wrap_introduce'>
	
	<h1>자기소개</h1>
		<form name='frm_introduce'>
			
				
			<h5>성장과정(1,000자 이내)</h5>
			<textarea name='growing' rows='10' cols='100'>
			</textarea>
				
			<h5>성격 및 장단점(1,000자 이내)</h5>				
			<textarea name='character' rows='10' cols='100'>
			</textarea>
			
			<h5>지원동기(1,000자 이내)</h5>
			<textarea name='motive' rows='10' cols='100'>
			</textarea>
			
			<h5>입사 후 포부(1,000자 이내)</h5>
			<textarea name='future' rows='10' cols='100'>
			</textarea>
			
			<div id='buttons'>
				<input type='button' name='btnProfile' value='뒤로가기 및 현재내용  저장' />
				<input type='submit' value='제출하기' />
			</div>
		</form>
		
	</div>
</body>

</html>