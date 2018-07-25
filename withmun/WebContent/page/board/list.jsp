<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="wrapper">
	<div class="container">
		<div class="top">
			<a href="/">HOME</a> > <a href="./about.do">About WithMUN</a> > <a
				href="./list.do">Q & A</a>
		</div>

		<div class="toptit">
			<h2>
				<a href="./list.do">Q & A</a>
			</h2>
			<p>최상의 상품제공 및 서비스를 통하여 고객님께서 다시 찾으실 수 있도록 최선을 다하겠습니다.</p>
		</div>
	</div>
</div>
<!------------------------------------------------------------------->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$(".jtoggle_up").click(function() {
			$(".toggle_menu").slideDown();
			$(".jtoggle_down").css("display", "block");
			$(".jtoggle_up").css("display", "none");
		});
		$(".jtoggle_down").click(function() {
			$(".toggle_menu").slideUp();
			$(".jtoggle_down").css("display", "none");
			$(".jtoggle_up").css("display", "block");
		});

		$(".jtoggle_up2").click(function() {
			$(".toggle_menu2").slideDown();
			$(".jtoggle_down2").css("display", "block");
			$(".jtoggle_up2").css("display", "none");
		});
		$(".jtoggle_down2").click(function() {
			$(".toggle_menu2").slideUp();
			$(".jtoggle_down2").css("display", "none");
			$(".jtoggle_up2").css("display", "block");
		});
	});
</script>
<!------------------------------------------------------------------->
<style>
/* container_list */
.container_list {
   position: relative;
   margin: 0 auto 0;
}

/* simplecomment write */
.contents .simplecomment.write {
   background: #f5f5f5;
   border-top: 1px solid #636363;
   padding: 5px 0;
}

.contents .simplecomment.write div {
   width: 100%;
   height: 60px;
   padding: 20px 2% 0 20px;;
}

.contents .simplecomment.write strong {
   font-size: 14px;
   font-weight: 400;
   color: #666666;
   display: block;
   padding: 15px 20px;
}

.contents .simplecomment.write strong_qna_id {
   font-size: 14px;
   font-weight: 400;
   color: #666666;
   padding: 10px 20px;
}

.contents .simplecomment.write div textarea {
   float: left;
   height: 60px;
   width: 87%;
   border: 1px solid #c9c9c9;
   background: #FFF;
   resize: none;
   padding: 5px 1%;
}

.contents .simplecomment.write div input {
   margin-left: 18px;
   height: 60px;
   width: 10%;
   border: 1px solid #636363;
   background: #636363;
   color: #FFF;
}

.contents .simplecomment.write span {
   display: block;
   clear: both;
   padding: 10px 15px;
   color: #aaaaaa;
   font-size: 11px;
}

/* simplecomment state */
.contents .simplecomment.state {
   margin-top: 30px;
   border-bottom: 1px solid #e1e1e1;
   color: #aaaaaa;
   padding: 5px 0;
}

.contents .simplecomment.state span {
   font-size: 2px;
}

.contents .simplecomment.state strong {
   color: #0e3d9c;
   font-weight: 400;
}

/* simplecomment */
.contents ul.simplecomment li {
   border-bottom: 1px solid #e1e1e1;
   position: relative;
}

.contents ul.simplecomment li div {
   padding: 20px;
   padding-bottom: 5px;
}

.contents ul.simplecomment li div strong {
   color: #0e3d9c;
   font-weight: 400;
}

.contents ul.simplecomment li div .bar {
   color: #cccccc;
   display: inline-block;
   padding: 0 10px;
}

.contents ul.simplecomment li div .date {
   color: #888888;
   letter-spacing: -1px;
}

.contents ul.simplecomment li div .reply {
   color: #bdbdbd;
   display: inline-block;
   padding: 0 10px;
}

.contents ul.simplecomment li p {
   color: #444444;
   padding: 5px 20px 20px;
}

.contents ul.simplecomment li div.btn {
   position: absolute;
   top: 20px;
   right: 15px;
   padding: 0;
   
}



.contents ul.simplecomment li div.btn input {
   display: block;
   font-size: 11px;
   border: 1px solid #c6c6c6;
   color: #858585;
   padding: 5px 5px;
   height: 25px;
   line-height: 11px;
   background: #FFF;
   margin-bottom: 3px;
   font-family: "NanumGothic";
}

/* con */
.con h2>strong, .contents h3>strong {
   color: #ff5d13;
}

.con p {
   line-height: 1.5;
   padding-bottom: 10px;
   text-align: justify;
}

.con p.padding0 {
   padding: 0;
}

.con .pdl0 {
   padding-left: 0;
}

.con p a {
   color: #0e3d9c;
   text-decoration: underline;
}

.con .box01 {
   background: #f1f1f1;
   padding: 10px 20px;
   overflow: hidden;
}

.con .box01_left {
   width: 50% background:#f1f1f1;
   padding: 0px 0 0 20px;
   overflow: hidden;
}

.con .box01_right {
   background: #f1f1f1;
   padding: 0px 20px;
   overflow: hidden;
}

.con {
   width: 750px;
   margin: 0 auto;
   padding-bottom: 40px;
   font-size: 13px;
}

.con section {
   margin-bottom: 30px;
   overflow: hidden;
}

.con section section {
   margin-bottom: 20px;
}

.con h2 {
   position: relative;
   color: #333333;
   font-size: 22px;
   font-family: "NanumGothicBD";
   font-weight: 400;
   line-height: 20px;
   margin-bottom: 20px;
}

.con h3 {
   position: relative;
   font-size: 16px;
   font-family: "NanumGothicBD";
   font-weight: 400;
   line-height: 20px;
   margin: 10px 0;
}

/* subContents */
section.subContents {
   background-color: #ffffff;
   font-weight: 300;
   font-size: 15px;
   line-height: 24px;
}

section.subContents>.contents {
   width: 798px;
   padding: 20px;
   color: #5c5c5c;
   line-height: 18px;
}

section.subContents>.contents.full {
   padding-left: 20px;
}

section.subContents>.contents>nav {
   width: 700px;
   top: 0;
   left: -40px;
   padding: 20px 45px 19px;
   position: relative;
   height: 30px;
   border-bottom: 1px #e6e6e6;
   background: #FFF;
   margin-bottom: 40px;
}

section.subContents>.contents.full>nav {
   width: 910px;
}

section.subContents>.contents>nav>h1 {
   color: #333333;
   font-weight: 400;
   font-family: "NanumGothicBD";
   font-size: 30px;
   line-height: 30px;
}

section.subContents>.contents>nav>p {
   position: absolute;
   top: 30px;
   right: 0px;
   color: #999999;
   font-size: 15px;
}

section.subContents>.contents>nav>p>a {
   color: #999999;
}

section.subContents>.contents>nav>p>a.on {
   color: #666666;
}

/* replyform */
.replyform {
   height: 30px;
   border-top: 1px dashed #e1e1e1;
   position: relative;
   padding: 10px 0 !important;
}

.replyform textarea {
   float: left;
   height: 30px;
   width: 82%;
   border: 1px solid #e1e1e1;
   background: #FFF;
   resize: none;
   margin-left: 5%;
}

.replyform p {
   float: right;
   height: 30px;
   width: 10%;
   line-height: 30px;
   text-align: center;
   padding: 0 !important;
   color: #858585;
   font-size: 11px;
   margin-right: 1%;
}

.replyform p a {
   color: #858585;
   font-size: 11px;
   font-family: "NanumGothic";
}

/* reply */
li.reply .replyform p {
   padding: 0 !important;
}

li.reply {
   
}

li.reply {
   border-bottom: 1px dashed #e1e1e1 !important;
}

li.reply p {
   padding: 5px 50px 20px !important;
}

/* fieldset */
fieldset.search2 {
   display: block;
   width: 723px;
   height: 33px;
   margin-top: 45px;
   padding-top: 10px;
   text-align: center;
}

fieldset.search2 select {
   font-size: 12px;
   line-height: 18px;
   vertical-align: middle;
   
}

fieldset.search2 input.text {
   font-size: 12px;
   line-height: 18px;
   vertical-align: middle;
}

fieldset.search2 input.btn {
   vertical-align: middle;
}

fieldset.search2 input.qna_submit {
   height: 22px;
   width: 7%;
   margin-left: 5px;
   border: 1px solid #1f497d;
   background: #1f497d;
   color: #FFF;
}

fieldset.search3 {
   display: block;
   height: 57px;
   padding-top: 5px;
   border: 1px solid #424242;
   background: #535353;
   text-align: center;
}

fieldset.search3 select {
   vertical-align: middle;
}

fieldset.search3 input.text {
   border: 1px solid #3d3d3d;
   vertical-align: middle;
}

fieldset.search3 input.img {
   vertical-align: middle;
}

fieldset.search3 span {
   margin-left: 7px;
}

fieldset.search3 input.check {
   width: 13px;
   height: 13px;
   margin: 0;
   padding: 0;
   vertical-align: middle;
}

fieldset.search3 label {
   display: inline-block;
   color: #ffffff;
   font-family: NANUM;
   font-size: 12px;
   line-height: 18px;
   vertical-align: middle;
}

fieldset.search3 p {
   margin-top: 7px;
   color: #dddddd;
   font-family: NANUM;
   font-size: 12px;
   line-height: 18px;
}


/* paging */
/* div.paging {
   width: 100%;
   margin-top: 15px;
   text-align: center;
   font-size: 0;
   line-height: 0;
   vertical-align: top;
} */

#buttons{
   width: 100%;
   margin-top: 15px;
   text-align: center;
   font-size: 0;
   line-height: 0;
   vertical-align: top;
}

#buttons input {
   display: inline-block;
   width: 37px;
   height: 37px;
   margin: 0px 4px;
   padding-top: 3px;
   border: 2px solid #e0e0e2;
   border-right: 2px solid #e0e0e2;
   border-bottom: 2px solid #e0e0e2;
   font-family: NANUM;
   font-size: 12px;
   line-height: 18px;
   vertical-align: top;
   cursor:pointer;
   text-decoration:none;
   
}

div#buttons input{
   color: #000;
   font-weight: bold;
   background:#ffffff;
   boarder
}


.wrap {
    width: 300px;
    height: auto;
    position: relative;
    resize: none;
    border-radius: 0.5em;
     
}
.wrap input{
   border:none; 
   border-right:0px; 
   border-top:0px; 
   boder-left:0px; 
   boder-bottom:0px;
   text-align:right;
}
.hidden_reply input{
   display: inline-block;
   width: 37px;
   height: 34px;
   margin: 0px 4px;
   padding-top: 3px;
   border: 2px solid #e0e0e2;
   border-right: 2px solid #e0e0e2;
   border-bottom: 2px solid #e0e0e2;
   font-family: NANUM;
   font-size: 12px;
   line-height: 18px;
   vertical-align: top;
   cursor:pointer;
   text-decoration:none;
   background:#ffffff;
   
}

</style>

<div class="main">
	<div class="main_wrap">

		<%@ include file="../../include/left_about.jsp"%>

		<div class="content">
			<div class="container_list">
				<section class="subContents">
					<section class="contents">
						<section class="con">
							<form id="frontBoardVo" name="frontBoardVo" action="insert.bo"
								method="post">

								<!-- <input type='file' name='attachFile1' style="display: none"/> -->

								<section class="simplecomment write">
									<strong>궁금한 점 물어봐주세요.</strong>
									   <strong_qna_id>이름</strong_qna_id>
                           <input type='text' name='qna_name' size=10px onkeyup="chkByte(this,6)"/>
                           <strong_qna_id>PW</strong_qna_id>
                           <input type='password' name='qna_pwd' size=10px onkeyup="chkByte(this,10)"/>
                           <div class="remaining">
                              <!-- <label>comment: <textarea rows="3" cols="50" name="bbsc" id="bbsc"></textarea></label> -->
                              <textarea rows="3" cols="50" name="document" id="document" onkeyup="chkByte(this,300)"></textarea>
										<input type='hidden' name='nowPage'
											value='${empty param.nowPage ? 1 : param.nowPage }' /> <input
											type="submit" value="작성" />
							</form>
			</div>
			<span>최대 <em class="count">0</em>/300자
			</span>
			
			</section>
			

  
<!-- 실시간 글자수 -->
         <div class='wrap'>
         <input type='text' id='write' size='1' value='0' readOnly/>/300자
         </div>
		<p class="simplecomment state">
            <span>ㆍ</span> <strong>${dao.totSize}</strong>개의 게시물이 있습니다.
         </p>

			<c:forEach var="list" items="${list }">
			<c:if test = "${list.reply eq 1 or list.reply eq 2 }">

				<ul class="simplecomment">
					<li>
						<div>

							<strong>${list.name }</strong> <span class="bar">|</span> <span
								class="date">${list.bdate }</span>
						</div>

						<p style="width: 88%;">
							${list.doc }
							<!-- </a> -->
						</p>

						<div class="btn">
							<c:choose>
								<c:when test="${empty id}">
								</c:when>
								<c:when test="${list.reply eq 2}">
									<strong>답변 완료</strong>
								</c:when>
								<c:otherwise>
									<input type='button' class="reply"
										onclick='reply_show(${list.serial})' value='답변'>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${list.reply eq 2}">
								</c:when>
								<c:otherwise>
									<input type='button' class="delete"
										onclick='list_delete(${list.serial})' value='삭제'>
								</c:otherwise>
							</c:choose>
						</div> <input type='hidden' name='hidden_serial' value='${list.serial }' />
						<input type='hidden' name='hidden_reply' value='${list.reply }' />
						<!-- 답변 내용 -->
						<div class="hidden_reply" id="hidden_reply${list.serial }" style="display: none;">
							<textarea rows="2" cols="50" id="reply_ta${list.serial }" name="reply_ta${list.serial }"></textarea>
							
							<p>
								<input type='button' onclick='list_reply(${list.serial})'
									value='등 록'> <input type='button'
									onclick='list_reply_close(${list.serial})' value='닫 To The 기'>
							</p>
							
						</div>		
						</c:if>
						<c:if test = "${list.reply eq 3 }">
						<div style = "background-color: #CCEEFF;">
						답변 )
							&emsp;<div>
							
							&emsp;<strong>${list.name }</strong> <span class="bar">|</span> <span
								class="date">${list.bdate }</span>
							&emsp;</div>
							
							&emsp;<p style="width: 88%;">
							
							&emsp;${list.doc }
							
							&emsp;</p>
						</div>
						</c:if>
						</c:forEach>
					<!-- 답변 끝 -->
					</li>
				</ul>

			<form name='list_frm'>
				<input type='hidden' name='hidden_serial' /> 
				<input type='hidden' name='hidden_prompt' /> 
				<input type='hidden' name='hidden_reply_ta' />
			</form>

			<div id='buttons'>
				<c:if test='${dao.nowBlock>1}'>
					<input type='button' value='맨첨' onclick='movePage(1)' id='btnFirst'
						class='buttonP' />
					<input type='button' value='이전' onclick='movePage(${dao.startPage-1 })' id='btnPrev'
						class='buttonP' />
				</c:if>

				<c:forEach var='p' begin='${dao.startPage }' end='${dao.endPage}'>
					<c:set var='here' value='' />
					<c:if test='${p == dao.nowPage }'>
						<c:set var='here' value="here" />
					</c:if>
					<input type='button' value='${p }' class='${here }'
						onclick='movePage(${p})' class='buttonP' />
				</c:forEach>

				<c:if test='${dao.nowBlock < dao.totBlock}'>
					<input type='button' value='다음'
						onclick='movePage(${dao.endPage+1})' id='btnNext' class='buttonP' />
					<input type='button' value='맨끝' onclick='movePage(${dao.totPage})'
						id='btnLast' class='buttonP' />
				</c:if>
			</div>

			<!--/paging-->
			<form name='list_find'>
				<div class="btn-r3"></div>
				<fieldset class="search2">
					<legend>검색</legend>
					<select name="key" style="width: 88px;" title="검색 옵션 선택">
						<option value='bbsconts'>내 용</option>
						<option value='bbsusername'>작성자</option>
					</select> <input type="text" size='35' class="text" name="findStr"
						value="${param.findStr }" title="검색어 입력"
						onkeydown="if(event.keyCode==13){return false;}" />
					<input type="submit" class="qna_submit" name="findFind" value='검색' />
				</fieldset>
			</form>

			<!-- 페이징 script -->
			<script>
	document.frontBoardVo.onsubmit = function(){
		var ff = document.frmList;
		ff.nowPage.value = 1;
		ff.submit();
	}
	
	function movePage(nowPage){
		var ff = document.frontBoardVo;
		ff.nowPage.value = nowPage;
		ff.submit();
	}
	</script>
			<!-- 삭제script -->
			<script>
	var ff = document.list_frm;
	function list_delete(serial){
		ff.hidden_serial.value = serial;
		var prom = prompt('비밀번호를 입력해주세요.','PassWord');
		ff.hidden_prompt.value = prom;
		ff.action = 'delete.bo';
		ff.submit();
	}	
	</script>

			<!-- 답글 script -->
			<script>
	var ff = document.list_frm;
	function reply_show(serial){
		document.getElementById("hidden_reply"+serial).style.display='block';
	}
	
	function list_reply_close(serial){
		document.getElementById("hidden_reply"+serial).style.display='none';
	}
	
	
	function list_delete(serial){
		ff.hidden_serial.value = serial;
		var prom = prompt('비밀번호를 입력해주세요.','PassWord');
		ff.hidden_prompt.value = prom;
		
		ff.action = 'delete.bo';
		ff.submit();
	}
	
	function list_reply(serial){
		ff.hidden_serial.value = serial;
		var text = $("textarea#reply_ta"+serial).val();
		ff.hidden_reply_ta.value = text;
		
		ff.action = 'reply.bo';
		ff.submit();
	}
	
	function find_list(){
		ff.action = 'list.bo';
		ff.submit();
	}
	
	
	</script>
	<!-- 실시간 문자수 script -->
         <script>
         function chkByte(name, msgMax) {
             var msgList = name.value;  // 글자가 입력되는 이벤트가 발생되는 value 값
             var msgListLength = msgList.length;  // 입력 되는 글자의 전체 길이
             
             var limitSize = msgMax;  // 제한 할 글자 길이
             var charOne = "";  // 한 글자씩 검사하기 위한 변수
             var charByte = 0;  // 입력 되고 있는 문자의 길이(바이트) 를 저장할 변수
             var msgLen = 0;  // 입력 내용을 담아 subString 할 변수
             var msgLast = "";  // 글자수가 초과 할 경우, 제한 할 마지막 글자 까지 보여준다
             
             for(var i = 0; i < msgListLength; i++) {  // 입력 되고 있는 글자의 전체길이를 루프를 돈다.
              charOne = msgList.charAt(i);  // 한글자씩 읽음
             
              // 한글은 2byte 이므로, 한글이 입력 되고 있을 경우 2를 더한다.
              if(escape(charOne).length > 4) {
               charByte += 1;
              } else {
               charByte++;  // 그 외에 경우에는 1byte. 1을 더한다.
              }
              
              if(charByte <= limitSize) {  // 전체 크기가 제한 글자 길이를 넘지 않는다면..
               msgLen = i + 1;
              }
             }
             
             if(charByte > limitSize) {
              alert(limitSize + " 글자를 초과 입력 할 수 없습니다.");
              msgLast = msgList.substr(0, msgLen);
              name.value = msgLast;
              charByte = limitSize;
             }
             
             document.getElementById('write').value = charByte;
            }
         </script>

			</section>
			</section>
			</section>

		</div>


	</div>
</div>
</div>