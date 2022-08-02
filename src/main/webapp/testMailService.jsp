<%@page import="uuu.bccc.entity.Customer"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="uuu.bccc.service.MailService"%>

<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/b3c/css/bccc.css">
<title>Buy3C-???</title>
</head>
<body>
	<header id="head_content">
        <span><a href="/b3c" id="index" title='回首頁'>首頁</a></span>
        <div id="space"></div>
        <span><a href="register.html">加入會員</a></span>
        <span><a href="">會員中心</a></span>
        <span><a href="">購物車</a></span>
        <span><a href="login.html">登入</a></span>
    </header>
    <article>
    	<%
    	Customer c = new Customer();
    	MailService.sendHelloMailWithLogo(c); %>
    	
    	
    </article>
</body>
</html>