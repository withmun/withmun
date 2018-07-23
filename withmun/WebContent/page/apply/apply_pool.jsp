<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrapper">
	<div class="container">
		<div class ="top">
			<a href="/" ">HOME</a>
			> <a href="./service_procedure.do" >Other</a>
			> <a href="./apply_enter.ap" >입사지원</a>
			> <a href="./apply_pool.ap" class="on">입사지원서 Pool(관리자용)</a>
		</div>
		<div class="toptit">
		    <h2><a href="./apply_pool.ap">입사지원서 Pool(관리자용)</a></h2>
			<p>능력있는 인재들의 많은 지원 바랍니다.</p>
		</div>	
	</div>
</div>
<!------------------------------------------------------------------->

<script>
$(document).ready(function(){
	$(".jtoggle_up").click(function(){
		$(".toggle_menu").slideDown();
		$(".jtoggle_down").css("display","block");
		$(".jtoggle_up").css("display","none");
		$(".line2").css("display","block");
		
	});
	$(".jtoggle_down").click(function(){
		$(".toggle_menu").slideUp();
		$(".jtoggle_down").css("display","none");
		$(".jtoggle_up").css("display","block");
		$(".line2").css("display","none");
	
	});
});
</script>
<style>
table {
	margin: 0 auto;
	border: 1px solid gray;
	
	margin-top: 10px;
	margin-bottom: 10px;
	
}

th {
	background-color: skyblue;
}
th, td {
	border: 1px solid black;
}

.content {
	width: 100%;
}

#wrap_pool {
	pading: 10px;
	border: 1px solid gray;
}
</style>

<!------------------------------------------------------------------->


<div class="main">
	<div class="main_wrap">
		<div class="content">
			<div class="content_second" style="width:100%;margin-top: 0; text-align: center">
				
				<!-- 여기에 내용을 넣는다 -->
				
				<div id='wrap_pool'>

					<div id='pool_list'>
						<p>
							입사지원서 Pool(관리자용 목록)
						</p>

						<table id='table_list'>
							<tr>
								<th>No</th>
								<th>지원번호</th>
								<th>지원분야</th>
								<th>지원날짜</th>
								<th>이름</th>
								<th>E-mail</th>
								<th>검토여부</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
							<tr>
								<td><input type='text' name='field' value='21' size='6' /></td>
								<td><input type='text' name='aNo' value='317' size='6 '/></td>
								<td><input type='text' name='field' value='세무회계' /></td>
								<td><input type='text' name='submitDate' value='20180607' size='16'/></td>
								<td><input type='button' name='name' value='이봉기' /></td>
								<td><input type='button' name='email' value='iyabong@gmail.com' /></td>
								<td><input type='text' name='reviewYN' value='검토완료' size='6'/></td>
								<td><input type='button' name='btnModify' value='수정' /></td>
								<td><input type='button' name='btnDelete' value='삭제' /></td>
							</tr>

						</table>


					</div>
				</div>
				<!-- 내용의 끝 -->
				
			</div>
		</div>
	</div>
</div>	


<div class ="main">
<div class="main_wrap">
		<div class = "content">			
			<div class ="content_second" style="margin-top:0;text-align:center">
			     <div class ="second">
			     

						
				</div>
			</div>	
		</div>
	</div>
</div>