<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="uuu.bccc.service.MailService"%>
<%@page import="java.util.List"%>
<%@page import="uuu.bccc.entity.ShippingType"%>
<%@page import="uuu.bccc.entity.PaymentType"%>
<%@page import="uuu.bccc.entity.ShoppingCart"%>
<%@page import="uuu.bccc.entity.Outlet"%>
<%@page import="uuu.bccc.entity.Color"%>
<%@page import="uuu.bccc.entity.CartItem"%>
<%@page import="uuu.bccc.entity.Product"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.0.0.js"
	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo="
	crossorigin="anonymous"></script>
<title>Buy3C-結帳</title>
</head>
<style>
article{
height: auto;
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
  background-color: #dddddd;
}
.cartTable img{width:60px;vertical-align:middle}
.cartTable th{
background-color: rgb(49, 68, 116);
color:white;
}
#inputQty{
width: 60px;
}
h3{

display:flex;
flex-direction: column;
align-items: center;

}
#localShop{

visibility: visible;
}
</style>
<script type="text/javascript">
$(document).ready(init);
function init(){
	$("#shippingType").click(caculateHnadler);
	$("#shippingType").click(shippingAddrHandler);
	$("#localShopSe").click(shopAddrHandler);
	$("#copyMember").click(copyHandler);
	
	$("#memberName").val("${sessionScope.member.name}");
	$("#memberTel").val("${sessionScope.member.phone}");
	$("#memberEmail").val("${sessionScope.member.email}");
	$("#memberAddr").val("${sessionScope.member.address}");
	
}

		
function copyHandler(){
	var memberName =$("#memberName").val()
	$("#recipientNmae").val(memberName);
	
	var memberTel =$("#memberTel").val()
	$("#recipientTel").val(memberTel);
	
	var memberEmail =$("#memberEmail").val()
	$("#recipientEmail").val(memberEmail);
	
	var memberAddr =$("#memberAddr").val()
	$("#recipientAddr").val(memberAddr);
	
}


function caculateHnadler(){
	var amount = Number($("#productPriceTotalAmount").text());

 	var shippingFee=$("#shippingType option:selected").attr("data-fee");
	
	amount+=Number(shippingFee);

	$('#amountWithFee').text(amount);
//  	$("#localShop").css("visibility ","visible");
// 	$("#localShopSe").css("visibility ","visible");
}
function shippingAddrHandler(){
	var shippingValue = $("#shippingType option:selected").attr("value");
	if(shippingValue=='SHOP'){
 		
 		$("#localShop").show();
		shopAddrHandler();
		
		
	}else{
		$("#recipientAddr").val("");
		$("#localShop").hide();
  		//$("#localShop").css("display","none");
  		
	}
}
//clicl value=shop show
function shopAddrHandler(){
	
	var shop = $("#localShopSe option:selected").attr("value");
	if(shop=='taipei'){
// 		$("#localShopSe").css("display","show");
		$("#recipientAddr").val("台北門市");
		$("#recipientAddr").prop('readonly', true);
	}else{
// 		$("#localShopSe").css("display","show");
		$("#recipientAddr").val("台中門市");
		$("#recipientAddr").prop('readonly', true);
	}
}


</script>

<body>

	<jsp:include page="/subviews/header.jsp">
		<jsp:param value="---結帳" name="結帳" />
	</jsp:include>
	 <%
    ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
	 List<String> errorList= (List)request.getAttribute("errorList");
      	%>
	<h3>購物明細</h3>
	<span><%=errorList!=null?errorList:"" %></span>

<%--     <%=cart %> --%>
    <article>
  
    <div class="cartTable">
     <%if(cart!=null && cart.size()>0){ %>
     <form action="check_out.do" method="post">
    	<table>
	    	<tr>
		    	<th>產品名稱</th>
		    	<th>顏色</th>
		    	<th>原價</th>
		    	<th>折扣</th>
		    	<th>售價</th>
		    	<th>數量</th>
		    	<th>小計</th>
		    	
	    	</tr>
	    	<%
	    	for(CartItem item:cart.getCartItemsSet()){
	    		Product p = item.getProduct();
	    		Color color = item.getColor();
	    		String size = item.getSize();
	    		
	    		int stock = color!=null?color.getStock():p.getStock();
	    	%>
	    	<tr>
		    	<td><img src="<%=color!=null?color.getPhotoUrl():p.getPhotoUrl()%>"><%=p.getName() %></td>
		    	<td><%=color!=null?color.getName():"" %></td>
		    	<%if(p instanceof Outlet){ %>
		    	<td><%=Product.priceFormat.format(((Outlet)p).getListPrice())%></td>
		    	<td><%=((Outlet)p).getDiscountString()%></td>
		    	<%}else{%><td><%=p.getUnitPrice() %></td><td></td><%} %>
		    	<td><%=p.getUnitPrice() %></td>
		    	<td><%=cart.getQuantity(item) %></td>
		    	<td><%=cart.getAmount(item) %></td>
	    	</tr>
	    	<%} %>

	    	<tr>
		    	<td colspan="3"><%=cart.size()%>項，<%=cart.getTotalQuantity()%>件商品</td>

		    	<td colspan="4">商品金額:$ <span id="productPriceTotalAmount"><%=cart.getTotalAmount() %></span><p><span>含運費共:$ </span><span id="amountWithFee"></span></p></td>
		    	
	    	</tr>
	    	
    	</table>
<!--     	</form> -->
    	
<!--     	<form action="order.jsp"> -->
    		<table>
    			<th colspan="7">選擇付款與貨運方式</th>
    			
    			<tr>
	    			<td>
	    			<span>選擇付款方式</span>
		    			<select name="paymentType" required>
		    			
		    				<option value="">--請選擇--</option>
		    				<%for(PaymentType pType:PaymentType.values()){ %>
		    				<option value="<%=pType.name() %>" data-shipping="<%=pType.getShippingTypeArrayString()%>"><%=pType.getDescrption() %></option>
		    				<% }%>
<!-- 		    				<option value="ATM" data-shipping="STORE,HOME">ATM轉帳</option> -->
<!-- 		    				<option value="CARD" data-shipping="STORE,HOME">信用卡</option> -->
<!-- 		    				<option value="HOME" data-shipping="HOME">貨到付款</option> -->
		    			</select>
	    			</td>
	    			<td></td>
	    			<td></td>
	    			<td></td>
	    			<td colspan="3">
	    			<span>選擇貨運方式</span>
	    		
		    			<select id="shippingType" name="shippingType" required>
<!-- 		    				<option value="0" >----請選擇----</option> -->
		    				<%for(ShippingType sType:ShippingType.values()){ %>
		    				<option value="<%=sType.name()%>" data-fee="<%=sType.getFee()%>" ><%=sType.toString()%></option>
							<% }%>
<!-- 		    				<option value="STORE" data-fee="60">超商取貨(運費60)</option> -->
<!-- 		    				<option id="homePay" value="HOME" data-fee="100">宅配到府(運費100)</option> -->
		    			</select>
		    		
	    			</td>
	    			
    			</tr>
    			<tr>
	    			<td colspan="4">訂購人資料</td>
	    			<td colspan="3">收件人資料<input id="copyMember" type="checkbox" value="同訂購人">同會員資料</td>
    			</tr>
    			<tr>
	    			<td colspan="4">
	    				<div class="orderMethod">
		    				<p><spna>訂購人姓名  </spna><input id="memberName" type="text" required></p>
		    				<p><spna>訂購人電話  </spna><input id="memberTel"type="text" required></p>
		    				<p><spna>訂購人Email  </spna><input id="memberEmail"type="text" required></p>
		    				<p><spna>訂購人地址  </spna><input id="memberAddr"type="text" required></p>
	    				</div>
	    			</td>
    				<td colspan="3">
	    				<div class="orderMethod">
		    				<p>收件人姓名 <input id="recipientNmae" name="receipientName" type="text" required></p>
		    				<p><spna>收件人電話  </spna><input id="recipientTel" name="receipientTel"type="text" required></p>
		    				<p><spna>收件人人Email  </spna><input id="recipientEmail" name="recipientEmail" type="text" required></p>
		    				
		    				<p><spna>收件人地址  </spna><input id="recipientAddr" name="recipientAddr"type="text" required></p>
		    				<div id="localShop" >
			    				<P >門市取貨
			    					<select id="localShopSe">
			    						<option value="taipei">台北門市</option>
			    						<option value="taichung">台中門市</option>
			    					</select>
			    				</P>
		    				</div>
		    			</div>
	    			</td>
    			</tr>
    			

    			<tr>
		    	<td colspan="5"></td>
		    	<td colspan="2">
		    	<a href="<%=request.getContextPath() %>/member/cart.jsp"><input type="button" value="回到購物車"></a>
		    	<input type="submit" value="送出訂單" >
		    	</td>
		    	</tr>
    		</table>
    	
    	</form>
   <%}else{ %>
   		<p>購物車是空的</p>
   		
   <%} %>
    </div>	

    </article>
    	<%@include file="/subviews/footer.jsp"%>
</body>
</html>