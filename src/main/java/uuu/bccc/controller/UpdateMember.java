package uuu.bccc.controller;

import java.io.IOException;
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
import uuu.bccc.exception.BCCCDataInvalidException;
import uuu.bccc.exception.BCCCException;
import uuu.bccc.service.CustomerService;

/**
 * Servlet implementation class Update_member
 */

@WebServlet("/member/update_member.do")
public class UpdateMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Customer member = (Customer) session.getAttribute("member");
		List<String> errorList = new ArrayList<>();
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

		if (id == null || member==null|| !id.equals(member.getId())) {
			errorList.add("請勿更改身分證號ID");
		}
		if (name == null || (name = name.trim()).length() == 0) {
			errorList.add("必須輸入姓名");
		}
		if (email == null || (email = email.trim()).length() == 0) {
			errorList.add("必須輸入電子郵件");
		}
		if (password == null || password.length() == 0 ||!password.equals(member.getPassword())) {
			errorList.add("");
		}
		if (birthday == null || (birthday = birthday.trim()).length() == 0) {
			errorList.add("必須輸入出生年月日");
		}
		if (gender == null || (gender = gender.trim()).length() == 0) {
			errorList.add("必須選擇性別");
		}

		if (captcha == null || (captcha = captcha.trim()).length() == 0) {
			errorList.add("必須輸入驗證碼");
		} else {
			String oldCaptcha = (String) session.getAttribute("UpdateCaptchaServlet");
			if (!captcha.equalsIgnoreCase(oldCaptcha)) {// 大小寫需要一樣，不用oldCaptcha的原因，可能會是null，所以才不用oldCaptcha。因為oldCaptcha沒有做檢查(前面)，所以才是選擇使用者輸入的captcha。句點左邊不能是null，因為使用者輸入的captcha上已經有做null檢查
				errorList.add("驗證碼不正確");// 若要不分大小寫要使用equalsIgnoreCase
			}
		}
		session.removeAttribute("UpdateCaptchaServlet");

		if (errorList.isEmpty()) {
			Customer c = new Customer();

			try {
				c.setId(member.getId());
				c.setName(name);
				c.setEmail(email);
				c.setPassword(password);
				c.setBirthday(birthday);
				c.setPhone(phone);
				c.setAddress(address);
				c.setGender(gender.charAt(0));
				c.setSubscribed(subscribed != null);

				CustomerService cService = new CustomerService();
				cService.update(c);
				session.setAttribute("member", c);
//				if(session!=null) {
//					session.invalidate();
//				}
				response.sendRedirect(request.getContextPath());
				
				return;
			} catch (BCCCDataInvalidException e) {
				errorList.add(e.getMessage());
			} catch (BCCCException e) {
				this.log(e.getMessage(), e);
				errorList.add(e.getMessage());
			} catch (Exception e) {
				this.log("更新會員資料發生非預期錯誤" + e.getMessage(), e);
				errorList.add("更新會員資料註冊失敗:" + e.getMessage());
			}

		}
		request.setAttribute("errorList", errorList);
		RequestDispatcher  dispatcher = request.getRequestDispatcher("/member/update.jsp");
		dispatcher.forward(request, response);
	}
}

