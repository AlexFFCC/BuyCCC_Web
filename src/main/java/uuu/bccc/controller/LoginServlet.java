package uuu.bccc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.bccc.entity.Customer;
import uuu.bccc.exception.BCCCException;
import uuu.bccc.service.CustomerService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do") //http://localhost:8080/b3c/login.do
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errorList = new ArrayList<>();
		//response.setCharacterEncoding("UTF-8");先在最前面宣告因為註冊程式有中文 要在取得data前
		HttpSession session = request.getSession();
		
		//1.取得request 中的form data 並檢查(基本檢查)
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String captcha = request.getParameter("captcha");
		
		if(id==null || (id=id.trim()).length()==0) {
			errorList.add("必須輸入帳號");
		}
		
		if(password==null || password.length()==0) {
			errorList.add("必須輸入密碼");
		}
		
		if(captcha==null || captcha.length()==0) {
			errorList.add("必須輸入驗證碼");
		}else {
			String oldCaptcha = (String)session.getAttribute("CaptchaServlet");
			if(!captcha.equalsIgnoreCase(oldCaptcha)) {//大小寫需要一樣，不用oldCaptcha的原因，可能會是null，所以才不用oldCaptcha。因為oldCaptcha沒有做檢查(前面)，所以才是選擇使用者輸入的captcha。句點左邊不能是null，因為使用者輸入的captcha上已經有做null檢查
				errorList.add("驗證碼不正確");//若要不分大小寫要使用equalsIgnoreCase
			}
		}
		session.removeAttribute("CaptchaServlet");
		//2.若無誤，則呼叫商業邏輯
		if(errorList.isEmpty()) {
			CustomerService cService = new CustomerService();
			try {
				Customer c = cService.login(id, password);
				
				//session.setMaxInactiveInterval(30);//單獨設定session time out時間單位 秒
				
				session.setAttribute("member", c);
				//內部轉交forward 給 login_ok.jsp
				
				String preUri = (String) session.getAttribute("previous.uri");
				String preQueryString = (String) session.getAttribute("previous.querystring");
				session.removeAttribute(preQueryString);
				session.removeAttribute(preUri);
				if(preUri==null) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/login_ok.jsp");
				dispatcher.forward(request, response);
				}else {
					if(preQueryString!=null && preQueryString.length()>0) {
						preUri +="?"+preQueryString;
					}
					response.sendRedirect(preUri);
				}
				return;//成功後停止繼續往下跑程式
			} catch (BCCCException e) {
				errorList.add(e.getMessage());//給user看
				this.log("登入失敗",e);//給管理員看
			}
		}
		
		request.setAttribute("errorList", errorList);
		//內部轉交forward 給 login.jsp
		RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
		dispatcher.forward(request, response);
		
	}

}
