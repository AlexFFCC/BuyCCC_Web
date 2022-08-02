<%@page import="uuu.bccc.entity.Outlet"%>
<%@page import="uuu.bccc.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="uuu.bccc.service.ProductService"%>
<%@page import="uuu.bccc.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@300&display=swap" rel="stylesheet"> 
<script src="https://code.jquery.com/jquery-3.0.0.js"
	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo="
	crossorigin="anonymous"></script>
    <title>B3C首頁</title>


    
    <script type="text/javascript">
        $(document).ready(init);
        function init() {
            $(".listbox").click(showHandler);
            $(".sub_menu_content").mouseleave(hideHandler);
            $(".wrapperbox1").mouseleave(hideHandler);


        }
        function showHandler() {
            $(".sub_menu_content").css("visibility", "visible");
        }

        function hideHandler() {
            $(".sub_menu_content").css("visibility", "hidden");

        }

    </script>
    <style>
body {
    margin: 0px;
    padding: 0px;
}



.wrapperbox {
	margin-top:40px;
    height: 450px;
    padding-bottom: 20px;
   
}

.wrapperboxOuter3{
	margin-top:40px;
    height: 320px;
    padding-bottom: 20px;
   
}

.wrapperbox1 {
    width: 1140px;
    margin: 0 auto;
    height: 452px;
    box-shadow: 0px 2px 2px rgb(0 0 0 / 10%);
    border-radius: 5px;
    display: flex;
    
}

.wrapperbox2 {
    width: 1140px;
    margin: 0 auto;
    height: 452px;
    box-shadow: 0px 2px 2px rgb(0 0 0 / 10%);
    border-radius:10px;
    display: flex;
    border-top:2px solid red;
}
.wrapperbox3 {
    width: 1140px;
    margin: 0 auto;
    height: 280px;
    box-shadow: 0px 2px 2px rgb(0 0 0 / 10%);
    border-radius:10px;
    display: flex;
    border-top:2px solid red;
}
.wrapperlistbox {
    width: 200px;
    border-bottom-left-radius: 5px;
    border-top-left-radius: 5px;
    border: 1px solid #e5e5e5;
    margin-bottom: 0px;
}

.wrapperlistbox ul {
    height: 450px;
    overflow: hidden;
    background: #fcfcfc;
    list-style: none;
    position: relative;
}

.wrapperlistbox li {
    border-bottom: 1px solid #e5e5e5;
    position: relative;
   
}

.allmenue {
    border-top-left-radius: 5px;
    background: rgb(49, 68, 116) !important;
}

.allmenue a i {
    color: #FFF;
}

.listbox,.rankingContent li {
    display: list-item;
    list-style: none;
}

.listbox {
    margin: 0px;
    padding: 0px;
}

.listbox a {
    font-size: 16px;
    /* display: block; */
    color: rgb(49, 68, 116);
    line-height: 2.51;
    margin-left: 34px;
}

.sub_menu_content {
    min-width: 100px;
    height: 450px;
    width: 200px;
    background: #fff;
    display: flex;
    border-left: #bbc803 6px solid;
    border-right: #bbc803 6px solid;
    visibility: hidden;
    position: absolute;
}
.listbox a:hover{
    z-index: 1;
}
.sub_menu_content:target {
    z-index: 1;
}

.sub_menu_content .title {
    font-size: 115%;
    margin: 14px 20px 10px 20px;
}



.wrapperbannerbox {
    border: 1px solid #e5e5e5;
    height: 410px;
    width: 738px;
    margin: 0px;

}
.bannertopbtngroup{
 box-sizing: unset;
}
.bannertopbtngroup ul {
    display: flex;
    flex-direction: row;
    /* justify-content: space-around; */
    list-style: none;
}
.item li{

list-style: none;}
div.bannertopbtngroup>ul li a {
    font-size: 14px;
    letter-spacing: 3px;
    text-decoration: none;
    color: #fff;
    display: block;
    /* height: -webkit-fill-available; */
    line-height: 40px;
}

div.bannertopbtngroup {
    height: 40px;
    background: rgb(49, 68, 116);
    margin: 0 0 1px 0;
    /* display: flex;
    flex-direction: column; */
}

div.bannertopbtngroup>ul {
    flex-wrap: nowrap;
    display: flex;
    justify-content: space-around;
    height: 40px;
    width: 90%;
    overflow: hidden;
    margin: 0px;
}
.rightpromotionbox{
    border: 1px solid #e5e5e5;
    /* float: left; */
    width: 200px;
    height: 452px;
    border-bottom-right-radius: 5px;
    border-top-right-radius: 5px;
    box-sizing:initial
}
.promationtitle{
    background: rgb(49, 68, 116);
  
    border: inherit;
    border-top-right-radius: 5px;
}
.promationtitle p{
    margin: 7px auto;
    display: block;
    text-align: center;
    font-size: 18px;
    color: #ffffff;
    letter-spacing: 6px;
    font-weight: 400;
}
.promationproduct{
    position: relative;
    background: #fff;
    border-bottom-right-radius: 5px;
}
.promationproduct a{
    text-decoration: none;
}
.topiconbox{
    position: absolute;
    background: rgb(49, 68, 116);
    right: 10px;
    top: 10px;
    width: 60px;
    height: 60px;
    border-radius: 999px;
    z-index: 1;
}
.discountinfo{
    white-space: normal;
    color: #e1f340;
    text-align: center;
    font-weight: 700;
    font-size: 16px;
    width: 100%;
    padding-top: 18px;
}
.promationproduct img{
    height: 143px;
    width: 143px;
    border: 0px;
    display: block;
    margin: 0 auto;
    padding: 30px 0;
    border-width: medium;
}
.slogan{
    margin: 0 10px;
    padding: 22px 0 10px 0;
}
.slogan span{
    display: inline-block;
    /* text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden; */
    color: red;
    width: 190px;
    font-size: 16px;
}
.promprodname{
    margin: 0px 10px;
    padding: 0 0 10px 0;
    width: 190px;
   
}
.promprodname p{
    font-size: 16px;
    color: #666;
    display: -webkit-box;
    text-overflow: ellipsis;
    overflow: hidden;
    line-height: 1.5;
    width: 190px;
    height: 50px;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
}
.promprice{
    margin: 0 10px;
    height: 40px;
    border-bottom-right-radius: 5px;
}
.promprice p{
    font-size: 16px;
    text-decoration: line-through;
    float: left;
    padding-top: 5px;
    padding-right: 8px;
    color: #a0a0a0;
}
.dayprice{
    font-size: 22px;
    color: #F00;
}
.swiper-container{
    height: 410px !important;
    position: relative;
    
}
.swiper-slide{
    height: 100%;
   
    color: #000;
    width: 100%;
    height: 100%;
    text-align: center;
    line-height: 450px;
    flex-shrink: 0;
    position: absolute;
    left: 0px;
    top: 0px;
    
}
.slideimg{
    height: 410px;
    margin: 0%;
    position: absolute;
    left: 0px;
    top: 0px;
    display: none;
}
.w3-left, .w3-right, .w3-badge {cursor:pointer}
 .rankingContent {
        overflow: hidden;
/*          width: 918px;  */
         height: 250px; 
        border-bottom: 1px dashed #aaa;
        position: relative;
/*         left: 20px; */
        margin:0 auto;
        
    }

    .rankingContent ul {
        position: relative;
        left: 0px;
        padding:0px;
        margin: 10px 0 0 10px;
        display:inline-block;
    }

    .rankingContent ul li {
		float: left; 

      	
        width: 142px;
        height: 260px;
        padding: 0 5px 0 5px;
        /* position: relative; */
        margin:0 20px;
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
        width: 100%;
        overflow: hidden;
        line-height: 18px;
        font-size: 85%;
        height: 40px;
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
  #lastestDiv{  

  }  
 #lastestProduct{ 
 position:relative;
 top:70px;
 left:45px;
 height:auto;
 vertical-align:center;
 writing-mode: vertical-lr; 
 color:white;
 padding:10px;
 border-radius:10px;
 font-size: 25px;
 background-color:rgb(49, 68, 116);
font-family: 'Noto Sans TC', sans-serif;
 } 
 </style>
</head>

<body>

<jsp:include page="/subviews/header.jsp"/>

    <section class="wrapperbox">
        <div class="wrapperbox1">
            <div class="wrapperlistbox">
                <ul class="listbox">
                    <li class="allmenue">
                        <a>
                            <i>全站分類</i>
                        </a>
                    </li>
                    <li content=menu2 class="menu2">
                        <a href="#sublist1">暢銷品牌 限時優惠</a>
                    </li>
                    <li content=menu3 class="menu3">
                        <a href="#sublist2">筆記型電腦</a>
                    </li>
                    <li content=menu4 class="menu4">
                        <a href="#sublist3">主機 螢幕</a>
                    </li>
                    <li content=menu5 class="menu5">
                        <a href="#sublist4">電腦周邊 辦公設備</a>
                    </li>
                    <li content=menu6 class="menu6">
                        <a href="#sublist5">行動通訊</a>
                    </li>
                    <li content=menu7 class="menu7">
                        <a href="#sublist6">穿戴裝置</a>
                    </li>
                    <li content=menu8 class="menu8">
                        <a href="#sublist7">電視 音響</a>
                    </li>
                    <li content=menu9 class="menu9">
                        <a href="#sublist8">大型家電</a>
                    </li>
                    <li content=menu10 class="menu10">
                        <a href="#sublist9">生活家電</a>
                    </li>
                    <li content=menu11 class="menu11">
                        <a href="#sublist10">品牌旗艦館</a>
                    </li>
                </ul>
            </div>
            <div>
                <div class="sub_menu_content" content="menu1" id="sublist1">
                    <div>
                        <div class="title">
                            <span>暢銷品牌 限時優惠</span>
                        </div>
                        <div class="item">
                            <ul>
                                <li>
                                    <a href="">
                                        <h6>Panasonic國際牌</h6>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <h6>ASUS華碩</h6>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <h6>PHILPS飛利浦</h6>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <h6>LG家電</h6>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="sub_menu_content" content="menu2" id="sublist2">
                    <div>
                        <div class="title">
                         <a href="products_list.jsp">
                            <span>筆記型電腦</span>
                           </a> 
                        </div>
                        <div class="item">
                            <ul>
                                <li>
                                    <a href="products_list.jsp">
                                        <h6>Acer宏碁</h6>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <h6>ASUS華碩</h6>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <h6>HP惠普</h6>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <h6>DELL戴爾</h6>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="sub_menu_content" content="menu3" id="sublist3">
                    <div>
                        <div class="title">
                            <span>主機 螢幕 零組件</span>
                        </div>
                        <div class="item">
                            <ul>
                                <li>
                                    <a href="">
                                        <h6>品牌桌上型電腦</h6>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <h6>電腦螢幕</h6>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <h6>顯示卡</h6>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <h6>主機板</h6>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bannerboxOutline">
                <div class="wrapperbannerbox">
                    <div class="bannertopbtngroup">
                        <ul>
                            <li class="bannerbtn">
                                <a href="">Outlet館</a>
                            </li>
                            <li class="bannerbtn">
                                <a href="">APPLE旗艦館</a>
                            </li>
                            <li class="bannerbtn">
                                <a href="">節日特優惠館</a>
                            </li>
                            <li class="bannerbtn">
                                <a href="">線上型錄</a>
                            </li>
                            <li class="bannerbtn">
                                <a href="">會員獨享</a>
                            </li>
                        </ul>
                    </div>
                       <div class="swiper-container">
                        <div class="swiper-container swiper-continer-horizontal">
                            <div class="swiper-slide swiper-slide-duplicate" style="width: 738px;">

                                <div class="swiper-slide">

                                    <a href="https://tw.yahoo.com/">
                                        <img class="slideimg" src="./images/sliderad1.jpg" alt=""></a>
                                    <a href="https://www.google.com.tw/">
                                        <img class="slideimg" src="./images/sliderad2.jpg" alt=""></a>
<!--                                     <a href=""> -->
<!--                                         <img class="slideimg" src="./images/sliderad3.jpg" alt=""> -->
<!--                                     </a> -->
                                   	 <a href="">
                                         <img class="slideimg" src="./images/sliderad4.jpg" alt=""> 
                                     </a> 
                                    <div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle"
                                        style="width: 100%; line-height: 40px;">
                                        <div id="leftarrow" class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1) ">
                                            &#10094;</div>
                                        <div id="rightarrow" class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">
                                            &#10095;</div>
                                    </div>
                                </div>

                                <script>
                                    var myIndex = 0;
                                    carousel();

                                    function carousel() {
                                        var i;
                                        var x = document.getElementsByClassName("slideimg");
                                        for (i = 0; i < x.length; i++) {
                                            x[i].style.display = "none";
                                        }
                                        myIndex++;
                                        if (myIndex > x.length) { myIndex = 1 }
                                        x[myIndex - 1].style.display = "block";
                                        setTimeout(carousel, 2500); // Change image every 2 seconds
                                    }
                                    var slideIndex = 1;
                                    showDivs(slideIndex);

                                    function plusDivs(n) {
                                        showDivs(slideIndex += n);
                                    }

                                    function currentDiv(n) {
                                        showDivs(slideIndex = n);
                                    }

                                    function showDivs(n) {
                                        var i;
                                        var x = document.getElementsByClassName("slideimg");
                                        var dots = document.getElementsByClassName("demo");
                                        if (n > x.length) { slideIndex = 1 }
                                        if (n < 1) { slideIndex = x.length }
                                        for (i = 0; i < x.length; i++) {
                                            x[i].style.display = "none";
                                        }
                                        for (i = 0; i < dots.length; i++) {
                                            dots[i].className = dots[i].className.replace(" w3-white", "");
                                        }
                                        x[slideIndex - 1].style.display = "block";
                                        dots[slideIndex - 1].className += " w3-white";
                                    }
                                </script>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="rightpromotionbox">
                <div class="promationtitle">
                    <p>限時優惠</p>
                </div>
                <div class="promationproduct">
                    <a href="">
                        <div class="topiconbox">
                            <div class="discountinfo">5折</div>
                        </div>
                        <div class="promotionproduct">
                            <img src="./images/promprod.jpg" alt="促銷產品照片">
                        </div>
                        <div class="slogan">
                            <span>買ASUS只要16000</span>
                        </div>
                        <div class="promprodname">
                            <p>ASUS華碩<br>藍15.6吋入門美型筆電</p>
                        </div>
                        <div class="promprice">
                            <p>$32000</p>
                            <span class="dayprice">$16000</span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>
     <section class="wrapperboxOuter3">
        <div class="wrapperbox3">
         <div id="lastestDiv"><h4 id="lastestProduct">最新上架</h4></div> 
         
        <%
			String search = request.getParameter("search");
			String category =  request.getParameter("category");
			ProductService pService = new ProductService();

			List<Product> list = null;

			if (search != null && search.length() > 0) {
				list = pService.getProductsByKeyword(search);
				
			} else {
				list = pService.getNewestProudcts();
			}
			%>
           
            <div class="rankingContent">
				<%
				if (list != null && list.size() > 0) {
				%>
				<ul >
					<div id="listsearch">
						<%
						
						for (int i = 0; i <list.size(); i++) {
							Product p = list.get(i);
						%>
						<li id="top5">
							<p></p> <a href=""><img src=<%=p.getPhotoUrl()%>
								height="143" width="143" border="0" alt=""></a>
							<div class="prodName">
								<a href="product.jsp?productId=<%=p.getId()%>"><%=p.getName()%></a>
							</div>
							<div class="price">
								<span><%=p instanceof Outlet ? ((Outlet) p).getDiscountString() : ""%><%=p.getUnitPrice()%></span>
							</div>
						</li>
						<%
						}
						%>
<%} %>
					</div>
				</ul>

			</div>
            
            </div>
        </div>
    </section>
      <%@include file="/subviews/footer.jsp" %>
</body>

</html>