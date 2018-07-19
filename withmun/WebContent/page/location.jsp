<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
/*
.main{min-width:1100px; background-color:#d8d8d8;width:100%;margin-top:-15px;}
.left{margin-top:20px;float:left;width:22%;background-color:#FFFFFF;margin-right:20px;}
.content{margin-top:20px;float:left;width:76%;margin-bottom:20px;}
*/
.lo_first{height:285px;float:left;margin-right:18px;background-color:#FFFFFF;width:30%;}
.lo_second{height:285px;float:left;background-color:#FFFFFF;width:67%; padding:10px;}
.lo_third{height:170px;margin-top: 10px;float:left;background-color:#FFFFFF;width:99.4%;}
.lo_fourth{height:520px;margin-top: 10px;float:left;background-color:#FFFFFF;width:99.4%;}
#map{margin-top:10px;margin-left:10px;width:97.5%; height:87%;}
/*
.line2{width:80%;height:1px;background-color:#7f7f7f;margin-top:5px;width:93%;}
*/

</style>

<!------------------------------------------------------------------->
<div id ="mask">
<div id="conMain" style="display:none;" class='conMain'>
   <div id = 'conHead'>
      <h2 id = 'title' style ="text-align:center;">Contact Us</h2>

   </div>
   <form name="conFrm" id="conFrm" method="post">
      <table class="table" id = 'table'>
      <tr>
         <th>받는 이메일</th>
         <td>
         <select name="conSelect">
	      <option value = 'nks0817@nate.com'>nks0817@nate.com</option>
	      <option value = 'ckh0103@naver.com'>ckh0103@naver.com</option>
	      <option value = 'iyabong@naver.com'>iyabong@naver.com</option>
        </select>
        </td>
      </tr>
      <tr>
         <th>성명</th>
         <td><input type="text" id="conName" name="conName" size = '30px' value=""></td>
      </tr>
      <tr>
         <th>E Mail</th>
         <td><input type="text" id="conEmail" name="conEmail" size = '30px' value=""></td>
      </tr>
      <tr>
         <th>제목</th>
         <td><input type="text" id="conSubject" name="conSubject"  size = '55px' value="" maxlength="48"></td>
      </tr>
      <tr>
         <th>내용</th>
         <td><textarea id="conDoc" name="conDoc" rows = '5px' cols ='57px'></textarea></td>
      </tr>
      </table>
      <hr/>
      <div class="under">
            <input type="button" id = 'btnClose' value="닫 기"/>
            <input type="button" id = 'btnSubmit' value="전 송"/>
      </div>
   </form>
</div>
</div>
<!------------------------------------------------------------------>

<div id="wrapper">
   <div class="container">
      <div class ="top">
         <a href="/" ">HOME</a>
         > <a href="./about.do" >About WithMUN</a>
         > <a href="./location.do" class="on">오시는길</a>
      </div>
      
      <div class="toptit">
          <h2><a href="./location.do">오시는길</a></h2>
         <p>최상의 상품제공 및 서비스를 통하여 고객님께서 다시 찾으실 수 있도록 최선을 다하겠습니다.</p>
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

      
   });
   $(".jtoggle_down").click(function(){
      $(".toggle_menu").slideUp();
      $(".jtoggle_down").css("display","none");
      $(".jtoggle_up").css("display","block");
   });
});
</script>


<div class ="main">
   <div class="main_wrap">
   <%@ include file = "../include/left_about.jsp" %>
   
      <div class = "content">
         
         <div class ="lo_first">
            <div style ="margin-top:15px;margin-left:15px;">
               <div style="color:#8f8f8d;font-weight:bold;font-size:13px;">
                  WithMUN INTERNATIONAL
               </div>

               <div style="margin-top:20px;font-weight:bold;color:#404040;line-height:1.8;">
                  <h1 style="color:#1f497d;font-size:14px;margin-bottom: -2px;">사무소주소</h1>
                  서울시 서초구 서초중앙로 26길 8,  <br>
                  건복빌딩 501호(서초동 1694-34)<br>
                  (우편번호 06605)

               </div>

               <div style="margin-top:16px;font-weight:bold;color:#404040;line-height:1.8;">
                  <h1 style="color:#1f497d;font-size:14px;margin-bottom: -2px;">Office address</h1>
                  #501, 8, Seochojungang-ro, 26-gil, Seocho-gu, Seoul, Republic of Korea (Zip code 06605)


               </div>

               <div style="margin-top:15px;font-weight:bold;color:#404040;line-height:1.8;">
                  <div style="display:inline-block">
                     <img src="./images/email3.png" style="width: 20px;    margin-top: -3px;" alt=""">
                  </div>
                  <div style="display:inline-block">
                        <a href='#' style="color:#0076bf;font-size:12px;" onclick = "go_email(1)">withmun@withmun.com</a>
                  </div>
               
                  
               </div>
            </div>
         </div>


         <div class ="lo_second">
            <img src="./images/location_topimg.jpg" alt="" style="width:100%;height:100%;">
         </div>
         
         <div class ="lo_third">
            <div style="margin-top:20px;margin-left:10px;">
               <span style="color:#8f8f8d;font-weight:bold;font-size:13px;">WithMUN INTERNATIONAL</span>
            </div>
            <div style="margin-top:20px;margin-left:10px;line-height:2;">
               <div style="display:inline-block;width:40%;">
                      <h3>일반행정사업부</h3>               
                     Tel.  02-525-6201<br>               
                     Fax. 02-525-6202   <br>               
                     <a href='#' style="color:#0076bf;font-size:12px;" onclick = "go_email(2)">didi_attorney@withmun.com</a>            
               </div>
               
               <div style="display:inline-block;width:40%;">
                  <h3>외국어번역행정사업부</h3>
                  Tel.  02-525-6209<br>
                  fax.  02-525-6202<br>
                  <a href='#' style="color:#0076bf;font-size:12px;" onclick = "go_email(3)">jbk521@withmun.com</a>
               </div>
               
            </div>
         
         </div>

         <div class ="lo_fourth">
            <div style="margin-top:20px;margin-left:10px;">
               <span style="color:#8f8f8d;font-weight:bold;font-size:13px;">Location</span>
            </div>
            <div id="map" style=""></div>
            
            <script>
               var map;
               function initMap() {

                  map = new google.maps.Map(document.getElementById('map'), {
                  center: {lat: 37.495553, lng: 127.014071 },
                  zoom: 17
                  });   
                  var marker;
                  var latlng = new google.maps.LatLng(37.495553, 127.014071 );
                  marker = new google.maps.Marker({ 
                        position: latlng, 
                        map: map,
                        title: '마커'
                  });


               }

            function email_check(conSelect){
               var ff = document.conFrm;
               
            }
            
               var ff = document.conFrm;
               ff.btnSubmit.onclick = function() {
                  var msg = confirm("입력한 내용으로 제출 하시겠습니까?");
                  if (msg) {
                     alert("제출 되었습니다.");
                     var con = document.getElementById("conMain");
                     con.style.display = 'none';
                     ff.action = 'mail_result.do';
                     ff.submit();
                  }
               }
               
                ff.btnClose.onclick = function() {
                  var con = document.getElementById("conMain");
                  con.style.display = 'none';
               }
                
                  $('#btnClose').click(function () {  
                   //링크 기본동작은 작동하지 않도록 한다.
                      $('#mask').hide(); 
                  });
                      
               function go_email(email_value) {
             	
            	  
            	  
            	  var con = document.getElementById("conMain");
                  var maskHeight = $(document).height();
                  var maskWidth = $(window).width();
                  var ff = document.conFrm;


                  if(email_value == '1'){
                	  ff.conSelect.value = 1;
                  }
                  else if(email_value == '2'){
                	  ff.conSelect.value = 2;
                  }
                  else if(email_value == '3'){
                	  ff.conSelect.value = 3;
                  }
                  
                  
                  con.style.display = 'block';
                  
                  if (con.style.display == 'block') {
                     $('#mask').css({
                        'width' : maskWidth,
                        'height' : maskHeight
                     });
                     
                     //애니메이션 효과
                     $('#mask').fadeTo("fast", 1.0);
                  } else {

                  }
               }      
            
                  
            </script>
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAwoX1eeLn5S2MhgcmF79bog0GuVoupq5I&callback=initMap"async defer></script>
         </div>      
      </div>
   </div>
</div>
