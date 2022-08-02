package uuu.bccc.controller;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import freemarker.template.Configuration;
import freemarker.template.Template;
import uuu.bccc.entity.Customer;
import uuu.bccc.entity.Order;
import uuu.bccc.entity.PaymentType;
import uuu.bccc.entity.ShippingType;
import uuu.bccc.entity.ShoppingCart;
import uuu.bccc.exception.BCCCException;
import uuu.bccc.exception.StockShrotageException;
import uuu.bccc.service.OrderService;
import uuu.bccc.service.MailService;

/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/member/check_out.do")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckOutServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		List<String> errorList = new ArrayList<>();
	        
		Customer member = (Customer) session.getAttribute("member");
		ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

		String paymentType = request.getParameter("paymentType");
		String shippingType = request.getParameter("shippingType");
		String receipientName = request.getParameter("receipientName");
		String receipientTel = request.getParameter("receipientTel");
		String recipientEmail = request.getParameter("recipientEmail");
		String recipientAddr = request.getParameter("recipientAddr");

		if (member == null) {
			errorList.add("請先登入");
		}

		if (cart == null) {
			errorList.add("購物出是空的，請選擇商品加入購車再結帳");
		}

		PaymentType pType = null;
		if (paymentType != null) {
			pType = PaymentType.valueOf(paymentType);
		} else {
			errorList.add("請選擇付款方式");
		}

		ShippingType shType = null;
		if (shippingType != null) {
			shType = ShippingType.valueOf(shippingType);
		} else {
			errorList.add("請選擇貨運方式");
		}

		if (receipientName == null || (receipientName = receipientName.trim()).length() == 0) {
			errorList.add("請輸入收件人姓名");
		}
		if (receipientTel == null || (receipientTel = receipientTel.trim()).length() == 0) {
			errorList.add("請輸入收件人電話");
		}
		if (recipientEmail == null || (recipientEmail = recipientEmail.trim()).length() == 0) {
			errorList.add("請輸入收件人電子郵件");
		}
		if (recipientAddr == null || (recipientAddr = recipientAddr.trim()).length() == 0) {
			errorList.add("請輸入收件人住址");
		}
		if(member==null) {
			
		
			response.sendRedirect(request.getContextPath()+"/login.jsp");
			return;
		}
		if (errorList.isEmpty()) {
			OrderService oService = new OrderService();
			try {
				Order o = new Order();
				o.setMember(member);
				o.add(cart);

				o.setPaymentType(pType);
				o.setShippingType(shType);
				o.setShippingFee(shType.getFee());
				o.setRecipientName(receipientName);
				o.setRecipientEmail(recipientEmail);
				o.setRecipientPhone(receipientTel);
				o.setShippingAddress(recipientAddr);

				oService.checkOut(o);
				request.setAttribute("order", o);

		        if(o.getPaymentType()==PaymentType.CARD){                  

		           request.getRequestDispatcher("/WEB-INF/credit_card.jsp").forward(request, response);                 

		           return;

		        } 

				response.sendRedirect("orders_history.jsp");
				
				session.removeAttribute("cart");
				return;
			}catch(StockShrotageException e){
				errorList.add(e.getMessage());
			
			} catch (BCCCException e) {
				errorList.add("結帳失敗");
			}catch(Exception e) {
				errorList.add("結帳發生錯誤"+e.getMessage());
			}

		}
		
		request.setAttribute("errorList", errorList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/member/check_out.jsp");
		dispatcher.forward(request, response);
	}

}
