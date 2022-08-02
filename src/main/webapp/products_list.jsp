<%@page import="uuu.bccc.entity.Outlet"%>
<%@page import="uuu.bccc.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="uuu.bccc.service.ProductService"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<!-- <script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.umd.js"></script> -->

<style>
body {
	margin: 0px 0px;
}


#menu {
	width: 188px;
	display: flex;
	flex-direction: row;
	background-color: #f5efef;
}

#outer {
	width: 1160px;
	background-color: #ffffff;
	display: flex;
	margin: 0 auto;
}

.categoryMenu {
	height: 1000px;
	width: 188px;
	float: left;
	zoom: 1;
	word-spacing: normal;
	vertical-align: top;
	text-rendering: auto;
}

.cate1 {
	width: 186px;
	line-height: 30px;
	text-align: center;
	background: #bcbcbc;
}

ol, ul {
	list-style: none;
}

a {
	text-decoration: none;
}

#menu ul li .item p {
	width: 90%;
	padding: 0 0 0 5px;
	margin: 3px 0;
	font-size: 93%;
}

.cateRanking {
	width: 948px;
	float: right;
	margin-left: 8px;
}

.top_list {
	margin-top: 20px;
}

#ranking {
        color: #008ebe;
        font-size: 131%;
        border-bottom: 2px solid #008ebe;
        height: 25px;
        margin-bottom: 3px;
    }

    .cateRanking {
        width: 948px;
        float: right;
        margin-left: 8px;
    }

    .rankingContent {
/*         overflow: hidden; */
/*         width: 918px; */
/*         height: 280px; */
        border-bottom: 1px dashed #aaa;
        position: relative;
        left: 20px;
        display:flex;
    }

    .rankingContent ul {
        position: relative;
        left: 0px;
        /* width: 30000px; */
        margin: 10px 0 0 10px;
        display:inline-block;
    }

    .rankingContent ul li {
		float: left; 

        border-right: 1px solid #ddd;
        border-bottom: 1px solid #ddd;
        border-left: 1px solid #ddd;
        width: 142px;
        height: 260px;
        padding: 0 5px 0 5px;
        /* position: relative; */
    }

    #listsearch p {
        background: linear-gradient(to bottom, rgba(252, 234, 187, 1) 0%, rgba(252, 205, 77, 1) 50%, rgba(248, 181, 0, 1) 51%, rgba(251, 223, 147, 1) 100%);
        color: #fff;
        text-align: center;
        width: 23px;
        border-radius: 3px;
        font-size: 85%;
        line-height: 1.5;
    }

    .prodName {
        color: #008ebe;
        text-decoration: none;
        padding: 3px 0 0 10px;
        text-align: center;
        display: inline-block;
        width: 90%;
        overflow: hidden;
        line-height: 18px;
        font-size: 85%;
        height: 33px;
    }

    .price {
        font-size: 77%;
        width: 90%;
        text-align: center;
        padding: 0 0 0 10px;
        margin: -2px 0 0 0;
        display: block;
    }

    .price span {
        font-size: 140%;
        color: #ff0000;
    }

    img {
        margin: 0;
        padding: 0;
        border: 0;
        font-size: 100%;
    }

  #heightPrice {
  width: 80px;}
     #lowPrice{
    width: 80px; }
</style>
<script src="https://code.jquery.com/jquery-3.0.0.js"
			integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" 
			crossorigin="anonymous"></script>	
<link rel="stylesheet" href="fancybox3/jquery.fancybox.css" />
<script src="fancybox3/jquery.fancybox.js"></script>		
<script>
 function getProduct(pid){
	//同步
  	//location.href = 'product.jsp?productId='+pid;
	
	//非同步$.ajax(...),{}是jason。,是有多個屬性要加上去要使用,
  	var xhr=$.ajax({
  		url:'product_ajax.jsp?productId='+ pid,
  		method:'GET'
 	}).done(getProductDoneHandler);
  	 
    }
     function getProductDoneHandler(response, status, xhr){
		//alert(response); //response為產品明細
		
		//部分更新: 代換原來body的內容
		//$("body").html(response); //不喜歡
		
		//部分更新: 用fancybox 3帶出產品明細(lightbox效果)
		$("#productDetailDiv").html(response);								
		$.fancybox.open({
			src  : '#productDetailDiv',
			type : 'inline',
			opts : {
				afterShow : function( instance, current ) {
					console.info( 'done!' );
				}
			}
		
		});
		
	}
</script>
<title>Buy3C-產品清單</title>
</head>
<body>


	<jsp:include page="/subviews/header.jsp">
		<jsp:param value="---購物" name="subheader" />
	</jsp:include>
	<%	String search = request.getParameter("search");
// 			String category =  request.getParameter("category");
 			String lowPrice =request.getParameter("lowPrice");
 			String heightPrice =request.getParameter("heightPrice");
 			
			ProductService pService = new ProductService();

			List<Product> list = null;

			if (search != null && search.length() > 0) {
				list = pService.getProductsByKeyword(search);
				
			}else if(lowPrice!=null && heightPrice!=null) {
				list = pService.getPriceRange(lowPrice, heightPrice);
			}else {
				list = pService.getAllProducts();
			}%>
	<div id="outer">
		<div id="contnet">
			<div id="menu">
				<div id="category" class="categoryMenu">
					<h4 id="contentPlacerHolder1" class="cate1">筆記型電腦</h4>
					<ul>
						<li id="cateMenu1" class="selected"><a href="">ACER開學戰鬥機</a>
							<div id="contentPlacerHolder1Menu1" class="item">
								<p>
									<a href="?category=輕薄筆電">輕盈美 隨你挑</a>
								</p>
								<p>
									<a href="">神助攻 機淺能</a>
								</p>
								<p>
									<a href="">競技魂 瘋電競</a>
								</p>
								<p>
									<a href="">高解析 追據魔</a>
								</p>
								<p>
									<a href="?category=new">最新上架</a>
								</p>
								
							</div>
						</li>
					</ul>
					<span>價格搜尋</span>
					<div id="searchPriceRange">
					<form method="get" action="<%=request.getContextPath()%>/products_list.jsp">
						<input type="number" name="lowPrice" id="lowPrice">~<input type="number" name="heightPrice"id="heightPrice">
						<input type="submit">
					</form>
					</div>
				</div>
				<div class="cateRanking" style="height: auto;">
					<div id="contentRanking">
						<div class="topList">
							<h3 id="ranking">產品列表</h3>
							<div class="rankingContent">
								<%
								if (list != null && list.size() > 0) {
								%>
								<ul style="width: 1570px;">
									<div id="listsearch">
										<%
										for (int i = 0; i <list.size(); i++) {
											Product p = list.get(i);
										%>
										<li>
											<a href=""><img src=<%=p.getPhotoUrl()%>
												height="143" width="143" border="0" alt=""></a>
											<div class="prodName">
												<a href="javascript:getProduct(<%=p.getId()%>)"><%=p.getName()%></a>
											</div>
											<div class="price">
												<span><%=p instanceof Outlet ? ((Outlet) p).getDiscountString() : ""%><%=p.getUnitPrice()%></span>
											</div>
										</li>
										<%
										}
										%>

									</div>
								</ul>

							</div>


							<%
							} else {
							%>
							<p>查無</p>
							<%
							}
							%>
						</div>


					</div>

				</div>

			</div>

		</div>
	</div>

	<%@include file="/subviews/footer.jsp"%>
	<div id="productDetailDiv"></div>
</body>
</html>