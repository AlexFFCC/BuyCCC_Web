package uuu.bccc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.bccc.entity.Color;
import uuu.bccc.entity.Customer;
import uuu.bccc.entity.Product;
import uuu.bccc.entity.ShoppingCart;
import uuu.bccc.exception.BCCCException;
import uuu.bccc.service.ProductService;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/add_to_cart.do")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartServlet() {
        super();
       
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errorList = new ArrayList<>();
		HttpSession session = request.getSession();
		Customer member = (Customer) session.getAttribute("member");
		//1.取得request的form data(productId color quantity)
		String productId = request.getParameter("productId");
		String color = request.getParameter("color");
		String quantity = request.getParameter("quantity");
		String size = request.getParameter("size");
		
		//檢查id
		if(productId!=null) {
			ProductService pService = new ProductService();
			try {
				Product p = pService.getProductById(productId);
				if(p!=null) {
					Color theColor = p.getColorsMap().get(color);
					if(size==null) size="";
					if(quantity!=null && quantity.matches("\\d+")) {
						ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");//先去session看有沒有上次加入的購物車
						if(cart==null) {
							cart = new ShoppingCart();//第一次購
							session.setAttribute("cart", cart);
						}
						System.out.print(color+":"+theColor);
						cart.add(p, color, size, Integer.parseInt(quantity));
					}else {
						errorList.add("加入購物車失敗:購買數量需為正整數:"+quantity);
					}
				}else {
					errorList.add("查無產此產品:"+"productId"+productId);
				}
			} catch (BCCCException e) {
				this.log("加入購物車失敗",e);

			}
		}else {
			errorList.add("加入購物車productId不得為null");
		}
		
		this.log(errorList.toString());
		//轉接給/member/cart.jsp
		//內部轉交的寫法request.getRequestDispatcher("/member/cart.jsp").forward(request, response);
		
		//外部轉交，同步請求時使用
		response.sendRedirect(request.getContextPath()+"/small_cart.jsp");
		
	}

}
