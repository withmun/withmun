<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<Style>
/* container */
.container {position:relative; width:960px; margin:0 auto 0;}

/* simplecomment write */
.contents .simplecomment.write {background:#f5f5f5; border-top:1px solid #636363; padding:5px 0;}
.contents .simplecomment.write strong {font-size:14px; font-weight:400; color:#666666; display:block; padding:10px 20px;}
.contents .simplecomment.write div {width:96%; height:60px; padding:0 2%; }
.contents .simplecomment.write div textarea {float:left; height:50px; width:86%; border:1px solid #c9c9c9; background:#FFF; resize: none; padding:5px 1%;}
.contents .simplecomment.write div input {float:right; height:60px; width:10%; border:1px solid #636363; background:#636363; color:#FFF; }
.contents .simplecomment.write span {display:block; clear:both; padding:5px 15px; color:#aaaaaa; font-size:11px;}

/* simplecomment state */
.contents .simplecomment.state { margin-top:30px; border-bottom:1px solid #e1e1e1; color:#aaaaaa; padding:5px 0;}
.contents .simplecomment.state span {font-size:2px;}
.contents .simplecomment.state strong {color:#0e3d9c; font-weight:400;}

/* simplecomment */
.contents ul.simplecomment li{ border-bottom:1px solid #e1e1e1; position:relative;}
.contents ul.simplecomment li div{ padding:20px; padding-bottom:5px; }
.contents ul.simplecomment li div strong{ color:#0e3d9c; font-weight:400;}
.contents ul.simplecomment li div .bar{ color:#cccccc; display:inline-block; padding:0 10px;  }
.contents ul.simplecomment li div .date{ color:#888888; letter-spacing:-1px; }
.contents ul.simplecomment li div .reply{ color:#bdbdbd; display:inline-block; padding:0 10px; }
.contents ul.simplecomment li p{ color:#444444; padding:5px 20px 20px;}
.contents ul.simplecomment li div.btn{ position:absolute; top:20px; right:15px; padding:0;}
.contents ul.simplecomment li div.btn a {display:block; font-size:11px; border:1px solid #c6c6c6; color:#858585; padding:3px 5px; height:11px; line-height:11px; background:#FFF; margin-bottom:3px; font-family:"NanumGothic";}
.contents ul.simplecomment li div.btn a span{color:#cccccc; font-size:9px; float:left; width:10px; height:10px; line-height:10px; display:block;}

/* con */
.con h2 > strong, .contents h3 > strong {color:#ff5d13;}
.con p{line-height:1.5;padding-bottom:10px; text-align:justify;}
.con p.padding0{padding:0;}
.con .pdl0{padding-left:0;}
.con p a{color:#0e3d9c; text-decoration:underline;}
.con .box01 {background:#f1f1f1; padding:10px 20px; overflow:hidden;}
.con .box01_left {width:50% background:#f1f1f1; padding:0px 0 0 20px; overflow:hidden;}
.con .box01_right {background:#f1f1f1; padding:0px 20px; overflow:hidden;}

.con {width:700px; margin:0 auto; padding-bottom:40px; font-size:13px;}
.con section {margin-bottom:30px; overflow:hidden;}
.con section section {margin-bottom:20px;}
.con h2 {position:relative; color:#333333; font-size:22px; font-family:"NanumGothicBD"; font-weight:400; line-height:20px; margin-bottom:20px;}
.con h3 {position:relative; font-size:16px; font-family:"NanumGothicBD"; font-weight:400; line-height:20px; margin:10px 0;}

/* subContents */
section.subContents > .contents{position:relative; padding-left:210px; padding-top:0; zoom:1; color:#5c5c5c; line-height:18px; min-height:800px; background:url("/image/gangwon/togomi/line.png") repeat-y 190px top;}
section.subContents > .contents.full{padding-left:20px;}
section.subContents > .contents > nav{width:700px; top:0; left:-40px; padding:20px 45px 19px; position:relative; height:30px; border-bottom:1px solid #e6e6e6; background:#FFF; margin-bottom:40px; }
section.subContents > .contents.full > nav{width:910px;}
section.subContents > .contents > nav > h1{color:#333333; font-weight:400; font-family:"NanumGothicBD"; font-size:30px; line-height:30px; }
section.subContents > .contents > nav > p {position:absolute; top:25px; right:30px; color:#999999;}
section.subContents > .contents > nav > p > a {color:#999999;}
section.subContents > .contents > nav > p > a.on {color:#666666;}

section.subContents {position:relative; z-index:99; width:940px; margin:0 auto; background:#FFF; padding-right:20px;}
section.subContents > .contents{position:relative; padding-left:210px; padding-top:0; zoom:1; color:#5c5c5c; line-height:18px; min-height:800px; background:url("/image/gangwon/togomi/line.png") repeat-y 190px top;}
section.subContents > .contents.full{padding-left:20px;}
section.subContents > .contents > nav{width:700px; top:0; left:-40px; padding:20px 45px 19px; position:relative; height:30px; border-bottom:1px solid #e6e6e6; background:#FFF; margin-bottom:40px; }
section.subContents > .contents.full > nav{width:910px;}
section.subContents > .contents > nav > h1{color:#333333; font-weight:400; font-family:"NanumGothicBD"; font-size:30px; line-height:30px; }
section.subContents > .contents > nav > p {position:absolute; top:25px; right:30px; color:#999999;}
section.subContents > .contents > nav > p > a {color:#999999;}
section.subContents > .contents > nav > p > a.on {color:#666666;}

/* replyform */
.replyform {height:30px; border-top:1px dashed #e1e1e1; position:relative; padding:10px 0 !important;}
.replyform textarea {float:left; height:30px; width:82%; border:1px solid #e1e1e1; background:#FFF; resize: none; margin-left:5%;}
.replyform p {float:right;  height:30px; width:10%; line-height:30px; text-align:center; padding:0 !important; color:#858585; font-size:11px; margin-right:1%;}
.replyform p a {color:#858585; font-size:11px; font-family:"NanumGothic";}

/* reply */
li.reply .replyform p {padding:0 !important;}
li.reply{  }
li.reply {border-bottom:1px dashed #e1e1e1 !important; }
li.reply p {padding:5px 50px 20px !important;}

/* fieldset */
fieldset.search2 {display:block;width:723px;height:33px;margin-top:45px;padding-top:10px;border:1px solid #eaeaea;text-align:center;}
fieldset.search2 select {font-size:12px;line-height:18px;vertical-align:middle;}
fieldset.search2 input.text {font-size:12px;line-height:18px;vertical-align:middle;}
fieldset.search2 input.btn {vertical-align:middle;}
fieldset.search3 {display:block;height:57px;padding-top:5px;border:1px solid #424242;background:#535353;text-align:center;}
fieldset.search3 select {vertical-align:middle;}
fieldset.search3 input.text {border:1px solid #3d3d3d;vertical-align:middle;}
fieldset.search3 input.img {vertical-align:middle;}
fieldset.search3 span {margin-left:7px;}
fieldset.search3 input.check {width:13px;height:13px;margin:0;padding:0;vertical-align:middle;}
fieldset.search3 label {display:inline-block;color:#ffffff;font-family:NANUM;font-size:12px;line-height:18px;vertical-align:middle;}
fieldset.search3 p {margin-top:7px;color:#dddddd;font-family:NANUM;font-size:12px;line-height:18px;}

/* button */
div.btn-l {margin-top:15px;}
div.btn-r {margin-top:15px;text-align:right;}
div.btn-r2 {margin-top:-15px;text-align:right;}
div.btn-r3 {margin-top:-30px;text-align:right;font-size:0;line-height:0;vertical-align:top;}
div.btn-c {margin-top:15px;text-align:center;}
div.btn-c a img {font-size:0;line-height:0;vertical-align:top;}
div.btn-c2 {height:50px;padding-top:14px;border:1px solid #e2e2e2;background:#f3f3f3;text-align:center;}

/* paging */
div.paging {width:100%;margin-top:15px;text-align:center;font-size:0;line-height:0;vertical-align:top;}
div.paging a, div.paging strong {display:inline-block;width:26px;height:23px;margin-left:4px;padding-top:3px;border:1px solid #e0e0e2;border-right:1px solid #e0e0e2;border-bottom:1px solid #e0e0e2;font-family:NANUM;font-size:12px;line-height:18px;vertical-align:top;}
div.paging a.btn {width:auto;height:auto;padding:0;border:0;}
div.paging a.first {margin:0;}
div.paging strong, div.paging a:hover {color:#000;font-weight:bold;}


</Style>
<div class = "container">
<section class="subContents">
	<section class="contents">
		<nav>
			<h1>Q&A</h1>
			<p>
				<a href="/index.do">HOME</a>
				&gt;
				<a href="/index.html?menuno=18355&lnb=10501">게시판</a>
				&gt;
				<a href="#" class="on">한줄게시판</a>
			</p>
		</nav>
	<section class="con">
	<form id="frontBoardVo" name="board" action="/index.html?menuno=18375&amp;lnb=50501" method="post" enctype="multipart/form-data">
	
		<!-- <input type='file' name='attachFile1' style="display: none"/> -->
		<input type='hidden' name='attachFileAlt' /> 
		<input type="hidden" id="bbsconts" name="bbsconts" />

		<section class="simplecomment write">
			<strong>궁금한 점 물어봐 주세요.</strong>
			<div class="remaining">
				<!-- <label>comment: <textarea rows="3" cols="50" name="bbsc" id="bbsc"></textarea></label> -->
				<textarea rows="3" cols="50" name="bbsc" id="bbsc"></textarea>
				<input type="submit" value="등록"
					onclick="return submitForm(this,'write',0)" />
			</div>
			<span>최대 <em class="count">0</em>/300자
			</span>
		</section>

		<p class="simplecomment state">
			<span>ㆍ</span> 
			<strong>588</strong>개의 게시물이 있습니다.
		</p>


		<ul class="simplecomment">
			<li>
				<div>
					<strong>최규하</strong> <span class="bar">|</span> 
					<span class="date">1994-01-03</span>
				</div>

				<p style="width: 88%;">
					세미 프로젝트입니다.
					<!-- </a> -->
				</p>

				<div class="btn">
					<a href="#reply" class="reply" data-value="7743148">
					<span>└</span>덧글</a>
					<a href="#del" class="delete" data-value="7743148"
						data-id="midmi114"><span>×</span>삭제</a>
				</div>

				<div class="replyform" style="display: none;" id="7743148">
					<textarea rows="2" cols="50" id="bbsconts7743148"
						name="bbsconts7743148"></textarea>
					<p>
						<a href="#" onclick="return submitForm(this,'reply',7743148)">등록</a>
						| <a href="#cancel">취소</a>
					</p>
				</div>
			</li>
		</ul>


		<div class='paging'>
			<a class='btn first'>
			<img alt='처음 페이지로' src='/image/common/btn/paging_first.gif' /></a>
			<a class='btn'><img alt='전 페이지로' src='/image/common/btn/paging_prev.gif' /></a> 
			<strong>1</strong>
			<a href='###' onclick="return submitForm(this,'list',2);">2</a> 
			<a href='###' onclick="return submitForm(this,'list',3);">3</a> 
			<a href='###' onclick="return submitForm(this,'list',4);">4</a> 
			<a href='###' onclick="return submitForm(this,'list',5);">5</a> 
			<a href='###' onclick="return submitForm(this,'list',6);">6</a> 
			<a href='###' onclick="return submitForm(this,'list',7);">7</a> 
			<a href='###' onclick="return submitForm(this,'list',8);">8</a> 
			<a href='###' onclick="return submitForm(this,'list',9);">9</a> 
			<a class='btn' href='###' onclick="return submitForm(this,'list',2);">
			<img alt='다음' src='/image/common/btn/paging_next.gif' /></a>
			<a class='btn' href='###' onclick="return submitForm(this,'list',59);">
			<img alt='마지막으로' src='/image/common/btn/paging_last.gif' /></a>
		</div>
		
		<!--/paging-->
		<div class="btn-r3"></div>
		<fieldset class="search2">
			<legend>검색</legend>
			<select name="key" style="width: 88px;" title="검색 옵션 선택">
				<option value='bbsconts'>제목</option>
				<option value='bbsusername'>작성자</option>
			</select> <input type="text" class="text" name="keyword"
				style="width: 402px; height: 18px;" value="" title="검색어 입력"
				onkeydown="if(event.keyCode==13){return false;}" " /> <input
				type="image" class="btn"
				src="/skin/board/comment/image/btn_search.gif" alt="검색"
				style="border: 0px;" onclick="return submitForm(this,'list',1)" />
		</fieldset>

	</form>
	<script>

	</script>
			</section>
		</section>
	</section>

</div>

</body>
</html>