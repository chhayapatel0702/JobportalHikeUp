package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/log-out")
public class LogoutServlet extends HttpServlet{
  @Override
protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	res.setContentType("text/html");
	
	HttpSession s=req.getSession();
	s.removeAttribute("userobj");
	
	s.setAttribute("logMsg", "Logout Successfully...");
	res.sendRedirect("login.jsp");
}
}
