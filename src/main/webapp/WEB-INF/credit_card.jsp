<%@ page pageEncoding="UTF-8"%>

<%@page import="uuu.bccc.entity.*"%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%
    Order order = (Order) request.getAttribute("order");
    session.setAttribute("credit_card_order_id", order.getId());    
%>

<%
    List<String> enErrors = new ArrayList<>();
    try {
        String protocol = request.getProtocol().toLowerCase().substring(0, request.getProtocol().indexOf("/"));
        String ipAddress = java.net.InetAddress.getLocalHost().getHostAddress();
        String url = protocol + "://" + ipAddress + ":" + request.getLocalPort() + request.getContextPath() + "/member/credit_card_back.do";
        String title="BUY3C"+"-信用卡支付";        
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Credit</title>
        <script src="https://code.jquery.com/jquery-3.0.0.js" 
	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" 
	crossorigin="anonymous"></script>
    </head>
    <body>
       	<form id='payForm' action="//10.0.1.200/5598Pay/" method="POST">
       		<input type='hidden' name="customerId" value='${sessionScope.member.id}'>
       		<input type='hidden' name="url" value='<%= url %>'>
       		<input type='hidden' name="title" value='<%= title %>'>
       		<input type='hidden' name="orderId" value='<%= order.getId() %>'>
       		<input type='hidden' name="orderIdStr" value='<%= order.getId() %>'>
       		<input type='hidden' name="itemName" value='<%= "信用卡支付授權" %>'>
       		<input type='hidden' name="totalAmount" value='<%= order.getTotalAmountWithFee() %>'>
       		<input type='submit' value='send to CARD'>
       	</form>
    </body>
</html>
<script>	
	$("#payForm").submit();
</script>
<%
    } catch (Exception e) {
        // 例外錯誤處理。
        e.printStackTrace();
        enErrors.add(e.getMessage());
    } finally {
        // 回覆錯誤訊息。
        if (enErrors.size() > 0) {
            if (!enErrors.contains(null)) {
                out.println("0|" + enErrors + "<br/>");
            } else {
                out.println("0|" + "交易失敗，請重新操作一次" + "<br/>");
            }
            out.println("<br/>");
        }
    }
%>