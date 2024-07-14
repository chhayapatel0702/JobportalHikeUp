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


@WebServlet("/updateProfile")
public class AddProfile extends HttpServlet{
  @Override
protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	  res.setContentType("text/html");
	  try {
	  int rid=Integer.parseInt(req.getParameter("rid"));
	  String name=req.getParameter("name1");
	  String clname=req.getParameter("cname");
	  String role=req.getParameter("role1");
	  String photo=req.getParameter("pic");
	  
	  UserDao dao=new UserDao(DbCon.getConnection());
	  HttpSession s=req.getSession();
	  User u=(User)s.getAttribute("userobj");
	  u.setId(rid);
	  u.setName(name);
	  u.setClname(clname);
	  u.setRerole(role);
	  u.setPhoto(photo);
	  boolean f=dao.editProfile(u);
	  if(f) {
	     	s.setAttribute("succMsg", "Profile Update Sucessfully..");
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
