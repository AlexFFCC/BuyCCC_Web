<%@page import="java.time.LocalDate"%>
<%@page import="uuu.bccc.entity.Customer"%>
<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>


<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <script src="https://code.jquery.com/jquery-3.0.0.js"
	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo="
	crossorigin="anonymous"></script>
    <title>修改會員</title>

<style>
    body {
        margin: 0;
        padding: 0;
        background-color: gainsboro;
        font-family: 'Noto Sans TC', sans-serif;
    }



    section {
        text-align: center;
        margin-top: 60px;

    }

    span {
        display: inline-table;
        text-align: left;
    }

    #updateForm {
        border-radius: 5px;
        padding: 20px 40px;
        border: rgb(185, 185, 240) 2px solid;
        display: inline-flex;
        flex-direction: column;
        background-color: white;
        position: relative;
    }

    #eye {
        position: absolute;
        left: 310px;
        padding: 5px 0;
        width: 12px;

    }

    #space {
        width: 50%;
    }

    #head_content span:last-child {
        margin-right: 70px;
    }
    article{
    height:70vh;
    }
     .captchagroup {
        margin: 15px 0px;
    }

    #captchaimg {
        vertical-align: middle;
    }
    #refreshCaptcha{
  width: 12px;
position: relative;
  }
  #errorList{
  color:red;
  }
</style>

<script type="text/javascript">
	$(document).ready(init);
    function init() {
    	$("input[name='name']").attr("minlength",'<%= Customer.MIN_NAME_LENGTH%>');
    	$("input[name='name']").attr("maxlength",'<%= Customer.MAX_NAME_LENGTH%>');
    	
    	$("input[name='birthday']").attr("max",'<%= LocalDate.now().minusYears(Customer.MIN_AGE)%>');
    	$("input[name='birthday']").attr("value",'<%= LocalDate.now().minusYears(Customer.MIN_AGE)%>');
    	
    	$("#male").val('<%= Customer.MALE%>');
    	repopulateForm();
        $("#eye").mousemove(moveHandler);
        $("#eye").mousedown(showHandler);
        $("#eye").mouseup(hideHandler);
        $("#refreshCaptcha").mousemove(moveHandler);
		$("#refreshCaptcha").click(refreshHandler);
		
		
    }
    function repopulateForm(){
    	<%if("POST".equalsIgnoreCase(request.getMethod())){%>
    	$("input[name='id']").val('<%= request.getParameter("id")!=null?request.getParameter("id"):""%>');
		$("input[name='name']").val('${param.name}');
		$("input[name='email']").val('${param.email}');
		$("input[name='birthday']").val('${param.birthday}');
    	$("input[name='address']").val('${param.address}');
    	$("input[name='phone']").val('${param.phone}');
    	$("#male").prop('checked',${param.gender.charAt(0)==Customer.MALE});
    	$("#female").prop('checked',${param.gender.charAt(0)==Customer.FEMALE});
    	$("input[name='subscribed']").prop('checked',<%=request.getParameter("subscribed")!=null%>);
    	
    	
   	<% } else if("GET".equalsIgnoreCase(request.getMethod())){ 
		Customer member = (Customer)session.getAttribute("member");
		if(member!=null){
		%>
		$("input[name='id']").val('<%= member.getId() %>');
		$("input[name='name']").val('<%= member.getName() %>');
		$("input[name='email']").val('${sessionScope.member.email}');
		$("input[name='birthday']").val('${sessionScope.member.birthday}');
		
		$("#male").prop('checked', ${sessionScope.member.gender==Customer.MALE});
		$("#female").prop('checked', ${sessionScope.member.gender==Customer.FEMALE});
		$("#others").prop('checked', ${sessionScope.member.gender==Customer.OTHERS});
		
		$("input[name='address']").val('${sessionScope.member.address}');
		$("input[name='phone']").val('${sessionScope.member.phone}');
		$("input[name='subscribed']").prop('checked', ${sessionScope.member.subscribed});
	<%	}else{%>
		alert("請先登入會員才能進入會員修改!");
		location.href='<%=request.getContextPath()%>/login.jsp';
	<%	} %>
<% } %>
    	
    }
    
    function moveHandler() {
        $("#eye").css("cursor", "Pointer");
        $("#refreshCaptcha").css("cursor", "Pointer");
    }
    function showHandler() {
        $("#pwd").attr("type", "text");
       
        $("#eye").attr("src", "../images/2eye.png")
    }
    function hideHandler() {
        $("#pwd").attr("type", "password")
        
        $("#eye").removeAttr("src", "../images/2eye.png")
        $("#eye").attr("src", "../images/1eye.png")
    }
    function refreshHandler(){
		$("#captchaimg").attr("src","<%=request.getContextPath()%>/images/update_captcha.jpg?ccc="+new Date());
	}
</script>
</head>
<body>
    
    <jsp:include page="/subviews/header.jsp">
	 	<jsp:param value="---會員修改" name="subheader"/>
	 </jsp:include>
    <article>
<%List<String> errorList= (List)request.getAttribute("errorList");%>
    <section>
        <form action="update_member.do" id="updateForm" method="post">
            <h1>更改會員資料</h1>
            
            <span id="errorList"><%=errorList!=null?errorList:""%></span>
            
            <span>身分證號</span>
            <input type="text" placeholder="ID Number" readonly name=id required ><br>
            
            <span>姓名</span>
            <input type="text" placeholder="Name" name="name" required><br>
            
            <span>請輸入E-mail</span>
            <input type="email" placeholder="請輸入註冊E-mail" name="email"  required><br>
            
            <span>請輸入密碼</span><span><img id="eye" src="../images/1eye.png"></span>
            <input type="password" id="pwd" placeholder="請輸入密碼" size="30" name="password"required><br>
            
            
            <span>請選擇出生年月日</span>
            <input type="date" name="birthday"><br>
            
            <span>電話號碼</span>
            <input type="tel"  minlength="7" maxlength="14" name="phone" placeholder="Phone"><br>
            
            <span>聯絡地址</span>
            <input type="text" placeholder="Address" name="address" ><br>
            
            <span>性別
                <input type="radio"  name="gender" id="male"required>
                <label for="Male">男</label>
                <input type="radio" value="F" name="gender"id="female" required>
                <label for="Female">女</label><br>
            </span>
            
            <span>
                <input type="checkbox" name="subscribed">訂閱商品/活動訊息<br>
            </span>
            
            <div class="captchagroup">
                <input type="text" name="captcha" id="captcha" placeholder="請輸入驗證碼">
                <img id="captchaimg" src="<%=request.getContextPath()%>/images/update_captcha.jpg" width="100px" height="30px">
                <img src="<%=request.getContextPath()%>/images/refresh.png" id="refreshCaptcha">
            </div>
            
            <input type="submit" value="立即更新資料">
        </form>
    </section>
   </article>
<%@include file="/subviews/footer.jsp" %>
   
</body>

</html>