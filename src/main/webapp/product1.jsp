<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/b3c/css/bccc.css">
<title>Buy3C-宏碁 ACER</title>
<style>
.productdetail{
display:flex;
flex-direction: row;
align-item: center;
justify-content: center;
}
.productImg{
padding-top:40px;
padding-right: 40px;
}
.productInfo{
padding-left:40px;
width:450px;
border-left: 1px dotted gray;
}
</style>
</head>
<body>
<jsp:include page="/subviews/header.jsp">
	 	<jsp:param value="---購物" name="subheader"/>
	 </jsp:include>
  <div class="productdetail">
  	<div class="productImg">
  		<a>
  			<img src="https://www.cdn-tkec.tw/image/product/202101/214537_M.jpg?t=20210901"height="200" width="200">
  		</a>
  	</div>
  	<div class="productInfo">
  		<h3>宏碁 ACER Swift 5 筆記型電腦 14" (i5-1135G7/8G/512G/Iris Xe/W10/EVO認證)金 SF514-55T-56MP(EVO) </h3>
  		<div>
  			<ul>
  				<li>Intel Core i5-1135G7(2.40 GHz/4.20 GHz)</li>
  				<li>14" FHD/LED背光/IPS/觸控</li>
  				<li>8GB LPDDR4X(Onboaed)0/8GB)</li>
  				<li>512GB PCIe NVMe SSD(不能擴充)</li>
  			</ul>
  		</div>
  		<h4>庫存:10</h4>
  		<form method="POST" action="">
  			<input type="hidden" name="productId" value="1">
  			<label>數量</label>
  			<input type="number" id="quantity" name="quantity"min="1" max="10">
  			<input type="submit" value="加入購物車">
  		</form>
  		<h3>$30,900</h3>
  	</div>
  </div>
   
  <%@include file="/subviews/footer.jsp" %>
</body>
</html>