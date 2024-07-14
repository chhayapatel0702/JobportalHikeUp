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

@WebServlet("/update-skill")
public class UpdateSkills extends HttpServlet {
  @Override
protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	  res.setContentType("text/html");
	  try {
      int rid=Integer.parseInt(req.getParameter("rid"));
      String skill1=req.getParameter("sk1");
      String skill2=req.getParameter("sk2");
      String skill3=req.getParameter("sk3");
      String skill4=req.getParameter("sk4");
      String skill5=req.getParameter("sk5");
    
      HttpSession s=req.getSession();
	  User u=(User)s.getAttribute("userobj");
	  u.setId(rid);
	  u.setSkill1(skill1);
	  u.setSkill2(skill2);
	  u.setSkill3(skill3);
	  u.setSkill4(skill4);
	  u.setSkill5(skill5);
	  UserDao dao=new UserDao(DbCon.getConnection());
	  boolean f=dao.editSkills(u);
	  if(f) {
	     	s.setAttribute("succMsg", "Skills Update Sucessfully..");
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
