<%@page import="java.time.LocalDate"%>
<%@page import="uuu.bccc.entity.Customer"%>
<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <script src="https://code.jquery.com/jquery-3.0.0.js"
	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo="
	crossorigin="anonymous"></script>
    <title>register</title>

<style>
    body {
        margin: 0;
        padding: 0;
        background-color: gainsboro;
        font-family: 'Noto Sans TC', sans-serif;
    }

	article{
	height: 70vh;
	}

    section {
        text-align: center;
        margin-top: 40px;

    }

    span {
        display: inline-table;
        text-align: left;
    }

    #registerForm {
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
/*     article{ */
/*     height:auto; */
/*     } */
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
    	
    	<%}%>
    }
    
    function moveHandler() {
        $("#eye").css("cursor", "Pointer");
        $("#refreshCaptcha").css("cursor", "Pointer");
    }
    function showHandler() {
        $("#pwd").attr("type", "text");
       
        $("#eye").attr("src", "./images/2eye.png")
    }
    function hideHandler() {
        $("#pwd").attr("type", "password")
        
        $("#eye").removeAttr("src", "./images/2eye.png")
        $("#eye").attr("src", "./images/1eye.png")
    }
    function refreshHandler(){
		$("#captchaimg").attr("src","images/register_captcha.jpg?ccc="+new Date());
	}
</script>
</head>
<body>
    
    <jsp:include page="/subviews/header.jsp">
	 	<jsp:param value="---註冊會員" name="subheader"/>
	 </jsp:include>
    <article>
<%List<String> errorList= (List)request.getAttribute("errorList");%>
    <section>
        <form id="registerForm"action="register.do" method="POST">
            <h1>Create an Account</h1>
            
            <span id="errorList"><%= errorList!=null?errorList:""%></span>
            
            <span>身分證號</span>
            <input type="text" placeholder="ID Number"  name=id required ><br>
            
            <span>姓名</span>
            <input type="text" placeholder="Name" name="name" required><br>
            
            <span>請輸入E-mail</span>
            <input type="email" placeholder="請輸入註冊E-mail" name="email"  required><br>
            
            <span>請輸入密碼</span><span><img id="eye" src="./images/1eye.png"></span>
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
                <img id="captchaimg" src="images/register_captcha.jpg" width="100px" height="30px">
                <img src="images/refresh.png" id="refreshCaptcha">
            </div>
            
            <input type="submit" value="立即註冊">
        </form>
        </section>
        
       </article>

<%@include file="/subviews/footer.jsp" %>
    
</body>

</html>