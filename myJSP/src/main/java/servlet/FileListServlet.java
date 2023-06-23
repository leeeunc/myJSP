package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fileupload.FileDao;

@WebServlet("/")
public class FileListServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setAttribute("File", "파일서블릿호출");
		PrintWriter out = res.getWriter();
		out.print("file서블릿호출");
		


		
		
		
	}
	
	public FileListServlet() {
		// TODO Auto-generated constructor stub
	}

}
