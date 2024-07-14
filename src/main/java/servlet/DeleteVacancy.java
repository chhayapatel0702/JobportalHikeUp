package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connection.DbCon;
import dao.VacancyDao;

@WebServlet("/delete")
public class DeleteVacancy extends HttpServlet {
  @Override
protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	try {
		int id=Integer.parseInt(req.getParameter("vid"));
		
		VacancyDao dao=new VacancyDao(DbCon.getConnection());
		boolean f=dao.deleteVacancy(id);
		
		HttpSession s=req.getSession();
		if(f) {
			s.setAttribute("succMsg", "Job Delete Sucessfully..");
			res.sendRedirect("employer.jsp");
		}
		else {
			s.setAttribute("succMsg", "Something wrong on server");
			res.sendRedirect("employer.jsp");
		}
			
		
		
		
		
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
}
