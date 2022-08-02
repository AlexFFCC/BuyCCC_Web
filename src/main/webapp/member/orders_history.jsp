<%@page import="uuu.bccc.service.MailService"%>
<%@page import="uuu.bccc.entity.PaymentType"%>
<%@page import="uuu.bccc.entity.OrderStatusLog"%>
<%@page import="uuu.bccc.service.OrderService"%>
<%@page import="uuu.bccc.entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="uuu.bccc.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Buy3C-歷史訂單</title>
<style>

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
  background-color: #dddddd;
}

#ordersHistory th{
background-color: rgb(49, 68, 116);
color:white;
}
h3{
display:flex;
flex-direction: column;
align-items: center;
}
article{
padding-bottom: 300px;
}


</style>
</head>
<body>
<jsp:include page="/subviews/header.jsp"/>
    <% Customer member = (Customer)session.getAttribute("member");
   
    
    List<Order> list = null;
    //人要購物
    if(member!=null){
    	 OrderService oService =new OrderService();
    	 list = oService.getOrdersHistoryByCustomerId(member.getId());
    	
    
   
    %>
    <article>
     <h3>歷史訂單</h3>
     <% if(list!=null && list.size()>0){ %>
    	<table id="ordersHistory">
    		
    			<tr>
		    		<th>訂單編號</th>
		    		<th>訂單日期時間</th>
		    		<th>處理狀態</th>
		    		<th>付款方式</th>
		    		<th>貨運方式</th>
		    		<th>訂單總金額</th>
		    	</tr>
		    	
		    	
		    	<%for(Order order:list){ %>
		    	
			    	<tr>
			    		<td><a href="order.jsp?orderId=<%=order.getId()%>"><%=order.getId() %></a></td>
			    		
			    		<td><%=order.getOrderDate()%> <%=order.getOrderTime() %></td>
			    		<% OrderStatusLog log = oService.getOrderStatusLogInt(order.getId()); %>
			    		
			    		<td><%=order.getStatusString(log.getNewStatus())%></td>
			    		
			    		
			    		<td>
			    		<%if(log.getNewStatus()==0 && order.getPaymentType()==PaymentType.ATM){ %>
			    		<a href="transfer.jsp?orderId=<%=order.getId()%>">通知已轉帳</a>
			    		<%}else{ %>
			    		<%=order.getPaymentType() %>
			    		<%} %>
			    		</td>
			    		<td><%=order.getShippingType() %></td>
			    		<td><%=order.getTotalAmountWithFee() %></td>

			    	</tr>
			    	<%} %>
    		
    	</table>
    	    <%}else{ %>
    <p>沒有訂單紀錄</p>
    		<%} %>
    </article>
    <%} %>
    <div style="bottom: 0">
     <%@include file="/subviews/footer.jsp" %>
    </div>
   

</body>
</html>