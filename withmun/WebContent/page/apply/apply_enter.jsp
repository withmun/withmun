<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrapper">
	<div class="container">
		<div class ="top">
			<a href="/" ">HOME</a>
			> <a href="./service_procedure.do" >Other</a>
			> <a href="./apply_enter.ap" >입사지원</a>
			> <a href="./apply_enter.ap" class="on">새로 지원 및 지원내역 관리</a>
		</div>
		<div class="toptit">
		    <h2><a href="./apply_enter.ap">새로 지원 및 지원내역 관리</a></h2>
			<p>능력있는 인재들의 많은 지원 바랍니다.</p>
		</div>	"WebContent/page/apply/apply_privacy.jsp"
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
<!------------------------------------------------------------------->

<div class ="main">
<div class="main_wrap">
	<%@ include file = "../../include/left_other.jsp" %>
		<div class = "content">			
			<div class ="content_second" style="margin-top:0;text-align:center">
			     <div class ="second">				
					<form name='frm_enter'>
						<a href='./apply_privacy.ap'><input type='button' name='btnApply' value='새로 지원' /></a>&nbsp;
						<input type='button' name='btnManage' value='지원내역관리' />
					</form>
				</div>
			</div>	
		</div>
	</div>
</div>