package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connection.DbCon;
import dao.UserDao;
import model.User;

@WebServlet("/editcourse")
public class CourseEdit extends HttpServlet {
  @Override
protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	  try {
		     int rid=Integer.parseInt(req.getParameter("rid"));
		     String c1=req.getParameter("c1");
		     String c2=req.getParameter("c2");
		     String c3=req.getParameter("c3");
		   
		     HttpSession s=req.getSession();
			 User u=(User)s.getAttribute("userobj");
			  u.setId(rid);
			  u.setCerti1(c1);
			  u.setCerti2(c2);
			  u.setCerti3(c3);
			  
			  UserDao dao=new UserDao(DbCon.getConnection());
			  boolean f=dao.editCourse(u);
			  if(f) {
			     	s.setAttribute("succMsg", "Course/Certificate Information Update Sucessfully..");
					res.sendRedirect("resume.jsp");
				}
				else {
					s.setAttribute("succMsg", "Something wrong on server");
					res.sendRedirect("resume.jsp");
				}
			  
				  
			  }catch (Exception e) {
				e.printStackTrace();
			}
			  
}
}
