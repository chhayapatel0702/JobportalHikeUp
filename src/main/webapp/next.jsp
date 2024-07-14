<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.*" %>
<%@ page import="dao.*" %>
<%@page import="connection.DbCon"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>applying</title>
<%@ include file="includes/head.jsp" %>
</head>
<style>
 #form{
    width: 52rem;
    margin-top: 120px;
    padding: 50px;
    border: 1px solid #b6babe;
 }
</style>
<body style="background-color: #8080807d">
 <c:if test="${empty userobj}">
 <c:redirect url="login.jsp"></c:redirect>
 </c:if>
  
 <%
  int vid=Integer.parseInt(request.getParameter("vid"));
  VacancyDao dao=new VacancyDao(DbCon.getConnection());
  Vacancy c=dao.getVacancyById(vid);
  %>
<%@ include file="includes/unavbar.jsp" %>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <c:if test="${not empty logMsg }">
  <div class="alert alert-secondary text-danger" role="alert">${logMsg}</div>
  <c:remove var="logMsg"/>
  </c:if>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<div class="container mt-5">
<form action="appliedvac" method="post" id="form" class="mx-auto" style="background-color:white">
<input type="hidden" value="${userobj.id}" name="uid" >
<div class="form-group">
    <input type="text" class="form-control" value="${userobj.name}" name="uname" readonly id="formGroupExampleInput" placeholder="Example input">
  </div>
<input type="hidden" value="${userobj.email}" name="email" >
<input type="hidden" value="<%=c.getVid()%>" name="vid" >
<input type="hidden" value="<%=c.getCname()%>" name="comname">
<input type="hidden" value="<%=c.getTitle()%>" name="jobrole1">
<input type="hidden" value="<%=c.getPlace()%>" name="loc">
<input type="hidden" value="<%=c.getPostid()%>" name="eid">
 <div class="form-group">
    <label for="exampleFormControlTextarea1">Your Description/Suggestion</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" required rows="5"  name="sqlField" style="font-size: 14px" placeholder="Write something here...."></textarea>
  </div>
<div class="form-group">
      <label for="exampleFormControlTextarea1">Available for work</label>
     <select class="custom-select" name="avail">
     <option value="Full-Time">Full Time</option>
     <option value="Part-Time">Part Time</option>
</select>
</div>
<button class="btn text-white float-right" type="submit" style="background-color: rgb(57, 117, 207);" id="exampleModal">Submit</button>
</form>
</div>
<%@ include file="includes/footer.jsp" %>
</body>
</html>