package uuu.bccc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.bccc.entity.Customer;
import uuu.bccc.exception.BCCCDataInvalidException;
import uuu.bccc.exception.BCCCException;
import uuu.bccc.service.CustomerService;
import uuu.bccc.service.MailService;
import uuu.bccc.test.TestMailServicewithFreeMaker;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register.do")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<String> errorList = new ArrayList<>();
		request.setCharacterEncoding("UTF-8");
		//取出
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String birthday = request.getParameter("birthday");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String gender = request.getParameter("gender");
		String subscribed = request.getParameter("subscribed");
		String captcha = request.getParameter("captcha");
		//檢查               customer裡checkId是public static
		if (id == null || !Customer.checkId(id)) {
			errorList.add("必須輸入正確的ID");
		}
		if (name == null || (name = name.trim()).length() == 0) {
			errorList.add("必須輸入姓名");
		}
		if (email == null || (email = email.trim()).length() == 0) {
			errorList.add("必須輸入電子郵件");
		}
		if (password == null || password.length() == 0) {
			errorList.add("必須輸入密碼");
		}
		if (birthday == null || (birthday = birthday.trim()).length() == 0) {
			errorList.add("必須輸入出生年月日");
		}
		if (gender == null || (gender = gender.trim()).length() == 0) {
			errorList.add("必須選擇性別");
		}
		HttpSession session = request.getSession();
		if (captcha == null ||(captcha = captcha.trim()).length() == 0) {
			errorList.add("必須輸入驗證碼");
		}else {
			String oldCaptcha = (String)session.getAttribute("RegisterCaptchaServlet");
			if(!captcha.equalsIgnoreCase(oldCaptcha)) {//大小寫需要一樣，不用oldCaptcha的原因，可能會是null，所以才不用oldCaptcha。因為oldCaptcha沒有做檢查(前面)，所以才是選擇使用者輸入的captcha。句點左邊不能是null，因為使用者輸入的captcha上已經有做null檢查
				errorList.add("驗證碼不正確");//若要不分大小寫要使用equalsIgnoreCase
			}
		}
		session.removeAttribute("RegisterCaptchaServlet");
		//若無誤(看到無誤就要想到要如何看到錯誤，所以會有上方的檢查，檢查有錯就要放在一起，所以要List) 呼叫商業邏輯
		if (errorList.isEmpty()) {
			Customer c = new Customer();

			try {
				c.setId(id);
				c.setName(name);
				c.setEmail(email);
				c.setPassword(password);
				c.setBirthday(birthday);
				c.setPhone(phone);
				c.setAddress(address);
				c.setGender(gender.charAt(0));
				c.setSubscribed(subscribed != null);

				CustomerService service = new CustomerService();
				service.register(c);
				//顯示註冊成功會面
				request.setAttribute("register", c);
				
				
				MailService.sendHelloMailWithLogo(c);
				
				RequestDispatcher dispather = request.getRequestDispatcher("/register_ok.jsp");
				dispather.forward(request, response);
				return;
			} catch(BCCCDataInvalidException e) {
				errorList.add(e.getMessage());
			} catch (BCCCException e) {
				this.log(e.getMessage(), e);
	            errorList.add(e.getMessage());
			}catch(Exception e) {
				this.log("會員註冊發生非預期錯誤"+e.getMessage(), e);
	            errorList.add("會員註冊失敗:"+e.getMessage());
			}
    
		}//若有誤 產生錯誤網頁
		request.setAttribute("errorList", errorList);
		RequestDispatcher  dispatcher = request.getRequestDispatcher("/register.jsp");
		dispatcher.forward(request, response);
	}

}
