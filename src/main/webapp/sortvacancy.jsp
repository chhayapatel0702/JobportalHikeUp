<%@page import="connection.DbCon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"  %>
<%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Jobseeker</title>
<%@ include file="includes/head.jsp" %>
  <style type="text/css">
   #abtn{
    font-size: 14px;
    padding: 4px;
    background-color: rgb(57, 117, 207);
   }
    #search
    {
    font-size: 16px;
    padding: 4px;
    background-color: rgb(57, 117, 207);
    align-items: center;
    }
  </style>
</head>
<body style="background-color: #8080807d">
  <c:if test="${empty userobj}">
   <c:redirect url="login.jsp"></c:redirect>
   </c:if>
<%@ include file="includes/unavbar.jsp" %>
 <div class="container" style="margin-top: 4rem!important;">
  <div class="row">
  <div class="col-md-4" style="position: fixed">
   <%
   User user=(User)request.getSession().getAttribute("userobj");
   String skill=request.getParameter("skill");
   String experi=request.getParameter("exp");
   String loc=request.getParameter("loc");
   String msg="";
   
   VacancyDao dao1=new VacancyDao(DbCon.getConnection());
   List<Vacancy> list=null;
   if("sk".equals(skill) || "loca".equals(loc) ||  "expe".equals(experi))
   {  request.setAttribute("jobseeker", user);
	  list=dao1.getAllVacancyUserOR(user.getId(),skill, loc, experi); 
   }
   else{
	   request.setAttribute("jobseeker", user);
	   list=dao1.getAllVacancyUserAND(user.getId(),skill, loc, experi);
   }
   %>
   <img alt="" src="">
   <form  class="mt-5" action="sortvacancy.jsp" method="get">
  <div class="form-group">
    <img src="images/pic1.webp" class="img-responsive" width="80%" alt="" style="margin-top:-105px;margin-left: 32px;">
    <p style="margin-top:-52px;font-size:15px;text-align: center;font-family: cursive;">Please provide your preferred skill, location,and experience level for job search below...</p>
    <select class="custom-select" name="skill" required>
    <option selected value="sk">Select Skills</option>
    <option value="Java Developer">Java Developer</option>
    <option value="Web Designer">Web Designer</option>
    <option value="Excel">Excel</option>
    <option value="Accountant">Accountant</option>
  </select>
  </div>
  <div class="form-group">
  <select class="custom-select" name="exp" required>
  <option selected value="expe">Select Experience</option>
    <option value="Fresher">Fresher</option>
    <option value="1 Year Experience">1 Year Experience</option>
    <option value="2 Year Experience">2 Year Experience</option>
    <option value="3 Year Experience">3 Year Experience</option>
    <option value="More Year Experience">More than 3 Year Experience</option>
  </select>
  </div>
  <div class="form-group">
    <select class="custom-select" name="loc" required>
    <option selected value="loca">Select Location</option>
    <option value="Thane">Thane</option>
    <option value="Dombivali">Dombivali</option>
    <option value="Parel">Parel</option>
    <option value="Andheri">Andheri</option>
    <option value="Delhi">Delhi</option>
    <option value="Navi Mumbai">Navi Mumbai</option>
    <option value="Nahur">Nahur</option>
  </select>
  </div>
  <div class="form-group" style="margin-left:151px">
  <button class="btn btn-primary" id="search" type="submit">Search</button>
  </div>
</form>
  </div>
    <div class="col-md-4" style="margin-left: 496px;">
     <div class="card" style="width:38rem">
      <div class="card-header text-center" style="background-color:#8080809e;"><h5>Available Vacancies</h5></div>
      <%if(list.isEmpty()){
    	  %>
    	  <h6 align="center">--There is no job available in our search--</h6>
    	  <% 
      } %>
       <%
       if(list !=null){
    	   for(Vacancy v1:list){
       %>
           <div class="card-body" style="background-color: #8080807d">
           <div class="card mx-auto" style="width: 34rem;">
           <div class="card-body">
           <b class="card-title" style="display: inline;">Company name: </b><span><%=v1.getCname()%></span><br>
           <span class="card-text"><b>Place: </b><%=v1.getPlace() %></span><br>
           <span class="card-text"><b>Title: </b><%=v1.getTitle() %></span><br>
           <b>Description: </b><span><%=v1.getDesc()%></span><br>
           <span><b>Stipend: Rs. </b><%=v1.getSalary()%></span><br>
           <span><b>Start Date: </b><%=v1.getSdate() %></span><br>
           <span><b>End Date: </b><%=v1.getEdate() %></span><br>
          <a type="submit" class="btn text-white btn-sm btn-block mt-3" id="abtn"  href="next.jsp?vid=<%=v1.getVid()%>">Apply</a>
        </div>
       </div>
      </div>
      <%
    	}
    	}
       %>  
     </div>
    </div>
   </div>
  </div>




<%@ include file="includes/footer.jsp" %>
</body>
</html>