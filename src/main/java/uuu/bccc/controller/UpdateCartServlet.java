package uuu.bccc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.bccc.entity.CartItem;
import uuu.bccc.entity.ShoppingCart;

/**
 * Servlet implementation class UpdateCartServlet
 */
@WebServlet("/member/update_cart.do")
public class UpdateCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCartServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
		//1.讀取表單資料
		String checkOut = request.getParameter("checkOut");
		if(cart!=null && cart.size()>0) {
			for(CartItem item:cart.getCartItemsSet()) {//購物車中有多少筆明細讀出來
				String quantity = request.getParameter("quantity"+item.hashCode());
				String delete = request.getParameter("delete"+item.hashCode());
				if(delete==null) {
					if(quantity!=null && quantity.matches("\\d+")) {
						int q =Integer.parseInt(quantity);
						if(q==0) {
							cart.remove(item);
						}else {
							cart.upadte(item, q);//(產品,數量)
						}
					}
				}else {
					cart.remove(item);
				}
			}
		}
		
		//3.外部轉交到cart.jsp
		if(checkOut!=null) {
			response.sendRedirect(request.getContextPath()+"/member/check_out.jsp");
		}else {
			response.sendRedirect(request.getContextPath()+"/member/cart.jsp");
		}
	}

}
