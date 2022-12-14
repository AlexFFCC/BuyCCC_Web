package uuu.bccc.controller;

import java.io.IOException;
import java.time.LocalDate;
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
import uuu.bccc.entity.Order;
import uuu.bccc.entity.Product;
import uuu.bccc.entity.Review;
import uuu.bccc.exception.BCCCException;
import uuu.bccc.service.OrderService;
import uuu.bccc.service.ProductService;
import uuu.bccc.service.ReviewService;

/**
 * Servlet implementation class ReviewServlet
 */
@WebServlet("/member/review.do")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Hello");
		HttpSession session = request.getSession();
		List<String> errorList = new ArrayList<>();
		Customer member = (Customer) session.getAttribute("member");
//		String productId = (String) request.getAttribute("productId");
//		String orderId = (String) request.getAttribute("orderId");
	
		String nickName = request.getParameter("nickName");
		String reviewContent = request.getParameter("reviewContent");
		String productId = request.getParameter("productId");
		String orderId = request.getParameter("orderId");
//		int productId = Integer.parseInt(request.getParameter("productId"));
//		int orderId = Integer.parseInt(request.getParameter("orderId"));		
		if(nickName==null || (nickName = nickName.trim()).length()==0) {
			errorList.add("???????????????");
		}
		if(reviewContent==null || (reviewContent = reviewContent.trim()).length()==0) {
			errorList.add("???????????????");
		}
		if(errorList.isEmpty()) {
			Review r = new Review();

			try {
				
//				r.setId(0);
				r.setMember(member);//??????session???member
				r.setNickName(nickName);//?????????????????????
				r.setComment(reviewContent);
//				r.setCommentDate(LocalDate.now());
				r.setOrderId(orderId);
//				OrderService oService = new OrderService();
				//??????????????????id?????????Order???????????????
//				Order o = oService.getOrderByIdAndCustomerId(member.getId(), orderId);
//				r.setOrderId(o);
				ProductService pService = new ProductService();				
				Product p = pService.getProductById(productId);
				r.setProduct(p);
				
				//??????????????????
				ReviewService rService = new ReviewService();
				
				rService.wirteComment(r);
				//TODO:???????????????????????????
				response.sendRedirect("order.jsp?orderId="+orderId);
//				
				return;
				
			} catch (BCCCException e) {
				System.out.println("????????????????????????");
			}

		}
		request.setAttribute("errorList", errorList);
		RequestDispatcher  dispatcher = request.getRequestDispatcher("/member/write_review.jsp");
		dispatcher.forward(request, response);
		
	}
}
