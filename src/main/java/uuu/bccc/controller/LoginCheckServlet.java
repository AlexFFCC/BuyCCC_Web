package uuu.bccc.controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.bccc.entity.Customer;

/**
 * Servlet Filter implementation class LoginCheckServlet
 */
@WebFilter("/member/*")
public class LoginCheckServlet implements Filter {

    /**
     * Default constructor. 
     */
    public LoginCheckServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpReq = (HttpServletRequest)request;
		HttpServletResponse httpRes = (HttpServletResponse)response;
		HttpSession session = httpReq.getSession();
		Customer member = (Customer) session.getAttribute("member");
		
		if(member==null) {
			session.setAttribute("previous.uri", httpReq.getRequestURI());
			session.setAttribute("previous.querystring", httpReq.getQueryString());
			httpRes.sendRedirect(httpReq.getContextPath()+"/login.jsp");
			return;
		}else {
			chain.doFilter(request, response);
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
