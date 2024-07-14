<%@page import="com.mysql.cj.result.Row"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"  %>
<%@page import="connection.DbCon"%>


<% 
User user=(User)request.getSession().getAttribute("userobj");
List<Vacancy> v=null;
if(user !=null){
request.setAttribute("recruiter", user);
VacancyDao vd=new VacancyDao(DbCon.getConnection());
v=vd.getAllVacancyRUser(user.getId());
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>edit vacancy</title>
<%@ include file="includes/head.jsp" %>
<style type="text/css">
 body
   {
     background-color:#827b7b4f;
   }
 .form-control {
       margin-top: -10px;
}
.form-group {
    margin-bottom: 12px;
}
  #updatebtn{
    font-size: 14px;
    padding: 6px;
    background-color: rgb(57, 117, 207);
   }
 
</style>
</head>
<body>
   <c:if test="${empty userobj}">
   <c:redirect url="login.jsp"></c:redirect>
   </c:if>
<%@ include file="includes/enavbar.jsp" %>
 <div class="container mt-3" style="margin-top: 4rem!important;position:sticky">
 <div class="row">
  <div class="col-6 ps-5" style="position: fixed;margin-left: -32px;">
  
  <%
  int vid=Integer.parseInt(request.getParameter("vid"));
  VacancyDao dao=new VacancyDao(DbCon.getConnection());
  Vacancy c=dao.getVacancyById(vid);
  %>
  <h4 class="text-center">Edit vancany</h4>
  <form action="update-job" method="post">
  <input type="hidden" value="<%=c.getVid()%>" name="vid">
  <div class="form-group">
    <label for="exampleInputName">Company Name:</label>
    <input type="text" class="form-control" name="cname" id="exampleInputName" value="<%=c.getCname()%>" required>
  </div>
  <div class="form-group">
    <label for="exampleInputTitle">Title:</label>
    <input type="text" class="form-control" name="title" id="exampleInputTitle" value="<%=c.getTitle() %>" required>
  </div>
   <div class="form-group">
    <label for="exampleInputPlace">Place:</label>
    <input type="text" class="form-control" name="place" id="exampleInputPlace" value="<%=c.getPlace() %>" required>
  </div>
  <div class="form-group">
    <label for="exampleInputDesc">Description:</label>
    <input type="text" class="form-control" name="desc" value="<%=c.getDesc()%>" id="exampleInputDesc" required>
  </div>
  <div class="form-group">
    <label for="exampleInputStip">Stipend:</label>
    <input type="text" class="form-control" name="sal" id="exampleInputStip" value="<%=c.getSalary()%>" required>
  </div>
   <div class="form-group">
    <label for="exampleInputStip1" style="margin-bottom: -12px;">Status:</label>
    <select class="custom-select" name="status" class="form-control" id="exampleInputStip1">
    <option value="<%=c.getStatus()%>"><%=c.getStatus()%></option>
    <option value="Active">Active</option>
    <option value="InActive">InActive</option>
    </select>
  </div>
  <div class="row">
    <div class="col">
   <div class="form-group">
    <label for="exampleInputSDate">Start Date:</label>
    <input type="date" class="form-control" name="sdate" value="<%=c.getSdate() %>" id="exampleInputSDate" style="font-size: 15px;" required>
  </div>
    </div>
    <div class="col">
     <div class="form-group">
    <label for="exampleInputEDate">End Date:</label>
    <input type="date" class="form-control" name="edate" value="<%=c.getEdate() %>" id="exampleInputEDate" style="font-size: 15px;" required>
    </div>
    </div>
    <input type="hidden" value="${userobj.id}" name="id">
  </div>
  <button type="submit" class="btn text-white btn-lg btn-block" id="updatebtn">Update Job</button>
</form>

  </div>
  <div class="col-6 ps-5" style="margin-left: 641px ">
  <h4 class="text-center">Vacancy Posted</h4>
       <%
       if(!v.isEmpty()){
    	   for(Vacancy row:v){
       %>
   
     <div class="card mb-2" style="width: 32rem;">
        <div class="card-body">
           <b class="card-title" style="display: inline;">Company name: </b><span><%=row.getCname()%></span><br>
           <span class="card-text"><b>Place: </b><%=row.getPlace() %></span><br>
           <span class="card-text"><b>Title: </b><%=row.getTitle() %></span><br>
           <b>Description:</b><span><%=row.getDesc()%></span><br>
           <span><b>Stipend: Rs.</b><%=row.getSalary()%></span><br>
           <span><b>Start Date: </b><%=row.getSdate() %></span><br>
           <span><b>End Date: </b><%=row.getEdate() %></span>
           <button type="button" class="btn btn-secondary  btn-sm float-right ml-2"><a class="text-white" href="delete?vid=<%=row.getVid()%>">Delete</a></button>
           <button type="submit" class="btn btn-primary btn-sm float-right text-white" style="background-color: rgb(57, 117, 207);"><a class="text-white" href="edit_vacancy.jsp?vid=<%=row.getVid()%>">Edit</a></button><br>
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