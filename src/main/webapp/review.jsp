<%@page import="java.util.List"%>
<%@page import="uuu.bccc.entity.Review"%>
<%@page import="uuu.bccc.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>評價</title>
    <style>
        article {
            margin: 0 auto;
            width: 500px;
        }

        #reviewUl {
            list-style: none;
            display: inline-block;

        }

        #reviewH3 {
            text-align: center;
        }

        .outLineLi {
            border: 1px solid black;
            margin-bottom: 30px;
            width: 450px;
            padding: 10px;
        }
        #comment{
        	font-weight: 400;
        	font-family: 'Noto Sans TC', sans-serif;
        	color:navy;
        }
        #date ,#orderId{
        	font-size: 100;
        	color: gray;
        }
        #subContent{
        display:flex;
        
        }
        #emptyContent{
        flex:auto;
        }
    </style>
</head>

<body>
<%
String productId = request.getParameter("productId");
ReviewService rService = new ReviewService();
List<Review> list = rService.getReviewsOfProductId(productId);
if(list!=null && list.size()>0){
%>
    <article>
        <h3 id="reviewH3">客戶評價</h3>
        <div id="reviewBox">
            <ul id="reviewUl">
            
            <%for (int i = 0; i <list.size(); i++) { 
            	Review r = list.get(i);
            %>
                <li class="outLineLi">
                    <p><span><%=r.getNickName() %></span></p>
        
                    
                    <p id="comment"><%=r.getComment() %></p>
                    <div id="subContent">
	                    <span id="date">評價留言:<span><%=r.getCommentDate() %></span></span>
	                    <span id="emptyContent"></span>
	                    <span id="orderId">訂單編號:<%=r.getOrderId() %></span>
                    </div>
                </li>
             <%} %>

            </ul>
        </div>
    </article>
    <%}else{ %>
    <p>目前尚未有評價</p>
    <%} %>
</body>

</html>