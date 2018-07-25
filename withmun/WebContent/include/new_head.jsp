<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-T86BCZP');</script>
<!-- End Google Tag Manager -->
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>위드문인터내셔널</title>
<meta name="naver-site-verification" content="a21a477547299dff6945f78849b34232df631780"/>
<meta name="viewport" content="width=device-width">
<meta property="og:type" content="article" />
<meta property="og:site_name" content="위드문인터내셔널">
<meta property="og:type" content="article">
<meta property="og:url" content="http://www.withmun.com">
<link rel="canonical" href="http://www.withmun.com">
<meta property="og:title" content="위드문인터내셔널">
<meta property="og:image" content="http://withmun.com/images/logo2.jpg">
<meta name="twitter:image" content="http://withmun.com/images/logo2.jpg">
<meta property="og:description" content="비영리사단/재단설립, 토지보상, 행정심판, 번역공증대행전문, 아포스티유/각국대사관인증" />
<meta name="description" content="비영리사단/재단설립, 토지보상, 행정심판, 번역공증대행전문, 아포스티유/각국대사관인증" />
<!--부트스트렙-->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!--  -->
<link rel="shortcut icon" type="image/x-icon" href="./images/favicon.ico" sizes="16x16 32x32">
<link rel="icon" type="image/x-icon" href="./images/favicon.ico" sizes="16x16 32x32">
<!----->
<style type="text/css">
<!--
body{margin:0;}
#center { width:100%; height:1356px; background:url(./images/sian2.jpg) top center; }
@media (max-width: @screen-xs-max) { ... }
@media (min-width: @screen-sm-min) and (max-width: @screen-sm-max) { ... }
@media (min-width: @screen-md-min) and (max-width: @screen-md-max) { ... }
@media (min-width: @screen-lg-min) { ... }
-->
</style>
<link rel='stylesheet' type='text/css' href=./css/new_default.css?ver=1
			media="screen and (min-width:631px)" />
<link rel='stylesheet' type='text/css' href='./css/new_default_min.css?ver=1'
			media="screen and (max-width:630px)" />
<script src="./js/jquery-1.8.3.min.js"></script>
<!--{{ 메뉴 및 롤오버 버튼 }}-->
<script src="./js/jquery.menu.js"></script>
<script src="./js/unslider.min.js"></script>

</head>
<style>
#main_bn .bn_ul ul{}
</style>
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-T86BCZP"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
<body>
<!-- head 로그인 시작  -------------------------------------------------------------------------------------------------------->
<form name = 'frmLogin'>
   <input type = 'button' name = 'btnLogout' value = '로그아웃' style="display:none"/>
         <c:choose>
      <c:when test = "${empty id}">
      </c:when>
      <c:otherwise>
         <input type='button' value='로그아웃' id='btnlogout' />
      </c:otherwise>
      </c:choose>
  
</form>
<script>
var ff = document.frmLogin;
   ff.btnlogout.onclick = function(){
      ff.action = 'logoutR.login';
      ff.submit();
}
</script>
<!-- 로그인 끝 ---------------------------------------------------------------------------------------------------------------->
<!-- 상단 시작 { -->
<div id="hd">
	<div id="hd_wrapper">
        <div id="logo">	
            <a href="./index.jsp" class="le"><img src="./images/new_logo5.png" alt="국가공인 외국어번역행정사무소"></a> 			
		</div>
		
		<div id = "mini_menu_btn">
			  <span class="glyphicon glyphicon-align-justify btn_menu" aria-hidden="true"></span>
		</div>
		
		
		<div id = "mini_menu_div" style='display:none;'>
			<div class = "mini_search">
				<span class="glyphicon glyphicon-search"></span>
			</div>
			
			<div id = "mini_generl">			
				<div class ="col-xs-10 mini_menu_general">
					일반행정
				</div>
				<div class ="col-xs-2 mini_menu_icon1">
					<span class="glyphicon glyphicon-chevron-down btn_general"></span>
				</div>	
			</div>

			<div id = "mini_generl_menu" style='display:none;'>			
				<a href="./incorporate.do"><li>법인설립</li></a>
				<a href="./land_compensation.do"><li>토지보상</li></a>
				<a href="./licensing.do"><li>사업 인허가</li></a>
				<a href="./immigration.do"><li>출입국관리업무</li></a>
				<a href="./suspension.do"><li>행정심판</li></a>
			</div>
	
	
			<div id="mini_foreign">
				<div class ="col-xs-10 mini_menu_foreign">
					외국어번역행정
				</div>
				<div class ="col-xs-2 mini_menu_icon2">
					<span class="glyphicon glyphicon-chevron-down btn_foreign"></span>	
				</div>
			</div>
			
			<div id = "mini_foreign_menu" style="display:none;">
				<div id = "mini_foreign_1">
					<div class ="col-xs-10 mini_foreign_1_text">
						기업
					</div>
					<div class ="col-xs-2 mini_foreign_1_icon">
						<span class="glyphicon glyphicon-chevron-down btn_foreign_1"></span>	
					</div>
				</div>
							
				<div id = "mini_foreign_menu1" style="display:none;">			
					<a href="./english_contract.do"><li>영문계약서 작성</li></a>
					<a href="./professional_translation.do"><li>전문번역</li></a>
					<a href="./acting_translation.do"><li>번역공증대행</li></a>
					<a href="./aposcertification.do"><li>아스티유 및 대사관 인증</li></a>
					<a href="./overseas.do"><li>해외법인(지사/투자)설립</li></a>
				</div>
				
				<div id = "mini_foreign_2">
					<div class ="col-xs-10 mini_foreign_2_text">
						개인
					</div>
					<div class ="col-xs-2 mini_foreign_2_icon">
						<span class="glyphicon glyphicon-chevron-down btn_foreign_2"></span>	
					</div>
				</div>
							
				<div id = "mini_foreign_menu2" style="display:none;";>			
					<a href="./certificate.do"><li>번역확인증명서</li></a>
					<a href="./general_translation.do"><li>일반번역</li></a>
					<a href="./acting_translation_personal.do"><li>번역공증대행</li></a>
					<a href="./aposcertification_genenal.do"><li>아스티유 및 대사관 인증</li></a>
					<a href="./studying_abroad.do"><li>유학 & 이민서류 관련</li></a>
				</div>
			</div>
		</div>
			
	
		
		
		

		<div class="logo2">
			    <a href="./index.do">
					<div class="lo_left"><span class="sp1">위드문</span><span class="sp2">인터내셔널 행정사사무소</span></div>
					<div class="lo_right"><img src="./images/admin_logo2.png" alt="국가공인 외국어번역행정사무소"><span class="sp3">행정안전부 인가</span>
					</div>				
			    </a>				
		</div>

<style>

</style>
		<nav id="gnb">	
			<ul id="gnb_1dul" style="">
				<li class="gnb_1dli" >
					<a href="./about.do" target="_self" class="gnb_1da" style="">About WithMUN</a>			
				</li>
				<li class="gnb_1dli">
					<a href="./list.bo" target="_self" class="gnb_1da ">Q & A</a>
				</li>				
				<li class="gnb_1dli">
					<a href="./location.do" target="_self" class="gnb_1da ">Contact Us (Location)</a>
				</li>				
				<li class="gnb_1dli">
					<a href="./service_procedure.do" target="_self" class="gnb_1da ">Other</a>
				</li>
				<li class="gnb_1dli">
					<a href="" target="_self" class="gnb_1da ">Language ▼</a>	
				</li>
				
	  			<li class="gnb_1dli form-inline">
				<form id='frmSearch'  method='post' action='./find.fd'>
					<span>
	  				<input type="text" class="form-control header_input_text" name="findStr" id="findStr" placeholder="검색">
	  				</span>
	  				<span class="glyphicon glyphicon-search header_search"> </span>
				</form>
				</li>
			</ul>
		</nav>
    </div>
<style>


/*.normal:hover{color:#d39500;background-color:#f1f1f1;}*/


</style>

	<div id="kmenu" >       
			<div class="k1">
				<div class="normal">
					일반행정
				</div>
			</div>        
			<div class="k2">
				<div class="foreign">
					<span id="foreign">외국어번역행정</span>
				</div>			
			</div>
		
	</div>
<script type="text/javascript" src="/pc_html/js/jquery.lettering.js"></script>
<script type="text/javascript" src="/pc_html/js/jquery.textillate.js"></script>



	<div class="menu_normal"  style="display:none;">
		<div id = "normal_sub1">
			<div>
				<a href="./licensing.do">사업 인허가</a>
				<div class="line_normal">
				</div>
			</div>
			<div>
				<a href="./immigration.do">출입국관리업무</a>
				<div class="line_normal">
				</div>
			</div>
			<div>
				<a href="./suspension.do">행정심판</a>
				<div class="line_normal">
				</div>
			</div>		
		</div>
<style>

</style>
		<div id = "normal_sub2">			
				<a href="./incorporate.do">
					<div id = "normal_sub2_photo"><img src="./images/incorporate_menuimg.jpg" alt=""></div>
					<div id ="normal_sub2_text">
						<h2>법인설립</h2>
						<span> &nbsp;&nbsp;하나의 단체를 만들기 위해서는 상당한 준비기간이 소요되고 진행과정 중에 많은 어려움이 따릅니다.
						효율적인 진행을 위해 법인설...
						</span>
					</div>		
				</a>		
		</div>

		<div id = "normal_sub4">
             <a href="./land_compensation.do">

		    <div id = "normal_sub4_photo"><img src="./images/land_compensation_menuimg.jpg" alt=""></div>
			<div id ="normal_sub4_text">
				<h2>토지보상</h2>
				<span>&nbsp;&nbsp;토지보상의 법적근거를 토대로 국민의 재산권 행사를 위한 의견서 제출, 수용재결 신청(이의재결 신청), 잔여지보상(가치하락 보상 등) 지장물 보... </span>
			</div>	
			</a>
		</div>
	</div>



	<div class="menu_foreign"  style="display:none;">
		<div id = "foreign_sub1">
		
			<div href="english_contract.do">
				<a class = "menu_head" href="./professional_translation.do">기 업</a>
				<div class="line">
				</div>
			</div>
	
			<div class = "foreign_sub1_menu">
				<a href="./professional_translation.do" class="menu_s">전문번역</a><br>
				<a href="./acting_translation.do" class="menu_s">번역공증대행</a><br>
				<a href="./aposcertification.do" class="menu_s">아포스티유 및 대사관인증</a><br>
				<a href="./overseas.do" class="menu_s">해외법인(지사/투자)설립</a>
			</div>

			<div style="margin-top:30px">
				<a class ="menu_head" href="./general_translation.do">개 인</a>
				<div class="line">
				</div>
			</div>
			
			<div class = "foreign_sub1_menu">
				<a href="./general_translation.do" class="menu_s">일반번역</a><br>
				<a href="./acting_translation_personal.do" class="menu_s">번역공증대행</a><br>
				<a href="./aposcertification_genenal.do" class="menu_s">아포스티유 및 대사관인증</a><br>
				<a href="./studying_abroad.do" class="menu_s">유학 & 이민서류 관련</a><br>
			</div>
		</div>
		<div id = "foreign_sub2">
		    <a href="./english_contract.do">
			<div id = "foreign_sub2_photo">
				<img src="./images/english_contract_menuimg.jpg" style="width:100%;height:100%;" alt="">
			</div>
			<style>

			</style>
			<div id ="foreign_sub2_text">
				<a href="./english_contract.do">영문계약서 작성</a>
					<div style="margin-top:10px;">
						<span>&nbsp;&nbsp;계약서의 형식과 내용은 계약자유의 원칙에 따라 계약당사자간에 자유롭게 정할 수 있습니다. <br>계약서는 상호간의 신뢰를 바탕으...</span>
					</div>
			</div>
            </a>	
		</div>

		<div id = "foreign_sub3">	
		</div>

		<div id = "foreign_sub4">
		    <a href="./certificate.do">
		    <div id = "foreign_sub4_photo"><img src="./images/certificate_menuimg.jpg"alt=""></div>
			<div id ="foreign_sub4_text">
				<a href="./certificate.do">번역확인증명서</a>
					<div style="margin-top:10px;">
						<span>&nbsp;&nbsp;외국어번역행정사가 발급한 번역확인증명서는 행정기관에 제출시 법적으로 번역에 대한 책임을 이행하며,<br> 번역내용의 효력을 인정 받을 수 있...</span>
					</div>
			</div>
			</a>
		</div>

	</div>
</div>
<!-- } 상단 끝 -->
<hr>
<script type="text/javascript">




$(function(){
	$( '.btn_menu' ).click(function() {
		if($("#mini_menu_div").css("display") == "none"){
			 $("#mini_menu_div").slideToggle("slow");
		} else {
		    $("#mini_menu_div").slideToggle("slow");
		}
	});
	
	
	$('.mini_menu_icon1' ).click(function() {
		if($("#mini_generl_menu").css("display") == "none"){
			 $("#mini_generl_menu").slideToggle("slow");
		} else {
		    $("#mini_generl_menu").slideToggle("slow");
		}
	});
	
	$('.mini_menu_icon2' ).click(function() {
		if($("#mini_foreign_menu").css("display") == "none"){
			 $("#mini_foreign_menu").slideToggle("slow");
		} else {
		    $("#mini_foreign_menu").slideToggle("slow");
		}
	});
	
	$('.mini_foreign_1_icon' ).click(function() {
		if($("#mini_foreign_menu1").css("display") == "none"){
			 $("#mini_foreign_menu1").slideToggle("slow");
		} else {
		    $("#mini_foreign_menu1").slideToggle("slow");
		}
	});
	
	
	$('.mini_foreign_2_icon' ).click(function() {
		if($("#mini_foreign_menu2").css("display") == "none"){
			 $("#mini_foreign_menu2").slideToggle("slow");
		} else {
		    $("#mini_foreign_menu2").slideToggle("slow");
		}
	});
	
});



$(document).ready(function (e) {
	
	$(".k1").mouseenter(function() {
		$(".menu_normal").show();
		$(".menu_foreign").hide();
        $(".normal").addClass('on');
	
	});
	$(".k1").mouseleave(function() {
		$(".menu_normal").hide();
		$(".menu_foreign").hide();
        $(".normal").removeClass('on');
	
	});

    $(".menu_normal").mouseenter(function() {
		$(".menu_normal").show();
        $(".normal").addClass('on');
	});

	$(".menu_normal").mouseleave(function() {
		$(".menu_normal").hide();
        $(".normal").removeClass('on');
	});

// 두번째

	$(".k2").mouseenter(function() {
		$(".menu_normal").hide();
		$(".menu_foreign").show();
        $(".foreign").addClass('on');
	
	});
	$(".k2").mouseleave(function() {
		$(".menu_normal").hide();
		$(".menu_foreign").hide();
        $(".foreign").removeClass('on');
	
	});

    $(".menu_foreign").mouseenter(function() {
		$(".menu_foreign").show();
        $(".foreign").addClass('on');
	});

	$(".menu_foreign").mouseleave(function() {
		$(".menu_foreign").hide();
        $(".foreign").removeClass('on');
	});


	$( ".develop" ).click(function() {
		alert("진행중입니다");
	});
});

$(function(){
	$( '.header_search' ).click(function() {
		$( "#frmSearch" ).submit();
	});
});


</script>
<div id ="div_line"></div>