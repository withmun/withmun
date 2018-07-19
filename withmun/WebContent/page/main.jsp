<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#main_bn .bn_ul li{height:460px;float: left;}
</style>
<!-- 콘텐츠 시작 { -->
<div id="idx_wrapper" style="background-color:#f1f1f1;">



 <!-- #mainvisual --> 
	<div id="mainvisual">
		<div class="mainthumwrap">		
			<ul class="mainthum">
				<!--li ><span>믿을 수 있는곳!</span></li>
				<li ><span>프리미엄 1:1맞춤치료</span></li>
				<li ><span>환자를 위한마음</span></li-->
			<li><img src="./images/common/thum_on.png"  alt="1" /></li>
			<li><img src="./images/common/thum_off.png" alt="2" /></li>
			<li><img src="./images/common/thum_off.png" alt="3" /></li>
			</ul>
		</div>
		<div class="visWrap">
				<!-- //#v1 -->
				<div class="v1 bg1">
					<ul class="v1motion">
						<li class="v1text visTxt">
						<ul>
							<li><a href="#">Trust & Sharing</a></li>
							<li><a href="#">신뢰와 나눔속에</a></li>	
							<li><a href="#">사랑받는 기업으로</a></li>
						</ul>
						</li>
						<!--li class="v1img_1 visImg"><a href="#"><img src="/pc_html/img/main/main_img01.png" alt="img1" /></a></li-->
					</ul>
				</div>
				<!-- //#v1 -->


				<!-- //#v2 -->
				<div class="v1 bg2" style="display:none;">
					<ul class="v1motion">
						<li class="v1text visTxt">
						<ul>
							<li><a href="#">고객분의 잠재적인 니즈(Needs)까지</a></li>
							<li><a href="#">최선 그리고 최고의</a></li>	
							<li><a href="#">파트너가 되겠습니다.</a></li>		
						</ul>
						</li>
						<!--li class="v1img_1 visImg"><a href="#"><img src="/pc_html/img/main/main_img02.png" alt="img2" /></a></li-->
					</ul>
				</div>
				<!-- //#v2 -->


				<!-- //#v3 -->
				<div class="v1 bg3" style="display:none;">
						<ul class="v1motion">
						<li class="v1text visTxt">
						<ul>
							<li><a href="#">Ideal and Professional Solution</a></li>
							<li><a href="#">전문적이고 이상적인</a></li>	
							<li><a href="#">행정서비스 솔루션 제공</a></li>
						</ul>
						</li>
						<!--li class="v1img_1 visImg"><a href="#"><img src="/pc_html/img/main/main_img03.png" alt="img3" /></a></li-->
					</ul>
				</div>
				<!-- //#v3 -->
		   </div>
	</div>
<!-- //#mainvisual -->
<script type="text/javascript">
var visNum = 0, visOldNum = 0;
$(function(){
	$(".visWrap").children("div").eq(visNum).find(".visImg").fadeIn("slow");
	for(var i = 0; i < $(".visWrap").children("div").eq(visNum).find(".visTxt").find("li").size(); i++){
		$(".visWrap").children("div").eq(visNum).find(".visTxt").find("li").eq(i).delay(200*(1+i)).animate({
			"margin-left":0
		},function(){
			if($(this).index() == $(".visWrap").children("div").eq(visNum).find(".visTxt").find("li").size() - 1){
				visAuto = setTimeout(visAdd,4500);
				$(".mainthum").find("li").bind("click",function(){
					if($(this).index() != visNum){
						visNum = $(this).index();
						visAct();
					}
				})
			}
		});
	}
})
function visAdd(){
	visNum++;
	if(visNum >= $(".visWrap").children("div").size()){
		visNum = 0;
	}
	visAct();
}
function visAct(){
	clearTimeout(visAuto);
	$(".mainthum").find("li").unbind("click");
	// 이미지를 OFF에서 on으로 변경한다
	$(".mainthum").find("li").eq(visNum).children().attr("src", $(".mainthum").find("li").eq(visNum).children().attr("src").replace(/_off/gi, "_on"));
	$(".mainthum").find("li").eq(visOldNum).children().attr("src", $(".mainthum").find("li").eq(visOldNum).children().attr("src").replace(/_on/gi, "_off"));  
     
	 // 이미지를 텍스트 처리를 할려고 함 어렵네...



	$(".visWrap").children("div").eq(visOldNum).fadeOut();
	$(".visWrap").children("div").eq(visNum).fadeIn("",function(){
		$(".visWrap").children("div").eq(visNum).find(".visImg").fadeIn("slow");
		for(var i = 0; i < $(".visWrap").children("div").eq(visNum).find(".visTxt").find("li").size(); i++){
			$(".visWrap").children("div").eq(visNum).find(".visTxt").find("li").eq(i).delay(200*(1+i)).animate({
				"margin-left":0
			},function(){
				if($(this).index() == $(".visWrap").children("div").eq(visNum).find(".visTxt").find("li").size() - 1){
					$(".visWrap").children("div").eq(visOldNum).find(".visImg").hide();
					$(".visWrap").children("div").eq(visOldNum).find(".visTxt").find("li").css("margin-left",40);
					visOldNum = visNum;
					$(".mainthum").find("li").bind("click",function(){
						if($(this).index() != visNum){
							visNum = $(this).index();
							visAct();
						}
					})
					visAuto = setTimeout(visAdd,4500);
				}
			});
		}
	})
}
</script>



    <!--메인배너-->
	<!--div id="wrapper" style="    margin-top: -2px; width:1070px;">
		<div id="main_bn">
			<ul class="bn_ul" >
				<li class="bn_bg1" style="height: 425px;">
					<div class="bn_wr" style="padding-top: 50px;" >
						<div class="bn_txt">
						   <h2>고객분들의 잠재적인  <br>니즈(Needs)까지</h2>
							<p>최선 그리고 최고의<br>파트너가 되고자 합니다.</p>
						</div>
					</div>
				</li>
				<li class="bn_bg2"style="height: 425px;">
					<div class="bn_wr" style="padding-top: 50px;">
						<div class="bn_txt">
							<h2>신뢰와 나눔속에  <br>사랑받는 기업으로</h2>
							<p>우리의 원대한 도전,<br>새로운 100년이 깨어납니다</p>
						</div>
					</div>
				</li>
				<li class="bn_bg3"style="height: 425px;">
					<div class="bn_wr" style="padding-top: 50px;">
						<div class="bn_txt">
							<h2>신뢰와 나눔속에  <br>사랑받는 기업으로</h2>
							<p>우리의 원대한 도전,<br>새로운 100년이 깨어납니다</p>
						</div>
					</div>
				</li>
		
			</ul>
			<div class="bn_btn" style="    top: 67px;">
				<a href="#" class="unslider-arrow prev">Previous slide</a>
				<a href="#" class="unslider-arrow next">Next slide</a>
			</div>
		</div>
    </div-->
    <!--메인배너-->
    <script>
	/*
    $(function() {
        var unslider = $("#main_bn").unslider({
            speed: 700,               //  The speed to animate each slide (in milliseconds)
            delay: 5000,              //  The delay between slide animations (in milliseconds)
            keys: true,               //  Enable keyboard (left, right) arrow shortcuts
            dots: true,               //  Display dot navigation
            fluid: false              //  Support responsive design. May break non-responsive designs
        });
        
        $('.unslider-arrow').click(function() {
            var fn = this.className.split(' ')[1];

            //  Either do unslider.data('unslider').next() or .prev() depending on the className
            unslider.data('unslider')[fn]();
        });
    });
	*/
   </script>

     <div id="idx_container" style="z-index: 2; width: 1101px;">

<style>
#idx_container_first{background-color:#ffffff; width:51%; height:380px;margin-top:25px;}
#idx_container_second{background-color:#ffffff; width:24%; height:380px;margin-top:25px; margin-left:15px;}
#idx_container_third{background-color:#ffffff; width:21.3%; height:780px;margin-top:25px;margin-left:25px;}
#idx_container_fourth{color:#333333;font-weight:bold;background-color:#ffffff; width:24%;margin-top:-380px; height:380px;}
#idx_container_fifth{background-color:#ffffff; width:51%;margin-top:-380px; height:380px;margin-left:279px;}

a:hover #idx_container_first{background-color:#ddd;}
a:hover #idx_container_second{background-color:#ddd;}
a:hover #idx_container_third{background-color:#ddd;}
a:hover #idx_container_fourth{background-color:#ddd;}
a:hover #idx_container_fifth{background-color:#ddd;}

</style>

        <a href="./licensing.do">
		<div id="idx_container_first">
			<div style = "margin-top:10px; margin-left:10px;">
				<div style="float:left;height:158px;width:49%; background-color:#3e4079;">
					<p style="margin:15px;color:#fff;font-size:20px;">사업 인허가</p>
				</div>
				<div style="float: left;height:158px;width:49%">
					<img src="./images/newmain_img1.jpg" alt="" style="width:100%;height:100%;">
				</div>
			</div>
			<div style="color:#333333;margin-left:10px;margin-top:180px;width:96%;font-size:13px;font-weight:400;">
				<p>&nbsp;&nbsp;화장품제조업(제조판매업), 민간자격등록, 식품제조업, 개발행위허가 등의 사업을 하기 위해서는 인가 또는 허가를 필요로 하며, 사업의 종류에 따라 필수 요건을 갖추어야 합니다.</p>
				<p>위드문 인터내셔널은 해당 사업인허가를 위해 알아야할 절차와 서류준비, 법령에서...</p>
			</div>
			<!--a href="./new_page.html?co_id=licensing">
				<div style="margin-top: 115px;;width:97%;text-align:right;margin-rignt:10px;">
					<p class="more">Learn more...</p>
				</div>
			</a-->
		</div>
		</a>


       <a href="./immigration.do">
		<div id="idx_container_second" >
			<div style="margin-top:10px; margin-left:10px;height:158px;width:93%;">
				<img src="./images/newmain_img2.jpg" alt="" style="width:100%;height:100%;">
			</div>
			<div style="color:#252766;margin-left:10px;font-size:15px;margin-top:13px;font-weight:500;">
				외국인투자기업(D-8)
			</div>
			<div style="width:96%;margin-left:10px;font-size:13px;margin-top:20px;font-weight:400;">
				「외국인투자촉진법」에 따른 외국인투자기업<br> 대한민국 법인의 경영 관리 또는 생산 기술 분야에 종사하려는 필수 전문인...
			</div>
			<!--a href="./new_page.html?co_id=immigration">
				<div style="margin-top: 76px;;width:97%;text-align:right;margin-rignt:10px;">
					<p class="more">Learn more...</p>
				</div>
			</a-->		
		</div>
        </a>

		<div id="idx_container_third" >
			<div style = "margin-top:10px; margin-left:10px;color:#333333;">
				<div>
					<h3 style ="margin-top:23px;font-size:24px;color:#252766;font-weight:normal;">Quick Menu 
					<span style="margin-left: 40px;font-weight:bold;color:#43b02a;font-size:16px;">>>></span></h3>
				</div>

				<div style="margin-top:50px;width:93%;height:5px;background-color:#dedede;"></div>
                <a href="./professional_translation.do">
					<div style="margin-top:32px;height:158px;width:96%;">
						<img src="./images/new_main_but12.jpg" alt="" style="width:100%;height:100%;">
					</div>
					<div style="margin-top:5px;color:#252766;font-size:15px;font-weight:bold;">
						전문번역
					</div>
				</a>
				<a href="./service_procedure.do">
					<div style="margin-top:32px;height:158px;width:96%;">
						<img src="./images/newmain_img5.jpg" alt="" style="width:100%;height:100%;">
					</div>
					<div style="margin-top:5px;color:#252766;font-size:15px;font-weight:bold;">
						번역서비스절차 <span style="font-size:11.5px;">(외국어번역행정사업부)</span>
					</div>
				</a>
				<a href="./employment_notice.do">
					<div style="margin-top:32px;height:158px;width:96%;">
						<img src="./images/newmain_img6.jpg" alt="" style="width:100%;height:100%;">
					</div>
					<div style="margin-top:5px;color:#252766;font-size:15px;font-weight:bold;">
						채용공고
					</div>
				</a>
	
			</div>
		</div>
		
		<a href="./acting_translation.do">
		<div id="idx_container_fourth" >
			<div style="margin-top:10px; margin-left:10px;height:158px;width:93%;">
				<img src="./images/newmain_img3.jpg"" alt="" style="width:100%;height:100%;">
			</div>	
			<div style="margin-left:10px;font-size:15px;margin-top:13px;color:#252766;">
				번역공증대행
			</div>
			<div style="width:96%;margin-left:10px;font-size:13px;font-weight:400; margin-top:20px;">
			    &nbsp;&nbsp;번역문서의 진실성과 관련하여 일정한 자격이 있는 자(공인외국어번역행정사 등)가 본 번역문이 원문과 상위 없음을 진술 및 확약하고 이에 공증인이 인증하...				
			</div>
			<!--a href="./new_page.html?co_id=acting_translation">
				<div style="margin-top:60px;width:97%;text-align:right;margin-rignt:10px;">
					<p class="more">Learn more...</p>
				</div>
			</a-->
		</div>
        </a>

       <a href="./overseas.do">
		<div id="idx_container_fifth" >
			<div style = "margin-top:10px; margin-left:10px;">
				<div style="float:left;height:158px;width:49%; background-color:#3e4079;">
					<p style="margin:15px;color:#fff;font-size:18px;">해외법인(지사/투자)설립</p>
				</div>
				<div style="float: left;height:158px;width:49%">
					<img src="./images/newmain_img4.jpg"" alt="" style="width:100%;height:100%;">
				</div>
			</div>
			<div style="color:#333333;font-weight:400;width:96%;margin-left:10px;font-size:13px;margin-top:180px;">
				&nbsp;&nbsp;우리나라는 수출주도형 경제성장정책(모델)에 의한 정책적인 관리와 지원으로 고도의 성장을 거듭해가고 있습니다.<br>
				부족자원이 빈약하고 대한민국 시장 규모가 협소한 우리나라의 경제현실상 당연하고 필연적인 선택이...
			</div>
			<!--a href="./new_page.html?co_id=overseas">
				<div style="margin-top:100px;width:97%;text-align:right;margin-rignt:10px;">
					<p class="more">Learn more...</p>
				</div>
			</a-->		
		</div>
		</a>

	
	
	 </div>
</div>