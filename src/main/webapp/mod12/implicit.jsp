<%@page import="java.util.Date"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/b3c/css/bccc.css">
<title>implicit</title>
</head>
<body>
	<header>
    </header>
    <article>
    	<p>url:<%= request.getRequestURI() %></p>
    	<p>server:<%= request.getLocalName() %></p>
    	<p>server ip:<%= request.getLocalAddr() %></p>
    	<p>server port:<%= request.getLocalPort() %></p>
    	<p>client port:<%= request.getRemotePort() %></p>
    	<p>server port:<%= request.getServerPort() %></p>
    	
    	<p>context path:<%= request.getContextPath() %></p>
    	<p>URI:<%= request.getRequestURI()%></p>
    	<p>QueryString:<%= request.getQueryString()%></p>
    	<hr>
    	<h2>request中的第二段Headers</h2>
    	<p>user-agnet: <%= request.getHeader("user-agent")%></p>
    	<hr>
    	<h2>request中的第三段form data</h2>
    	<p>因為如果是POST請求會用系統預設編碼，所以前面設定UTF-8</p>
    	<% request.setCharacterEncoding("UTF-8"); %>
    	<form action="" method="POST">
    	<label>帳號:</label>
    	<input type="text" name="id" value="<%= request.getParameter("id")!=null?request.getParameter("id"):""%>">
    	<label>密碼:</label>
    	<input type="text" name="pwd"value="<%= request.getParameter("pwd")!=null?request.getParameter("pwd"):""%>">
    	<input type="submit" value="送出">
    	</form>
    	<hr>
    	<hr>
    	<h2>session</h2>
    	<p>session ID:<%= session.getId() %></p>
    	<p>session getCreationTime:<%= session.getCreationTime()%></p>
    	<p>session getCreationTime:<%= new Date(session.getCreationTime())%></p>
    	<p>session getMaxInactiveInterval:<%=session.getMaxInactiveInterval() %></p>
    	<hr>
    	<h2>application</h2>
    	<p>context path:<%= application.getContextPath() %></p>
    	
    	
    	
    	<hr>
    	<hr>
    	<hr>
    	
    </article>
</body>
</html>