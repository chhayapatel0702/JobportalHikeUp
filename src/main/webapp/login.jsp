<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"  %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login</title>
<%@ include file="includes/head.jsp" %>
</head>
<body>
<%@ include file="includes/navbar.jsp" %>
 
  <div class="container">
  <div class="card w-50 mx-auto my-5 bg-light mt-5" style="margin-top: 7rem!important;" id="logcard1">
  <h4 class="text-center p-4" id="log1">LOGIN</h4>
  <c:if test="${not empty logMsg }">
  <div class="alert alert-secondary text-danger" role="alert">${logMsg}</div>
  <c:remove var="logMsg"/>
  </c:if>
  <form action="user-login" method="post">
  <div class="col-auto m-4">
      <label class="sr-only" for="inlineFormInputGroup">Username</label>
      <div class="input-group mb-2">
        <div class="input-group-prepend">
          <div class="input-group-text"><i class="bi bi-person-fill"></i></div>
        </div>
        <input type="text" name="uname" class="form-control" id="inlineFormInputGroup" placeholder="Username">
      </div>
    </div>
    <div class="col-auto m-4 mb-5">
      <label class="sr-only" for="inlineFormInputGroup">Password</label>
      <div class="input-group mb-2">
        <div class="input-group-prepend">
          <div class="input-group-text"><i class="bi bi-funnel-fill"></i></div>
        </div>
        <input type="password" name="pass" class="form-control" id="inlineFormInputGroup" placeholder="Password">
      </div>
    </div>
    <div class="col-auto m-4">
    <button type="submit" class="btn btn-primary btn-lg btn-block" id="logbtn">log in</button>
    </div>
    <div class="col-auto m-4 mb-5 pb-5">
    <p class="text-center" >Don't have an account? <a href="">Sign up</a></p>
    </div>
    
  </form>
  
  
  
  
  </div>
  </div>


<%@ include file="includes/footer.jsp" %>
</body>
</html>