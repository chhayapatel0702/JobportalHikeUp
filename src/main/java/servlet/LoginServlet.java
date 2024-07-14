package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connection.DbCon;
import dao.UserDao;
import model.User;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet{
  @Override
protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	try(PrintWriter pw=res.getWriter()){
		String username=req.getParameter("uname");
		String password=req.getParameter("pass");
		UserDao udao=new UserDao(DbCon.getConnection());
		User user=udao.userLogin(username, password);
		HttpSession session=req.getSession();
		if("admin123".equals(username)&& "123456".equals(password)) 
		{
			session.setAttribute("userobj", user);
			user.setRole("admin");
			res.sendRedirect("admin.jsp");
		}
	     else if(user!=null) {
			String role = user.getRole(); 
            if (role.equals("Jobseeker")) {
            	session.setAttribute("userobj", user);
                res.sendRedirect("jobseeker.jsp");
            } else {
            	session.setAttribute("userobj", user);
                res.sendRedirect("employer.jsp");
            }
		}
		else {
			session.setAttribute("logMsg", "Invalid Email & Password...");
            res.sendRedirect("login.jsp");
			
		}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}
