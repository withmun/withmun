<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>




</script>
<!------------------------------------------------------------------->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog" id="conMain" >
    <div class="modal-content" id = 'conHead' style="">
   <form name="conFrm" id="conFrm" method="post">
         <div class="modal-header" style = "background-color:#1f497d;">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <h2 id = 'title' style ="text-align:center; font-size: 36px; color: white;">Contact Us</h2>
   </div>
    <div class="modal-body" style="background-color:#E9F0F2">
      <table class="table" id = 'table'>
      <tr>
         <th >받는 이메일</th>
         <td>
         <select name="conSelect" class="form-control">
	         <option value = 'nks0817@nate.com'>nks0817@nate.com</option>
	         <option value = 'ckh0103@naver.com'>ckh0103@naver.com</option>
        	 <option value = 'iyabong@naver.com'>iyabong@naver.com</option>
        </select>
        </td>
      </tr>
      <tr>
         <th style="">성명</th>
         <td><input type="text" placeholder="명을 입력하세요"  class="form-control" id="conName" name="conName"></td>
      </tr>
      <tr>
         <th style="">E Mail</th>
         <td><input type="email" placeholder="이메일을 입력하세요"  class="form-control" id="conEmail" name="conEmail"></td>
      </tr>
      <tr>
         <th>제목</th>
         <td><input type="text" placeholder="성명을 입력하세요"  class="form-control" id="conSubject" name="conSubject" ></td>
      </tr>
      <tr>
         <th>내용</th>
         <td><textarea id="conDoc" placeholder="제목을 입력하세요" class="form-control" name="conDoc" rows = '5px'></textarea></td>
      </tr>
      </table>
       </div>
      <div class="modal-footer">
            <input type="button" id = 'btnClose' class="btn btn-default" data-dismiss="modal" value="닫 기"/>
            <input type="button" id = 'btnSubmit' class="btn btn-primary" style = "" value="전 송"/>
      </div>
   </form>
      </div>
      
</div>
</div>
<!------------------------------------------------------------------>

<div id="wrapper">
   <div class="container">
      <div class ="top">
         <a href="./index.jsp" ">HOME</a>
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
            <div id = "lo_first_div">
               <div id ="lo_first_head">
                  WithMUN INTERNATIONAL
               </div>

               <div id ="lo_first_kor" >
                  <h1 style="">사무소주소</h1>
                           서울시 서초구 서초중앙로 26길 8,  <br>
                           건복빌딩 501호(서초동 1694-34)<br>
                           (우편번호 06605)

               </div>

               <div id="lo_first_eng" style="">
                  <h1 style="">Office address</h1>
                  #501, 8, Seochojungang-ro, 26-gil, Seocho-gu, Seoul, Republic of Korea (Zip code 06605)
            </div>

               <div id="lo_first_foot">
                  <span>
                     <img src="./images/email3.png" style="" alt=""">
                     <a href='#' style="" data-toggle="modal" onclick = "go_email(1)" data-target="#myModal">withmun@withmun.com</a>
                  </span>
               </div>
            </div>
            
         </div>



         <div class ="lo_second">
            <img src="./images/location_topimg.jpg" alt="" style="">
         </div>
         
         <div class ="lo_third">
            <div id="lo_third_head">
               <span style="">WithMUN INTERNATIONAL</span>
            </div>
            <div id="lo_third_content" style="">
            
               <div id="lo_third_content_left" style="">
                  <h3>일반행정사업부</h3>               
                  Tel.  02-525-6201<br>               
                  Fax. 02-525-6202   <br>               
                     <a href='#' data-toggle="modal" onclick = "go_email(2)" data-target="#myModal">
                     <img id ="mail_icon_img" src="./images/email3.png" style="" alt=""">
                     didi_attorney@withmun.com
                     </a>            
               </div>
               
               <div id="lo_third_content_right" style="">
                  <h3>외국어번역행정사업부</h3>
                  Tel.  02-525-6209<br>
                  fax.  02-525-6202<br>
                  <a href='#' id="jbk521" data-toggle="modal" onclick = "go_email(3)" data-target="#myModal">
                  <img id ="mail_icon_img" src="./images/email3.png">
                  
                  jbk521@withmun.com</a>
               </div>
               
            </div>
         	
         	
         	
         </div>
		
		<script>

	
		</script>
		
         <div class ="lo_fourth">
            <div id ="lo_fourth_head" style="">
               <span>Location</span>
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
               ff.action = 'mail_result.do';
               ff.submit();
            }
         }   
         
         function go_email(email_value) {
         var con = document.getElementById("conMain");
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
         
         }      
            
                  
            </script>
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAwoX1eeLn5S2MhgcmF79bog0GuVoupq5I&callback=initMap"async defer></script>
         </div>      
      </div>
   </div>
</div>