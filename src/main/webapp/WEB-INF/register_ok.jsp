<%@page import="uuu.bccc.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv='refresh' content='5;url=/b3c'>
<link rel="stylesheet" href="/b3c/css/bccc.css">
<title>Buy3C-註冊成功</title>
<style>
article{
	min-height:75vh;
	text-align: center;
}
</style>
</head>
<body>
	<header id="head_content">
        <span><a href="/b3c" id="index" title='回首頁'>首頁</a></span>
        <div id="space"></div>
        <span><a href="register.jsp">加入會員</a></span>
        <span><a href="">會員中心</a></span>
        <span><a href="">購物車</a></span>
        <span><a href="login.jsp">登入</a></span>
    </header>
    <article>
    	<div>
    		<%Customer c = (Customer)request.getAttribute("register"); %>
    		<h2><%= c.getName() %>註冊成功!</h2>
    		<p>5秒後跳回首頁<a href="/b3c">首頁</a></p>
    	</div>
    	
    </article>
</body>
</html>