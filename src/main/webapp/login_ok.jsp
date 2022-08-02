<%@page import="uuu.bccc.entity.Customer"%>
<%@page import="java.time.LocalDate"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

 <script src="https://code.jquery.com/jquery-3.0.0.js"
	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo="
	crossorigin="anonymous"></script>
<meta http-equiv='refresh' content='10;url=/b3c'>
<link rel="stylesheet" href="/b3c/css/bccc.css">
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Buy3C-登入成功</title>
<style>
article {
	min-height: 75vh;
	text-align: center;
}

footer {
	text-align: center;
}
.swiper-slide{
margin:0 auto;
}
.w3-left, .w3-right, .w3-badge {cursor:pointer}
</style>
</head>
<body>
	<jsp:include page="/subviews/header.jsp" />
	<%
	Customer c = (Customer) session.getAttribute("member");
	%>
	<article>
		<div>
			<!--     	//c會有NULL POINTER EXCEPTION所以可以做檢查，但是要設定一開始是空字串 -->
			<h2><%=c.getName()%>您好
			</h2>
			<p>
				10秒後跳回首頁<a href="/b3c">首頁</a>
			</p>
		</div>
		<div class="swiper-slide swiper-slide-duplicate" style="width: 738px;">

			<div class="swiper-slide">

				<a href="https://tw.yahoo.com/"> <img class="slideimg"
					src="./images/sliderad1.jpg" alt=""></a> 
				<a
					href="https://www.google.com.tw/"><img class="slideimg"
					src="./images/sliderad2.jpg" alt=""></a>
				<a href=""> <img
					class="slideimg" src="./images/sliderad3.jpg" alt=""></a> 
				<a href=""> <img class="slideimg" src="./images/sliderad4.jpg"
					alt=""></a>
				<div
					class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle"
					style="width: 100%; line-height: 40px;">
					<div id="leftarrow" class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1) ">&#10094;</div>
                    <div id="rightarrow" class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
				</div>
			</div>

			<script>
				var myIndex = 0;
				carousel();

				function carousel() {
					var i;
					var x = document.getElementsByClassName("slideimg");
					for (i = 0; i < x.length; i++) {
						x[i].style.display = "none";
					}
					myIndex++;
					if (myIndex > x.length) {
						myIndex = 1
					}
					x[myIndex - 1].style.display = "block";
					setTimeout(carousel, 2500); // Change image every 2 seconds
				}
				var slideIndex = 1;
				showDivs(slideIndex);

				function plusDivs(n) {
					showDivs(slideIndex += n);
				}

				function currentDiv(n) {
					showDivs(slideIndex = n);
				}

				function showDivs(n) {
					var i;
					var x = document.getElementsByClassName("slideimg");
					var dots = document.getElementsByClassName("demo");
					if (n > x.length) {
						slideIndex = 1
					}
					if (n < 1) {
						slideIndex = x.length
					}
					for (i = 0; i < x.length; i++) {
						x[i].style.display = "none";
					}
					for (i = 0; i < dots.length; i++) {
						dots[i].className = dots[i].className.replace(
								" w3-white", "");
					}
					x[slideIndex - 1].style.display = "block";
					dots[slideIndex - 1].className += " w3-white";
				}
			</script>

		</div>

	</article>
	<footer>
		<hr>
		Buy3C~<%
		out.print(LocalDate.now().getYear());
		%>
	</footer>
</body>
</html>