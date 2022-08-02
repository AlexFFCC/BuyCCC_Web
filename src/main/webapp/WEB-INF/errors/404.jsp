<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/b3c/css/bccc.css">
<title>Buy3C-404</title>
<style>
.not404{
/* display: flex; */
/* flex-direction: row; */
/* align-content: center; */
/* justify-content: center; */
margin:0 auto;
}
.notfound{
width:800px;
display:block;
margin: 0 auto;
}
p,h3{
text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="/subviews/header.jsp">
	 	<jsp:param value="---找不到網頁" name="subheader"/>
	 </jsp:include>
    <div class="not404">
    <h3>你所尋找的頁面不存在<%=request.getAttribute("javax.servlet.error.status_code") %></h3>
    <p>找不到:<%= request.getAttribute("javax.servlet.error.request_uri") %></p>
    	<img class="notfound"src="<%=request.getContextPath() %>/images/404.png">
    </div>
</body>
</html>