<%@page import="uuu.bccc.entity.Customer"%>
<%@ page pageEncoding="UTF-8" %>
<!-- header.jsp start -->
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@300;400&display=swap" rel="stylesheet"> 
</head>
<style>
body {
    margin: 0px;
    padding: 0px;
}

header {
    
    
    /* background-color: rgb(49, 68, 116); */
    padding-bottom: 10px;
    /* position: relative; */
   
    
}
.toolBar{
    display: flex;
    flex-direction: row;
    background-color: rgb(111, 145, 231);
}

.empty{
   flex: auto;
}
.toolBarleft{
    margin-left: 8%;
flex: none;
width: 20%;
}
.toolBarrigh{
    flex: none;
    width: 0px;
    
}
.toolBarleft span {
    margin: 0;
    padding: 0;
    float: left;
    /* left: 320px; */
    /* position: relative; */
    color: cornsilk;
    /* height: 35px;
    width: 36%;
    padding: 8px;
    flex-direction: column;
    align-items: flex-end; */

   
   
}
.toolBarleft li {
    
    list-style-type: none;
   
}


.toolBarright li {
    float:right;
    list-style-type: none;
    margin-right: 40px;
    
   align-items: center;
}

.toolBarright span {
    /* display: inline-block; */
    font-size: 16px;
   color: cornsilk;
    
}
#functionList {
    margin-top: 0px;
    color: cornsilk;
}
#homePage{
    margin-top: 0px;
}
.downheader {
	margin: 0px 0px;
	flex: auto;
	background-color: rgb(49, 68, 116);
}

.logoSearch {
	margin: 0px 0px;
	display: flex;
	flex-direction: row;
	align-items: flex-start;
	justify-content: center;
}

.searchTool {
	display: flex;
	margin-top: 25px;
}

.headerCenter {
	display: flex;
	flex-direction: column;
	align-items: center;
	/* justify-content: end; */
}

.searchbtn {
	width: 95px;
	height: 36px;
	padding: 0;
	font-size: 18px;
	letter-spacing: 2px;
	text-indent: 2px;
	color: #FFF;
	border: 0;
	cursor: pointer;
	background: #a1a030;
	border-right: 0;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
}

.searchInput {
	border: 1px solid #eee;
	width: 100%;
	padding: 4px 4px 6px 8px;
	box-sizing: border-box;
	position: relative;
	font-size: 16px;
	line-height: 1.5;
	flex: 1;
}

#logo {
	height: 82px;
}


</style>
<% Customer member = (Customer)session.getAttribute("member"); %>
  
        <div class="toolBar">
            <div class="toolBarleft">
                <ul id="homePage">
                    <li>
                        <a href="<%=request.getContextPath() %>">
                            <span>B3C首頁</span>
                        </a>
                    </li>
                    <li>
                    <a href="">
                    <span><%= request.getParameter("subheader") == null?"":request.getParameter("subheader")%></span>
                    </a>
                    </li>
                </ul>
            </div>
            <div class="empty"></div>
            <div class="toolBarright">
                <ul id="functionList">
                <%if (member==null){ %>
                    <li class=login">
                        <a href="<%=request.getContextPath() %>/login.jsp">
                            <span>會員登入</span>
                        </a>
                    </li>
                    <li class=register">
                        <a href="<%=request.getContextPath() %>/register.jsp">
                            <span>會員註冊</span>
                        </a>
                    </li>
                    <%}else{ %>
                    
<!--                     <li class="center"> -->
<!--                         <a href=""> -->
<!--                             <span>會員中心</span> -->
<!--                         </a> -->
<!--                     </li> -->
                    
                    <li class=logout">
                        <a href="<%=request.getContextPath() %>/logout.do">
                            <span>登出</span>
                        </a>
                    </li>
                    <li class="memberUpdate">
                        <a href="<%=request.getContextPath() %>/member/update.jsp">
                            <span>修改會員</span>
                        </a>
                    </li>
                    <li class="memberUpdate">
                        <a href="<%=request.getContextPath() %>/member/orders_history.jsp">
                            <span>檢視歷史訂單</span>
                        </a>
                    </li>
                    <li class="center">
                    <a href="">
                        <sapn><%= member!=null?member.getName()+"你好":"" %></sapn>
                        </a>
                     </li>
                     <%} %>
                    <li class=cart">
                        <a href="<%=request.getContextPath() %>/member/cart.jsp">
                            <span>購物車</span><span class="cartTotalQuantity"><%@include file='/small_cart.jsp' %></span>
                        </a>
                    </li>
                    
                </ul>
            </div>
        </div>
         <div class="downheader">
		<div class="logoSearch">
			<div class="headerleft">
				<a href="<%=request.getContextPath()%>"> <img id="logo"
					src="<%=request.getContextPath()%>/images/3CLogo.png" alt="">
				</a>
			</div>

			<div class="headerCenter">
				<div class="searchBox">
					<form method="GET" class="searchTool"
						action="<%=request.getContextPath()%>/products_list.jsp">
						<div style="position: relative;">
							<input type="search" name="search" class="searchInput" required value="${param.search}">
						</div>
						<input type="submit" value="搜尋" class="searchbtn" placeholder="搜尋">
					</form>
				</div>
			</div>
		</div>
	</div>
        <!-- header.jsp end -->