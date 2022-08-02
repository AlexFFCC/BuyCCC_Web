<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/b3c/css/bccc.css">
<title>Buy3C-9x9</title>
<style>
table, th, td {
  border: 1px solid black;
}
table {
  width: 100%;
}
</style>
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
    <% for(int i=1;i<10;i++){
    	for(int j=1;j<10;j++){
    		out.println(i+"x"+j+"="+i*j);
    	}
    	
    } %>
    	<table>
    	<caption></caption>
    	<% for(int i=1;i<10;i++){%>
    	<tr>
    	<% for(int j=1;j<12;j++){%>
    	<td><%= i%>x<%= j%>=<%= i*j%></td>
    	<% } %>
    	</tr>
    	<% } %>
    	<tr>
    <th>Data 1</th>
    <th style="background-color: yellow">Data 2</th>
  </tr>
  <tr>
    <td>Calcutta</td>
    <td style="background-color: yellow">Orange</td>
  </tr>
  <tr>
    <td>Robots</td>
    <td style="background-color: yellow">Jazz</td>
  </tr>
    	</table>
    	
    	
    </article>
</body>
</html>