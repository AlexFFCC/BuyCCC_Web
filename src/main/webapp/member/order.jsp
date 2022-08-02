<%@page import="uuu.bccc.entity.OrderStatusLog"%>
<%@page import="java.util.List"%>
<%@page import="uuu.bccc.entity.Color"%>
<%@page import="uuu.bccc.entity.Product"%>
<%@page import="uuu.bccc.entity.CartItem"%>
<%@page import="uuu.bccc.entity.OrderItem"%>
<%@page import="uuu.bccc.entity.Order"%>
<%@page import="uuu.bccc.entity.Customer"%>
<%@page import="uuu.bccc.service.OrderService"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Buy3C-訂單明細</title>
<style>
article{
height: 70vh;
}
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 80%;
  margin: 0 auto;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #eee;
}

th{
background-color: rgb(49, 68, 116);
color:white;
}
h3{
display:flex;
flex-direction: column;
align-items: center;
}
#recipientTable{
margin-top:30px;

}
</style>
</head>
<script type="text/javascript">

</script>
<body>
<jsp:include page="/subviews/header.jsp">
	 <jsp:param value="---訂單明細" name="subheader"/>
</jsp:include>
<% OrderService oService = new OrderService(); 
 Customer member = (Customer)session.getAttribute("member");
 String orderId = request.getParameter("orderId");
 Order o = null;
 List<OrderStatusLog> logList = null;
 if(orderId!=null && member!=null){
	  o = oService.getOrderByIdAndCustomerId(member.getId(),orderId);
	 
	  if(o!=null) logList = oService.getOrderStatusLog(orderId);
 }
		
 %>
    <article>
    <h3>訂單明細</h3>
<%if(o!=null){ %>
    	<table>
	    	<thead>
		    	<tr>
		    		<th>商品名稱</th>
			    	<th>顏色</th>
			    	<th>售價</th>
			    	<th>數量</th>
			    	<th>小計</th>
			    	<th>我要評價</th>
		    	</tr>
		    </thead>
		    <tbody>

		    <% OrderItem itme = new OrderItem();
		   
		    for(OrderItem item:o.getOrderItemSet()){
	    		Product p = item.getProduct();
	    		Color color = item.getColor();
	    		%>
				<tr>
				<td>
					
					<a href="<%=request.getContextPath() %>/product.jsp?productId=<%=p.getId()%>">
					<%=p.getName() %></a></td>
					<td><%=color!=null?color.getName():"" %></td>
					<td><%=p.getUnitPrice() %></td>
					<td><%=item.getQuantity() %></td>
					<td><%=item.getPrice() %></td>
					<td>
					<%List<OrderStatusLog> reviewLog =  oService.getOrderStatusLog(orderId);
					for(OrderStatusLog log : logList){
						int  i = log.getNewStatus();
					
					
					if(i>3){
					%>
					
					<a href="write_review.jsp?productId=<%=p.getId()%>&orderId=<%=o.getId()%>">我要評價/查看撰寫評價</a>
					<%}else{ %>
					還未到貨，無法評價
					<%} %>
					
					<%} %>
					</td>		
				</tr> 
			
				<%} %>  
		    </tbody>
		 </table>

	    
	    <table id="recipientTable">
		    <tbody>
		    	<tr>
			    	<th colspan="2">訂單編號</th>
			    	<th>訂單狀態</th>
			    	<th>訂購日期時間</th>
			    	<th>貨運方式</th>
			    	<th>付款方式</th>
			    </tr>
			    <tr>
				    <td colspan="2"><%=o.getId() %></td>
				    
						
	
				    <td>
				    
				    <%if(logList!=null && logList.size()>0){ %>
				    <%for(OrderStatusLog log : logList){ %>
				    
				    
				    <%=o.getStatusString(log.getNewStatus())%></td>
				    <% } %>
				    <%} %>
					<td><%=o.getOrderDate() %> <%=o.getOrderTime() %></td>
				    <td><%=o.getShippingType() %></td>
				    <td><%=o.getPaymentType() %></td>
			    </tr>
			    <tr>
			    	<th colspan="1">收件人</th>
			    	<th colspan="1">收件人電話</th>
			    	<th colspan="3">收件人電子郵件</th>
			    	<th colspan="3">收件人地址</th>
			    </tr>
			    <tr>
			    	<td><%=o.getRecipientName() %></td>
			    	<td><%=o.getRecipientPhone() %></td>
			    	<td colspan="3"><%=o.getRecipientEmail() %></td>
			    	<td colspan="3"><%=o.getShippingAddress() %></td>
			    </tr>
		    </tbody>
		    	
	    </table>
	    <%}else{ %>
	    <p>查無訂單</p>
	    <%} %>
	  
    </article>
   
</body>
</html>