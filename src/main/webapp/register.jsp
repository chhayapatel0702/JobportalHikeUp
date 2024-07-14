<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<%@ include file="includes/head.jsp" %>
<style type="text/css">
 .Printerror{
 color:red;
 font-size: 14px;
 font-style:italic;

 }
</style>
</head>
<body>
<%@ include file="includes/navbar.jsp" %>
<div class="container" style="margin-top: 4rem!important;">
  <div class="col-3 float-left my-5 mt-5 pt-5 ">
  <img alt="" src="images/res2.png" class="img-fluid" width=300px>
   <div class="text-center">
     <small>By signing up, you agree to our Terms, Privacy Policy and Cookies Policy.</small>
   </div>
  </div>
  <div class="card float-right my-5 bg-light p-4 "  id="rescard1">
  <h4 class="text-center text-primary pb-3">Sign Up</h4>
 <c:if test="${not empty regmsg }">
  <div class="alert alert-secondary text-success" role="alert">${regmsg}</div>
  <c:remove var="regmsg"/>
  </c:if>
  <form action="sign-up" name="regForm" method="post" onsubmit="return validationForm()">
   <div class="form-group row ps-5 mb-2">
    <label for="inputName" class="col-sm-2 col-form-label">Name:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="name1" id="inputName"  placeholder="Your Name Here...">
      <span id="error1" class="Printerror"></span>
    </div>
   </div>
   <div class="form-group row ps-5 mb-2">
    <label for="inputUName" class="col-sm-2 col-form-label">Username:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="uname" id="inputUName"  placeholder="Choose a username">
    <span id="error2" class="Printerror"></span>
    </div>
   </div>
    <div class="form-group row ps-5 mb-2">
    <label for="inputEmail" class="col-sm-2 col-form-label">Email:</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" name="email" id="inputEmail"  placeholder="Email">
    <span id="error3" class="Printerror"></span>
    </div>
   </div>
   <div class="form-group row mb-2">
    <label for="pass" class="col-sm-2 col-form-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="pass" name="password"  placeholder="Password">
       <span id="error4" class="Printerror"></span>
    </div>
  </div>
  <fieldset class="form-group mb-2">
    <div class="row">
      <div class="col-form-label col-sm-2 pt-0"></div>
      <div class="col-sm-10">
        <div class="form-check">
          <input class="form-check-input" type="radio" checked name="gridRadios" id="gridRadios1" value="Jobseeker">
          <label class="form-check-label" for="gridRadios1">
            Jobseeker
          </label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="Recruiter">
          <label class="form-check-label" for="gridRadios2">
            Recruiter
          </label>
        </div>
      </div>
    </div>
  </fieldset>
  <div class="form-group row">
   <div class="col-form-label col-sm-2 pt-0"></div>
      <div class="col-sm-10">
      <button type="submit" class="btn btn-primary btn-lg btn-block" id="resbtn">Register</button>
      </div>
      
   </div>
  </form>
  
  
  </div>
 </div>
 
 
 <%@ include file="includes/footer.jsp" %>
 <script type="text/javascript">


 function validationForm(){

	    var name=document.getElementById('inputName').value;
	    var username=document.getElementById('inputUName').value;
	    var email=document.getElementById('inputEmail').value;
	    var password=document.getElementById('pass').value;
	    
	    if(name==""){
	        document.getElementById('error1').innerHTML="*Please fill the name field";
	        return false;
	    }
       if(!isNaN(name)) {
    	    document.getElementById('error1').innerHTML="*Name must contain only letters";
	        return false;
	   }
       if(username==""){
	        document.getElementById('error2').innerHTML="*Please fill the username field";
	        return false;
	    }
       if(!/^[a-zA-Z]+$/.test(username)){
	        document.getElementById('error2').innerHTML="*UserName must contain only letters";
	        return false;
	    }
       if(email==""){
	        document.getElementById('error3').innerHTML="*Please fill the email field";
	        return false;
	    }
       if (password== "") {
           document.getElementById('error4').innerHTML = "*Please fill the password field";
           return false;
       }
       if ((password.length<6)) {
           document.getElementById('error4').innerHTML = "*Length must be more than 6 characters ";
           return false;
       }
       if (!/[A-Z]/.test(password)) {
           document.getElementById('error4').innerHTML = "*Password must contain at least one uppercase letter";
           return false;
       }
       if (!/\d/.test(password)) {
           document.getElementById('error4').innerHTML = "*Password must contain at least one number";
           return false;
       }
       if (!/[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(password)) {
           document.getElementById('error4').innerHTML = "*Password must contain at least one symbol";
           return false;
       }
       return true;
       
	}

 </script>
</body>
</html>