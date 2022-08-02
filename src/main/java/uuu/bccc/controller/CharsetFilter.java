package uuu.bccc.controller;

import java.io.IOException;
import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class CharsetFilter
 */
@WebFilter(
		dispatcherTypes = {DispatcherType.REQUEST ,DispatcherType.ERROR}
					, 
		urlPatterns = { 
				"*.do", 
				"*.jsp"
		})
public class CharsetFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CharsetFilter() {
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		request.getParameterNames();//鎖定request的編碼
		
		response.setCharacterEncoding("UTF-8");
		response.getWriter();
		chain.doFilter(request, response);//交給下一棒
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
