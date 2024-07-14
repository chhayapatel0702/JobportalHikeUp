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
import dao.AppliedVacancyDao;
import model.AppliedVacancy;

@WebServlet("/appliedvac")
public class AppliedVacancyServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter pw=res.getWriter();
		try 
		{
			int vid=Integer.parseInt(req.getParameter("vid"));
			int postid=Integer.parseInt(req.getParameter("eid"));
			String company=req.getParameter("comname");
			String jobrole=req.getParameter("jobrole1");
			String location=req.getParameter("loc");
			String description=req.getParameter("sqlField");
			String avail=req.getParameter("avail");
			int uid=Integer.parseInt(req.getParameter("uid"));
			String uname=req.getParameter("uname");
			String email=req.getParameter("email");
			
			HttpSession s=req.getSession();
			AppliedVacancyDao dao=new AppliedVacancyDao(DbCon.getConnection());
			AppliedVacancy a=new AppliedVacancy();
			a.setVid(vid);
			a.setPostid(postid);
			a.setCompany(company);
			a.setJobrole(jobrole);
			a.setLocation(location);
			a.setDescr(description);
			a.setAvail(avail);
			a.setUid(uid);
			a.setJobseekname(uname);
			a.setEmail(email);
			boolean f=dao.addAppliedApplication(a);
			if(f) {
				s.setAttribute("AppMsg", "Applied Sucessfully..");
				res.sendRedirect("jobseeker.jsp");
			}
			else {
				s.setAttribute("AppMsg", "Something wrong on server");
				res.sendRedirect("next.jsp");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
