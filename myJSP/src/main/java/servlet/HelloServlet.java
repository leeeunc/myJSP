package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setAttribute("message", "서블릿 호출!!");
		PrintWriter out = res.getWriter();
		out.print("서블릿 호출");
		
		
		// request영역이 공유가 안됨
		//res.sendRedirect("HelloServlet.jsp");
		
		// request영역이 공유 됨!! (forward)
		req.getRequestDispatcher("HelloServlet.jsp").forward(req, res);
		
	}
	
	public HelloServlet() {
		// TODO Auto-generated constructor stub
	}

}
