<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*" %>
<%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<%@page import="connection.DbCon"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>received application</title>
<%@ include file="includes/head.jsp" %>
<style type="text/css">

 .form-control {
       margin-top: -10px;
}
.form-group {
    margin-bottom: 12px;
}
  #abtn{
    font-size: 14px;
    padding: 4px;
    background-color: rgb(57, 117, 207);
   }
</style>
</head>
<body>
  <c:if test="${empty userobj}">
   <c:redirect url="login.jsp"></c:redirect>
   </c:if>

<% 
User user=(User)request.getSession().getAttribute("userobj");
List<AppliedVacancy> v=null;
if(user !=null){
request.setAttribute("recruiter", user);
AppliedVacancyDao dao=new AppliedVacancyDao(DbCon.getConnection());
v=dao.getApplication(user.getId());
}

%>
<%@ include file="includes/enavbar.jsp" %>
  <div class="container" style="margin-top: 5rem!important;">
  <span class="text-secondary"><h5>Total Application Received:<%=v.size()%> </h5></span>
  <table class="table table-striped">
  <thead>
    <tr class="table-primary">
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Title</th>
      <th scope="col">Available</th>
      <th scope="col">Description</th>
      
    </tr>
  </thead>
  <tbody>
     <%
       if(!v.isEmpty()){
    	   for(AppliedVacancy row:v){
       %>
   
    <tr>
      <td><%=row.getJobseekname() %></td>
      <td><%=row.getEmail() %></td>
      <td><%=row.getJobrole() %></td>
      <td><%=row.getAvail() %></td>
      <td style="width:199px"><%=row.getDescr() %></td>
    </tr>
     <%
    	   }
    	   }
       else{%>
        <tr>
		  <td colspan=5> <h5>No application...</h5></td>
		</tr>   
	  <%}
       %>
  </tbody>
</table>
  </div>
<%@ include file="includes/footer.jsp" %>
</body>
</html>