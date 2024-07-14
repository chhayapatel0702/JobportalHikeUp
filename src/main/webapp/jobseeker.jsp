<%@page import="connection.DbCon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"  %>

<%  
  User user=(User)request.getSession().getAttribute("userobj");
  List<Vacancy> v=null;
  if(user !=null){
	  request.setAttribute("jobseeker", user);
	  VacancyDao vd=new VacancyDao(DbCon.getConnection());
	  v=vd.getAllVacancyUser(user.getId());
  }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>jobseeker</title>
<%@ include file="includes/head.jsp" %>
  <style type="text/css">
   #abtn{
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
   <c:if test="${not empty AppMsg}">
   <script>
        alert("${AppMsg}");
    </script>
    <c:remove var="AppMsg"/>
 </c:if>
<%@ include file="includes/unavbar.jsp" %>
 <div class="container" style="margin-top: 4rem!important;">
  <div class="row">
  <div class="col-md-4" style="position: fixed">
  <form  class="mt-5" action="sortvacancy.jsp" method="get">
  <div class="form-group">
    <img src="images/pic1.webp" class="img-responsive" width="80%" alt="" style="margin-top:-86px;margin-left: 32px;">
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
       <%
       if(!v.isEmpty()){
    	   for(Vacancy row:v){
       %>
           <div class="card-body" style="background-color: #8080807d">
           <div class="card mx-auto" style="width: 34rem;">
           <div class="card-body">
           <b class="card-title" style="display: inline;">Company name: </b><span><%=row.getCname()%></span><br>
           <span class="card-text"><b>Place: </b><%=row.getPlace() %></span><br>
           <span class="card-text"><b>Title: </b><%=row.getTitle() %></span><br>
           <b>Description: </b><span><%=row.getDesc()%></span><br>
           <span><b>Stipend: Rs. </b><%=row.getSalary()%></span><br>
           <span><b>Start Date: </b><%=row.getSdate() %></span><br>
           <span><b>End Date: </b><%=row.getEdate() %></span><br>
           <a type="submit" class="btn text-white btn-sm btn-block mt-3" id="abtn"  href="next.jsp?vid=<%=row.getVid()%>">Apply</a>
        </div>
       </div>
      </div>
      <%
    	}
    	}
       else{
		 out.print("<h6 align='center'>--There is no job available--</h6>");   
	   }
       %>  
     </div>
    </div>
   </div>
  </div>




<%@ include file="includes/footer.jsp" %>
</body>
</html>