<%@page import="java.util.List"%>
<%@page import="dao.VacancyDao"%>
<%@page import="model.*"%>
<%@page import="connection.DbCon"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"  %>

<%
  UserDao dao=new UserDao(DbCon.getConnection());
  int userCount =dao.countUser();
  int recruiterCount=dao.countRecruiter();
  
  VacancyDao vd=new VacancyDao(DbCon.getConnection());
  List<Vacancy> v=vd.getAllVacancy();
  int countCompany=vd.countCompany();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin</title>
<%@ include file="includes/head.jsp" %>
<style type="text/css">
  #row1 .card{
    margin-top: 74px;
  }
  
  #col1{
    background-color: #e6284a30;
    border: 2px solid #b73d52e8;
  }
  #col2{
    background-color: #0080003b;
    border: 2px solid green;
  }
  #col3{
    background-color: #ffff0059;
    border: 2px solid #9e9e0e;
  }
    #col4{
    background-color: #0000ff54;
    border: 2px solid #53539d;
  }
  
</style>
</head>
<body style="background-color: #8080804f">
   <c:if test="${empty userobj}">
   <c:redirect url="login.jsp"></c:redirect>
   </c:if>
<nav class="navbar navbar-expand-lg navbar-light fixed-top bg-light">
	<div class="container">
		<a class="navbar-brand" href="employer.jsp" style="color: rgb(69, 69, 173);"><i class="bi bi-bar-chart-line-fill"></i><span style="color: rgb(57, 117, 207);">Hike</span>Up</a>
		<ul class="navbar-nav" style="color:#008000b5;font-size: 14px;">
        <i class="bi bi-check-circle-fill"></i>
		<c:if test="${userobj.role eq 'admin'}">
		 <i>${userobj.name}</i>
		</c:if>
		</ul>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">						
				<a class="nav-link" href="log-out"><li class="nav-item"><i class="bi bi-list"></i>Logout</li></a>
            </ul>
       </div>
    </div>
</nav>

<%
  List<User> user=dao.showDetailsUser();

%>
<!-- Modal -->
<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#e6284a30;">
        <h5 class="modal-title" id="exampleModalLabel">Job Seekers Info...</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Profession</th>
    </tr>
  </thead>
  <tbody>
      <%
       if(!user.isEmpty()){
    	   for(User row:user){
       %>
    <tr>
      <td><%=row.getName() %></td>
      <td><%=row.getRerole()%></td>

    </tr>
     <%
    	   }
    	   }
       %>
    
  </tbody>
</table>
      </div>
    </div>
  </div>
</div>


<%
  List<User> recru=dao.showDetailsRecruiter();
%>
<!-- Modal1 -->
<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#0080003b">
        <h5 class="modal-title" id="exampleModalLabel">Recruiters Info...</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
    </tr>
  </thead>
  <tbody>
   <%
       if(!recru.isEmpty()){
    	   for(User row:recru){
       %>
    <tr>
      <td><%=row.getName() %></td>
      <td><%=row.getEmail()%></td>

    </tr>
     <%
    	   }
    	   }
       %>
    </tbody>
  </table>     
      
      </div>
    </div>
  </div>
</div>



<!-- Modal3 -->
<div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color: #ffff0059;">
        <h5 class="modal-title" id="exampleModalLabel">About Vacancies...</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Vacancy</th>
      <th scope="col">Experience Required</th>
    </tr>
  </thead>
  <tbody>
      <%
       if(!v.isEmpty()){
    	   for(Vacancy row:v){
       %>
    <tr>
      <td><%=row.getTitle() %></td>
      <td><%=row.getDesc()%></td>
    </tr>
      <%
    	   }
    	   }
       %>
  </tbody>
</table>
      </div>
    </div>
  </div>
</div>


<!-- Modal4 -->
<div class="modal fade" id="exampleModal4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#0000ff54">
        <h5 class="modal-title" id="exampleModalLabel">Companies Info...</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Company</th>
      <th scope="col">Location</th>
    </tr>
  </thead>
  <tbody>
      <%
       if(!v.isEmpty()){
    	   for(Vacancy row:v){
       %>
    <tr>
      <td><%=row.getCname()%></td>
      <td><%=row.getPlace()%></td>
    </tr>
     <%
    	   }
    	   }
       %>
  </tbody>
</table>
      </div>
    </div>
  </div>
</div>




  <!-- section 2 -->
   <div class="container mt-5">
  <div class="row" id="row1">
  <div class="col-sm-6" >
    <div class="card p-3" id="col1">
      <div class="card-body">
        <h3 class="card-title">Job Seekers</h3>
        <p class="card-text" style="font-size: 18px;">Total No:<%= userCount %></p>
        <button type="button" class="btn btn-primary float-right" style="background-color:#8b233391;border: 2px solid #ce6f7f00;" data-toggle="modal" data-target="#exampleModal1">
        Details
        </button>
      </div>
    </div>
  </div>
  <div class="col-sm-6">
    <div class="card p-3"  id="col2">
      <div class="card-body">
        <h3 class="card-title">Recruiters</h3>
        <p class="card-text" style="font-size: 18px;">Total No:<%=recruiterCount%></p>
                <button type="button" class="btn btn-primary float-right" style="background-color:green;border: 2px solid #ce6f7f00;" data-toggle="modal" data-target="#exampleModal2">
        Details
        </button>
        
      </div>
    </div>
  </div>
</div>
<div class="row mt-3">
  <div class="col-sm-6">
    <div class="card p-3" id="col3">
      <div class="card-body">
        <h3 class="card-title">Vacancies</h3>
        <p class="card-text" style="font-size: 18px;">Total No:<%=v.size()%></p>
        <button type="button" class="btn btn-primary float-right" style="background-color:#9e9e0e;border: 2px solid #ce6f7f00;" data-toggle="modal" data-target="#exampleModal3">
        Details
        </button>
        
      </div>
    </div>
  </div>
  <div class="col-sm-6">
    <div class="card p-3"  id="col4">
      <div class="card-body">
        <h3 class="card-title">Companies</h3>
        <p style="font-size: 18px;" class="card-text">Total No:<%=countCompany%></p>
        <button type="button" class="btn btn-primary float-right" style="background-color:#53539d;border: 2px solid #ce6f7f00;" data-toggle="modal" data-target="#exampleModal4">
        Details
        </button>
        
      </div>
    </div>
  </div>
</div>
</div>


<%@ include file="includes/footer.jsp" %>
</body>
</html>