package uuu.bccc.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.bccc.entity.Customer;
import uuu.bccc.exception.BCCCException;
import uuu.bccc.service.OrderService;

/**
 * Servlet implementation class TransferServlet
 */
@WebServlet("/member/transfer.do")
public class TransferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TransferServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("hello");
		HttpSession session = request.getSession();
	    Customer member = (Customer) session.getAttribute("member");
	    if(member==null) {
			response.sendRedirect(request.getContextPath() + "/login.jsp");
			return;
		}
	    List<String> errorList = new ArrayList<>();
	    String bank = request.getParameter("bank");
	    String orderId = request.getParameter("orderId");
	    String pay = request.getParameter("pay");
	    String cardNumber = request.getParameter("cardNumber");
	    String transDate = request.getParameter("date");
	    String transTime = request.getParameter("time");
	    System.out.println(orderId);
	    if(bank==null || bank.length()==0) {
	    	errorList.add("請輸入銀行");
	    }
	    if(cardNumber == null || !cardNumber.matches("\\d{5}")) {
	    	errorList.add("必須輸入帳號後5碼且必須式數字格式");
	    }
	    
	    if(pay==null || pay.length()==0) {
	    	errorList.add("必須輸入轉帳金額");
	    }
	    if(transDate==null || transDate.length()==0){
	    	errorList.add("必須輸入transDate");
	    }
	    if(errorList.isEmpty()) {
	    	OrderService oService = new OrderService();
	    	System.out.println("middle");
	    	try {
				oService.updateStatusToTransfered(member.getId(), orderId,
				          bank, cardNumber, Double.parseDouble(pay), LocalDateTime.parse(transDate+"T"+transTime));
				 response.sendRedirect("order.jsp?orderId="+orderId);
		           return;
	    	} catch (NumberFormatException e) {
	    		errorList.add("轉帳金額格式不正確" + pay);
		       } catch (DateTimeParseException e) {
		    	   errorList.add("transDate不正確" + transDate);
		       } catch (BCCCException e) {             
		           this.log("通知轉帳失敗:" + e.getMessage(), e);
		           errorList.add(e.getMessage());
		       } catch(Exception e) {
		           this.log("通知轉帳發生錯誤:" + e.getMessage(), e);
		           errorList.add("通知轉帳發生錯誤:"+e);
		       }
	    	
	    	
	    }
	    System.out.println("有錯");
	    System.out.println(errorList);
	    request.setAttribute("errorList", errorList);
	    request.getRequestDispatcher("transfer.jsp").forward(request, response);
	}
	
}
