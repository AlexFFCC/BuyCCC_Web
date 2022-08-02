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
<title>Buy3C-產品</title>

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



    ol,
    ul {
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
        overflow: hidden;
        width: 918px;
/*         height: 280px; */
        border-bottom: 1px dashed #aaa;
        position: relative;
        left: 20px;
    }

    .rankingContent ul {
        position: relative;
        left: 0px;
        /* width: 30000px; */
        margin: 10px 0 0 10px;
    }

    .rankingContent ul li {
        float: left;
        border-right: 1px solid #ddd;
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

    .productdetail {
        padding: 2% 4%;
        display: flex;
        height: 350px;
        margin-bottom: 2%;
    }

    .productImg {
        padding-right: 30px;

    }

    .productInfo {
        padding-left: 30px;
        width: 550px;
    }

    #tabs {

        padding: 0;
        margin: 0;
    }

    #tabs li {
        list-style: none;
        float: left;
        margin-right: 5px;

    }

    a.tab {
        text-decoration: none;
        background: #666;
        padding: 5px;
        color: white;
    }

    #container {
        clear: both;
        position: relative;
    }

    #container h1 {
        font: 26px Tahoma, Geneva, sans-serif;
        font-weight: bold;
        color: #069;
        margin: 0;
        margin-bottom: 5px;
    }

    /*write code here*/
    .tab_content {
        border: 1px solid black;
        padding: 10px;
        width: 100%;
        height: auto;
        position: absolute;
        left: 0px;
        top: 0px;
        background: #eee;

    }

    .tab_content img {
        position: relative;
    }

    .tab_content:target {
        z-index: 1;
    }

    /* .box2 .box3 .bx1 {
        display: none;
    } */


    .productdetial2 {
        margin-left: 30px;
    }

    #album {
        width: auto;
        height: 360px;
        border-right: 1px dotted black;
        padding: 10px;
    }

    .smallPic {
        width: 60px;
        margin: 10px 2px;
        padding: 5px;
        background: white;
    }

    .selectedPhoto {
        background: orange;
    }

    /* HIDE RADIO */
    [type=radio] {
        position: absolute;
        opacity: 0;
        width: 0;
        height: 0;
    }

    /* IMAGE STYLES */
    [type=radio]+img {
        cursor: pointer;
    }

    /* CHECKED STYLES */
    [type=radio]:checked+img {
        outline: 2px solid #f00;
    }
</style>

<script type="text/javascript">

  $(document).ready(init);
//     $(document).on("submit","#cartForm",addToCart);
  function init() {
        $(".smallPic").click(showHandler);
        $(".smallPic:first").addClass("selectedPhoto");
        $("#cartForm").on("submit",addToCart);
       if( $("#productStock").attr('product-stock')==0){
    	   $("#submitData input").attr('disabled','disabled');
    	   
       }
    }
    function addToCart(e){
 	   //alert("檢查資料無誤");
	   //送出ajax請求 
	   	   $.ajax({
 		   url:$("#cartForm").attr("action"),
 		   method:$("#cartForm").attr("method"),
 		   data:$("#cartForm").serialize()
		   
 	   }).done(addToCartDoneHandler).fail(addToCartFailHandler);
	   	 
 	   e.preventDefault();//停止傳送
    }
  
    function addToCartDoneHandler(response , status , xhr){
 	   //alert(response);
 	   alert("產品加入購車成功");
	   //alert("加入購物車成功")
	   //TODO:部分更新
 	   $(".cartTotalQuantity").text(response);
   }
 	  function addToCartFailHandler(xhr, status, error){
 			alert("加入購物車失敗: " +  status + "," +  error);
 		}
  
    function showHandler() {
        var src = $(this).attr("src");
        $("#main").attr("src", src);
        $(".smallPic").removeClass("selectedPhoto");
        $(this).addClass("selectedPhoto");
    }
    function changePhoto(theIcon) {
        $("#main").attr("src", $(theIcon).attr("src"));
        $(".colorStock").text("還剩" + $(theIcon).attr('data-stock'));
        if($(theIcon).attr('data-stock')==0){
        	$("#submitData input").attr('disabled','disabled');
        }else{
        	$("#submitData input").removeAttr('disabled','disabled');
        }
        $("#submitData input").attr("max",$(theIcon).attr('data-stock'));

        
    }
  	function getReview(pid){
  		var xhr=$.ajax({
  	  		url:'review.jsp?productId='+ pid,
  	  		method:'GET'
  	 	}).done(getReviewDoneHandler);
  		
  	}
  	function getReviewDoneHandler(response, status, xhr){
		
		
		//部分更新: 用fancybox 3帶出產品明細(lightbox效果)
		$("#reviewDiv").html(response);								
		$.fancybox.open({
			src  : '#reviewDiv',
			type : 'inline',
			opts : {
				afterShow : function( instance, current ) {
					console.info( 'done!' );
				}
			}
		
		});
		
	}


</script>
</head>
<body>

<%
String productId = request.getParameter("productId");
	Product p = null;
	ProductService pService = new ProductService();
	if(productId!=null && productId.length()>0 ){
		p = pService.getProductById(productId);
	}
%>

        <div class="rightproductInfo">
        <%if(p!=null){ %>
            <div class="productdetail">
           
                <div id="album">
                    <div class="productImg">
                        <a href="product.jsp?productId=<%=p.getId()%>">
                            <img src="<%= p.getPhotoUrl() %>" id="main"
                                height="260" width="300">
                        </a>
                    </div>
                    <%if(p.getSmallPic1()!=null){ %>
                    <div>
                        <img src="<%=p.getSmallPic1() %>" class="smallPic"
                            alt="">
                        <img src="<%=p.getSmallPic2() %>"
                            class="smallPic" alt="">
                        <img src="<%= p.getPhotoUrl()%>" class="smallPic"
                        alt="">

                    </div>
                    <%}%>

                </div>
                
              
                <div class="productInfo">
                    <h3><%= p.getName() %></h3>
                    <div>
                        <ul>
                        	<li><%= p.getDescription() %></li>

                        </ul>
                    </div>
                    <h4>庫存 <span id ="productStock" class="colorStock" product-stock="<%=p.getStock()%>"><%=p.getStock()%></span></h4>

                    <h3><%=p.getUnitPrice() %></h3>
                    <form id="cartForm" method="POST" action="<%=request.getContextPath()%>/add_to_cart.do">
                        <input type="hidden" name="productId" value="<%=p.getId()%>">
                        <%if(p.getColorsMap().size()>0) {%>
	                        <div>
                       		<% 
//                        		拿到顏色的MAP 字串 顏色  區域變數，這個MAP從產品來的
                       			Map<String, Color> colorsMap=p.getColorsMap();
//                        		抓key取得顏色名稱
                       			Set<String> colorNamesSet = colorsMap.keySet();
//                        		:左邊 從根據集合中元素型別讀到字串宣告新的變數 顏色的名稱 :右邊是集合來源 
                       			for(String colorName:colorNamesSet){//根據上面抓到的顏色名稱去抓取相對應的value，所以把抓到的顏色名稱取個變數名稱與型態
                					//，然後依照你要取出的東西型態宣告它的型態，是從map裡面抓取出，所以就依照剛剛索取的顏色名稱去找出value。
                       				Color color = colorsMap.get(colorName);//取出Color其他資訊內容 就是 map中的去get value 
                       		%>
		                        <label>
		                            <input type="radio" name="color" value="<%= colorName %>" required>
		                            <img class="productIcon" data-stock="<%=color.getStock() %>"
		                                src="<%=color.getPhotoUrl() %>"
		                                onclick="changePhoto(this)" title="<%= colorName %>" width=70px;>
		                        </label>
		                    <% }%>    

	                        </div>
	                       <%} %>
                      
                        <div id="submitData">
	                        <label>數量</label>
	                        <input type="number" id="quantity" name="quantity" min="1" max="<%=p.getStock()>10?10:p.getStock()%>">
	                        
	                        <input type="submit" value="加入購物車" >
                        </div>
                    </form>
<%--                     <h4> <a  href="javascript:getReview(<%=p.getId() %>)">查看評價</a></h4> --%>
<!--                     <div style="margin-top: 20px;"> -->
<%--                    		 <a href="javascript:getReview(<%=p.getId() %>)">買家評價</a> --%>
<!--                     </div> -->
                </div>
            </div>
           
            <%}else{ %>
            <p>查無產品</p>
            <% }%>


</body>
</html>