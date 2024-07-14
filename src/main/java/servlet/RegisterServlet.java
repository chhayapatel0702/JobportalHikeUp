 package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connection.DbCon;
import dao.UserDao;
import model.User;


@WebServlet("/sign-up")
public class RegisterServlet extends HttpServlet {
   @Override
protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	res.setContentType("text/html");
	try {
	PrintWriter pw=res.getWriter();
	String name=req.getParameter("name1");
	String uname=req.getParameter("uname");
	String email=req.getParameter("email");
	String password=req.getParameter("password");
	String role=req.getParameter("gridRadios");
	
	UserDao dao=new UserDao(DbCon.getConnection());
	User u=new User();
	u.setName(name);
	u.setUsername(uname);
	u.setEmail(email);
	u.setPassword(password);
	u.setRole(role);
	
	boolean f=dao.addUser(u);
	HttpSession session=req.getSession();
	  if(f)
	  {
		  session.setAttribute("regmsg", "Registration Successfully... Login_<a href='login.jsp'><span style='color:purple'>Click here</span></a>");
		 res.sendRedirect("register.jsp");
	  }
	  else
	  {
		 session.setAttribute("regmsg", "Something Went Wrong Server Choose Another Username");
		res.sendRedirect("register.jsp");
	  }
	  
	}
	
	  catch (Exception e) {
		// TODO: handle exception
	}
   }

}
