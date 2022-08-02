<%@page import="uuu.bccc.service.ProductService"%>
<%@page import="uuu.bccc.entity.Outlet"%>
<%@page import="uuu.bccc.entity.Color"%>
<%@page import="uuu.bccc.entity.Product"%>
<%@page import="uuu.bccc.entity.CartItem"%>
<%@page import="uuu.bccc.entity.ShoppingCart"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.0.0.js"
	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo="
	crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Buy3C-購物車</title>
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
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<header id="head_content">
       <jsp:include page="/subviews/header.jsp">
	 	<jsp:param value="---購物車" name="subheader"/>
</jsp:include>
   	<%
    ShoppingCart cart = (ShoppingCart)session.getAttribute("cart"); %>
<%--     <%=cart %> --%>
    <article>
    
    <div class="cartTable">
     <%if(cart!=null && cart.size()>0){ %>
     <form action="update_cart.do" method="post">
    	<table>
	    	<tr>
		    	<th>產品名稱</th>
		    	<th>顏色</th>
		    	<th>原價</th>
		    	<th>折扣</th>
		    	<th>售價</th>
		    	<th>數量</th>
		    	<th>小計</th>
		    	<th>從購物車移除</th>
	    	</tr>
	    	<%
	    	ProductService pService = new ProductService();
	    	for(CartItem item:cart.getCartItemsSet()){
	    		Product p = item.getProduct();
	    		Color color = item.getColor();
// 	    		String size = item.getSize();
	    		
	    		int stock = pService.getStock(item);
	    		
	    		//int stock = color!=null?color.getStock():p.getStock();
	    	%>
	    	<tr>
		    	<td><img src="<%=color!=null?color.getPhotoUrl():p.getPhotoUrl()%>"><%=p.getName() %></td>
		    	
		    	<td><%=color!=null?color.getName():"" %></td>
		    	<%if(p instanceof Outlet){ %>
		    	<td><%=Product.priceFormat.format(((Outlet)p).getListPrice())%></td>
		    	<td><%=((Outlet)p).getDiscountString()%></td>
		    	<%}else{%><td><%=p.getUnitPrice() %></td><td></td><%} %>
		    	<td><%=p.getUnitPrice() %></td>
		    	<td><input id="inputQty"type="number" name="quantity<%=item.hashCode() %>" value="<%=cart.getQuantity(item) %>" min="<%=stock>0?1:0 %>" max="<%=stock%>" required></td>
		    	<td><%=cart.getAmount(item) %></td>
		    	<td><input type="checkbox" name="delete<%=item.hashCode() %>"></td>
	    	</tr>
	    	<%} %>

	    	<tr>
		    	<td colspan="4"><%=cart.size()%>項，<%=cart.getTotalQuantity()%>件商品</td>

		    	<td colspan="4">共$<%=cart.getTotalAmount() %></td>
	    	</tr>
	    	<tr>
		    	<td colspan="6"></td>
		    	<td colspan="2">
			    	<input type="submit" value="修改購物車" >
			    	<input type="submit" name="checkOut" value="結帳">
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