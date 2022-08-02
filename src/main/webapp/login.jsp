<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="/b3c/css/bccc.css">
<script src="https://code.jquery.com/jquery-3.0.0.js"
	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo="
	crossorigin="anonymous"></script>



<title>登入</title>

<style>
body {
	margin: 0px;
	padding: 0px;
	font-family: 'Noto Sans TC', sans-serif;
/* 	position: relative; */
	background-color: gainsboro;
 	
}


section {
	width: 300px;
 	height: auto;
	background-color: rgba(197, 215, 255, 0.5);
	border-radius: 8px;
	border:2px solid rgb(54, 67, 122);
 	display: flex;
	margin: 0px auto;
	padding: 0px;
	/* flex-direction: row; */
/* 	justify-content: center; */
	position: relative;
	top: 80px;
	
}
article{
height: 70vh;
}
form {
	margin: 0px auto;
	padding: 0px;
	display: inline-block;
	position: relative;

}

h1 {
	text-align: center;
	color: rgb(4, 0, 240);
}

#show {
	background-color: rgb(167, 226, 253);
	margin-left: 0px;
	margin-bottom: 2px;
}

#pwd {
	margin-top: 0px;
	border-radius: 5px;
	height: 25px;
}

#id {
	height: 25px;
	border-radius: 5px;
	margin: 12px auto;
}

.pCenter {
	text-align: center;
}

#eye {
	width: 12px;
	position: absolute;
	padding: 9px 0;
	left: 215px;
}

#captchaimg {
	vertical-align: middle;
}

#captcha {
	height: 25px;
	border-radius: 5px;
	margin: 12px auto;
	width: 120px;
}

#refreshCaptcha {
	width: 12px;
	position: relative;
	top: 1px;
	left: -130px;
}
</style>

<script>
	$(document).ready(init);
	function init() {
		$("#eye").mousemove(moveHandler);
		$("#eye").mousedown(showHandler);
		$("#eye").mouseup(hideHandler);
		$("#refreshCaptcha").mousemove(moveHandler);
		$("#refreshCaptcha").click(refreshHandler);
	}
	function moveHandler() {
		$("#eye").css("cursor", "Pointer");
		$("#refreshCaptcha").css("cursor", "Pointer");
	}
	function showHandler() {
		$("#pwd").attr("type", "text");
		$("#eye").attr("src", "./images/2eye.png")
	}
	function hideHandler() {
		$("#pwd").attr("type", "password");
		$("#eye").removeAttr("src", "./images/2eye.png")
		$("#eye").attr("src", "./images/1eye.png")
	}
	function refreshHandler() {
		$("#captchaimg").attr("src", "images/captcha.jpg?ccc=" + new Date());
	}
</script>
</head>
<body>

        <jsp:include page="/subviews/header.jsp"/>
    
    <%
    List<String> errorList = (List)request.getAttribute("errorList");
    %>
    
    <article>
	<section>
	
		<form id="loginForm" action="login.do" method="POST">
			<h1>Sing In to B3C</h1>
			<p class="pCenter"><%=
		    errorList!=null?errorList:""
 		    %></p> 
			<input type="text" name="id" id="id" placeholder="ID or Email"
				size="30" required><br> <span><img id="eye"
				src="images/1eye.png"></span> <input type="password" name="password"
				id="pwd" placeholder="Password" size="30" required><br>
			<div class="captchagroup">
				<input type="text" name="captcha" id="captcha" placeholder="請輸入驗證碼">
				<img id="captchaimg" src="images/captcha.jpg" width="100px"
					height="25px"> <img src="images/refresh.png"
					id="refreshCaptcha">
				<!--                 <input type="button"  id="refreshCaptcha"value="更新"> -->
			</div>

			<p class="pCenter">
				<input type="submit" id="signIn" value="登入">
			</p>
			<p class="pCenter">----------OR----------</p>
			<p class="pCenter">
				<a href="">忘記密碼</a>
			</p>
			<p class="pCenter">
				<a href="/b3c/register.jsp">Create an Account</a>
			</p>

		</form>
	</section>
	</article>
	<%@include file="/subviews/footer.jsp"%>
	
</body>
</html>