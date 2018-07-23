<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrapper">
	<div class="container">
		<div class ="top">
			<a href="/" ">HOME</a>
			> <a href="./service_procedure.do" >Other</a>
			> <a href="./apply_enter.ap" >입사지원</a>
			> <a href="./apply_enter.ap" class="on">이력서 작성 / 이력서 관리</a>
		</div>
		<div class="toptit">
		    <h2><a href="./apply_enter.ap">이력서 작성 / 이력서 관리</a></h2>
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
.content {
	width: 100%;
}

#wrap_enter {
	padding: 10px;
	border: 1px solid gray;
}

</style>
<!------------------------------------------------------------------->

<div class ="main">
<div class="main_wrap">
		<div class = "content">			
			<div class ="content_second" style="margin-top:0;text-align:center">
			     <div class ="second">
			     
			     	<!-- 본문 시작 -->
			     	<div id='wrap_enter'>				
						<form name='frm_enter'>
							
							<!-- 지원자용 -->
							<a href='./apply_privacy.ap'><input type='button' name='btnNew' value='이력서 작성' /></a>&nbsp;
							<a href='./apply_manage.ap'><input type='button' name='btnManage' value='이력서 관리' /></a>&nbsp;
							
							
							<!-- 관리자용 -->
							<a href='./apply_pool.ap'><input type='button' name='btnPool' value='이력서Pool(관리자용)' ></a>
							
							
						</form>
					</div>
					<!-- 본문 끝 -->
				</div>
			</div>	
		</div>
	</div>
</div>