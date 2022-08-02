<%@page import="uuu.bccc.entity.OrderStatusLog"%>
<%@page import="uuu.bccc.entity.OrderItem"%>
<%@page import="uuu.bccc.entity.Review"%>
<%@page import="uuu.bccc.service.ReviewService"%>
<%@page import="uuu.bccc.service.OrderService"%>
<%@page import="uuu.bccc.entity.Order"%>
<%@page import="uuu.bccc.service.ProductService"%>
<%@page import="uuu.bccc.entity.Customer"%>
<%@page import="uuu.bccc.entity.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我要寫評價</title>
<style>
.outerWarpper {
	margin-top: 60px;
	display: flex;
}

.innerWapper {
	margin: 0 auto;
}

#comment {
	width: 200px;
	height: 200px;
}

article {
	height: auto;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 80%;
	margin: 0 auto;
}

th {
	border: 1px solid #dddddd;
	text-align: center;
	padding: 8px;
}

td {
	padding: 8px;
	border: 1px solid #dddddd;
}

#submit {
	margin-top: 10px;
	text-align: center;
}

img {
	vertical-align: middle;
}

span {
	text-align: center;
}

#productImgAndName {
	width: 400px;
}

h4 {
	font-size: 100;
	color: rgb(200, 40, 116);
	text-align: center;
}
.errorMesg{
text-align:;
}
</style>
</head>
<body>
	<jsp:include page="/subviews/header.jsp">
		<jsp:param value="---評價" name="subheader" />
	</jsp:include>
	<%
	Customer member = (Customer) session.getAttribute("member");
	String productId = request.getParameter("productId");
	String orderId = request.getParameter("orderId");

	ProductService cService = new ProductService();

	Product p = cService.getProductById(productId);
	ReviewService rService = new ReviewService();
	Review r = null;
	Order OrderRev = rService.getOrderItem(member.getId(), orderId, productId);
	if (OrderRev != null && OrderRev.getId()>0) {
		r = rService.getReviewByOrderIdAndProductId(member.getId(), orderId, productId);
		if (r != null) {
	%>
	<article>
<%-- <%=OrderRev.getId() %> --%>
		<div class="outerWarpper">
			<%
			String errorList = (String) request.getAttribute("errorList");
			%>
			<p><%=errorList != null ? errorList : ""%></p>
			<div class="innerWapper">

				<table>
					<thead>
						<tr>
							<th>商品名稱</th>
							<th>評價</th>
						<tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div id="productImgAndName">

									<img src="<%=p.getPhotoUrl()%>" alt="" width="100px"> <input
										type="hidden" value="<%=p.getId()%>" name="productId">
									<input type="hidden" value="<%=orderId%>" name="orderId">
									<span><%=p.getName()%></span>

								</div>
							</td>
							<td><span>請輸入暱稱:</span><input type="text" name="nickName"
								placeholder="<%=r.getNickName()%>"> <textarea
									name="reviewContent" id="" cols="30" rows="5"
									placeholder="<%=r.getComment()%>"></textarea></td>
						</tr>

					</tbody>
				</table>
				<h4>
					您已撰寫過評價囉!日期為:<%=r.getCommentDate()%></h4>
			</div>
		</div>
	</article>
	<%
	} else {
		 OrderService oService =new OrderService();
		OrderStatusLog log = oService.getOrderStatusLogInt(OrderRev.getId());
		if(log.getNewStatus()>3){
	%>
	<article>
		<div class="outerWarpper">
			<%
			String errorList = (String) request.getAttribute("errorList");
			%>
			<p><%=errorList != null ? errorList : ""%></p>
			<div class="innerWapper">
				<form action="review.do" method="POST">
					<table>
						<thead>
							<tr>
								<th>商品名稱</th>
								<th>評價</th>
							<tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<div id="productImgAndName">

										<img src="<%=p.getPhotoUrl()%>" alt="" width="100px"> <input
											type="hidden" value="<%=p.getId()%>" name="productId">
										<input type="hidden" value="<%=orderId%>" name="orderId">
										<span><%=p.getName()%></span>

									</div>
								</td>
								<td><span>請輸入暱稱:</span><input type="text" name="nickName">
									<textarea name="reviewContent" id="" cols="30" rows="5"
										placeholder="請輸入評價內容，字數100字以內"></textarea></td>
							</tr>

						</tbody>
					</table>
					<div id="submit">
						<input type="submit" value="送出">
					</div>
				</form>
			</div>
		</div>
	</article>
	<%}else{ %>
	<h4 class="errorMesg">您尚未收到包裹，您的包裹正在旅途當中，請收到後再來評價</h4>
	<%} %>
	<%
	}
	%>

	<%
	}else{
	%>
	<h4 class="errorMesg">無此訂單</h4>
	<%} %>
</body>
</html>