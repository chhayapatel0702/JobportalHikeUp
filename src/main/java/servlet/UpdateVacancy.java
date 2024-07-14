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
import dao.VacancyDao;
import model.Vacancy;

@WebServlet("/update-job")
public class UpdateVacancy extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			PrintWriter pw=res.getWriter();
			int id=Integer.parseInt(req.getParameter("vid"));
			String cname=req.getParameter("cname");
			String title=req.getParameter("title");
			String place=req.getParameter("place");
			String desc=req.getParameter("desc");
			int sal=Integer.parseInt(req.getParameter("sal"));
			String sdate=req.getParameter("sdate");
			String edate=req.getParameter("edate");
			String status=req.getParameter("status");
			
			Vacancy v=new Vacancy();
			v.setVid(id);
			v.setCname(cname);
			v.setTitle(title);
			v.setPlace(place);
			v.setDesc(desc);
			v.setSalary(sal);
			v.setSdate(sdate);
			v.setEdate(edate);
			v.setStatus(status);
			
			HttpSession s=req.getSession();
			VacancyDao dao=new VacancyDao(DbCon.getConnection());
			boolean f=dao.updateVacancy(v);
			if(f) {
				s.setAttribute("succMsg", "Job Update Sucessfully..");
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
