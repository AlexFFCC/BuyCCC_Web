<%@page import="java.util.Set"%>
<%@page import="uuu.bccc.entity.Color"%>
<%@page import="java.util.Map"%>
<%@page import="uuu.bccc.service.ProductService"%>
<%@page import="uuu.bccc.entity.Product"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--  <script src="https://code.jquery.com/jquery-3.0.0.js" -->
<!-- 	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" -->
<!-- 	crossorigin="anonymous"></script> -->

<title>Buy3C-產品</title>
<script src="https://code.jquery.com/jquery-3.0.0.js"
			integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" 
			crossorigin="anonymous"></script>	
<link rel="stylesheet" href="fancybox3/jquery.fancybox.css" />
<script src="fancybox3/jquery.fancybox.js"></script>	
<script type="text/javascript">
//  function getReview(pid){
//  		var xhr=$.ajax({
//  	  		url:'review.jsp?productId='+ pid,
//  	  		method:'GET' -->
//  	 	}).done(getReviewDoneHandler);
		
//  	} 
//  	function getReviewDoneHandler(response, status, xhr){

 	
//  	$("#reviewDiv").html(response);								
//  	$.fancybox.open({ 
//  		src  : '#reviewDiv', 
//  		type : 'inline', 
// 		opts : { -->
//  			afterShow : function( instance, current ) {
//  				console.info( 'done!' ); 
// 			} 
// 		} 
	
// 	}); 
	
// } 

</script>
</head>
<body>
<jsp:include page="/subviews/header.jsp">
	 	<jsp:param value="---購物" name="subheader"/>
</jsp:include>

<article>	
		
</article>

    <div id="outer">
        <div id="contnet">
            <div id="menu">
                <div id="category" class="categoryMenu" style="height: 2000px;">
                    <h4 id="contentPlacerHolder1" class="cate1">筆記型電腦</h4>
                    <ul>
                        <li id="cateMenu1" class="selected">
                            <a href="">ACER開學戰鬥機</a>
                            <div id="contentPlacerHolder1Menu1" class="item">
                                <p><a href="">輕盈美 隨你挑</a></p>
                                <p><a href="">神助攻 機淺能</a></p>
                                <p><a href="">競技魂 瘋電競</a></p>
                                <p><a href="">高解析 追據魔</a></p>
                            </div>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
        <%@include file='product_ajax.jsp' %>
		
            <div class="productdetial2">
                <div>
                    <ul id="tabs">
                        <li><a href="#box1" id="#btn1" class="tab" >商品特色</a></li>
                        <li><a href="#box2" id="#btn2" class="tab" >商品規格</a></li>
                        <li><a href="javascript:getReview(<%=p.getId() %>)" id="#btn3" class="tab" >買家評價</a></li>
                       
                    </ul>
                </div>
                <%if(p.getDescriptionPhoto1()!=null){%>
                <div id="container">
                
                    <div id="box1" class="tab_content box1">
                        <img src="<%=p.getDescriptionPhoto1() %>" alt="">
                    </div>
                    <div id="box2" class="tab_content box2">
                        <img src="<%=p.getDescriptionPhoto2() %>" alt="" >
                    </div>

                </div>
                <%} %>
            </div>
          </div>
        </div>
        </div>
        <div id="reviewDiv"></div>
  <%@include file="/subviews/footer.jsp" %>
</body>
</html>