<%@page import="uuu.bccc.entity.OrderItem"%>
<%@page import="java.time.LocalDate"%>
<%@page import="uuu.bccc.service.OrderService"%>
<%@page import="uuu.bccc.entity.Customer"%>
<%@page import="uuu.bccc.entity.Order"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Buy3C-通知轉帳</title>
<style>

table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 40%;
  margin: 0 auto;
 
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}
#submit{
text-align: center;
margin-top: 20px;
}
</style>
</head>
<body>
<% String orderId = request.getParameter("orderId");
Customer member = (Customer)session.getAttribute("member");
Order order = null;
OrderService oService = new OrderService();
if(member!=null && orderId!=null){
order = oService.getOrderByIdAndCustomerId(member.getId(), orderId);
}


%>
    <article>
    <%String error = request.getParameter("errorList"); %>
    <%= error!=null?error:"" %>
    <%if(order!=null){ %>
    <form action="transfer.do" method="POST">
    	<table>
    		<tr>
    			<td>訂單編號</td>
    			<td><input readonly name="orderId" value="<%=order.getId()%>"></td>
    		</tr>
    	
    		<tr>
    			<td>銀行名稱</td>
    			<td><input type="text" name="bank" required></td>
    		</tr>
    		<tr>
    			<td>帳號末5馬</td>
    			<td><input type="tel" maxlength="5" name="cardNumber" required></td>
    		</tr>
    		<tr>
    			<td>轉帳金額</td>
    			<td><input type="text" name="pay" required value="<%=order.getTotalAmountWithFee()%>"></td>
    		</tr>
    		<tr>
    			<td>轉帳日期</td>
    			<td><input type="date" name="date" min="<%=order.getOrderDate()%>" max="<%=LocalDate.now()%>" required>
    			<label>時間:</label>約
                      <select required name="time">
                      	<option value="">請選擇...</option>
                      	<% for(int i=01;i<24;i++) {%>
                      		<option value="<%=i>10?i:"0"+i%>:00"><%=i>10?i:"0"+i%>:00</option>
				    		<option value="<%=i>10?i:"0"+i%>:30"><%=i>10?i:"0"+i%>:30</option>
                      	<% } %>
                      </select>
    			
    			</td>
    			
    		</tr>
    	
    	</table>
    	<div id="submit">
    		<input type="submit" value="送出"/>
    	</div>
    	
    	</form>
    	 <%} %>
<!--     <p>查無此訂單</p> -->
<%--     <%} %> --%>
    </article>
   
</body>
</html>