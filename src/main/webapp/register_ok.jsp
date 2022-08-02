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
<jsp:include page="/subviews/header.jsp">
	 	<jsp:param value="---註冊成功" name="subheader"/>
</jsp:include>
    <article>
    	<div>
    		<%Customer c = (Customer)request.getAttribute("register"); %>
    		<h2><%= c.getName() %>註冊成功!</h2>
    		<p>5秒後跳回首頁<a href="/b3c">首頁</a></p>
    	</div>
    	
    </article>
</body>
</html>