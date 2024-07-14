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
<title>Resume</title>
<%@ include file="includes/head.jsp" %>
<style type="text/css">
#s1{
    font-size: 20px;
    font-weight: 350;
    text-shadow: 1px 1px 2px #5a5aa3;
}
.ski{
    background-color: #808080;
    padding: 7px;
    color: white;
    border-radius: 20px;
    font-family: monospace;
    margin-right: 15px;
}
.skil{
    background-color: #808080d4;
    padding: 7px;
    color: white;
    border-radius: 4px;
    font-family: monospace;
}
</style>

</head>
<body style="background-color: #8080807d">
  <c:if test="${empty userobj}">
  <c:redirect url="login.jsp"></c:redirect>
   </c:if>
   
<% 
User user=(User)request.getSession().getAttribute("userobj");
List<AppliedVacancy> v=null;
if(user !=null){
request.setAttribute("jobseeker", user);
AppliedVacancyDao dao=new AppliedVacancyDao(DbCon.getConnection());
v=dao.getApplicationUser(user.getId());

}

%>
<%@ include file="includes/unavbar.jsp" %>
<!-- Modal 1 -->
<c:if test="${not empty succMsg}">
   <script>
        alert("${succMsg}");
    </script>
    <c:remove var="succMsg"/>
 </c:if>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit Profile</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form action="updateProfile" method="post">
      <input type="hidden" value="${userobj.id}" name="rid">
      <div class="form-group">
      <label for="exampleFormControlFile1">Your Photo here...</label><br>
      <input type="file" name="pic" value="<%=user.getPhoto()%>" class="form-control-file-sm" id="exampleFormControlFile1">
      </div>
      <div class="input-group input-group-sm mb-3">
      <div class="input-group-prepend">
      <span class="input-group-text" id="inputGroup-sizing-sm">Full Name</span>
      </div>
      <input type="text" value="${userobj.name}" name="name1" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
      </div>
      <div class="input-group input-group-sm mb-3">
      <div class="input-group-prepend">
      <span class="input-group-text" id="inputGroup-sizing-sm">College Name</span>
      </div>
      <input type="text" class="form-control" value="${userobj.clname}" name="cname"  aria-label="Small" aria-describedby="inputGroup-sizing-sm">
      </div>
      <div class="input-group input-group-sm mb-3">
      <div class="input-group-prepend">
      <span class="input-group-text" id="inputGroup-sizing-sm">Your role</span>
      </div>
      <input type="text" class="form-control" value="${userobj.rerole}" name="role1" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
      </div> 
</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-sm text-white" style="background-color: rgb(57, 117, 207);">Save changes</button>
      </div>
   </form>      
    </div> 
  </div>
</div>

<!-- Modal 2 -->
<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel1">Edit Skills</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form action="update-skill" method="post">
      <input type="hidden" value="${userobj.id}" name="rid">
      <div class="input-group input-group-sm mb-3">
      <div class="input-group-prepend">
      <span class="input-group-text" id="inputGroup-sizing-sm"><i class="bi bi-plus"></i>Skill</span>
      </div>
      <input type="text" class="form-control" value="${userobj.skill1}" name="sk1" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
      </div>
      <div class="input-group input-group-sm mb-3">
      <div class="input-group-prepend">
      <span class="input-group-text" id="inputGroup-sizing-sm"><i class="bi bi-plus"></i>Skill</span>
      </div>
      <input type="text" class="form-control" value="${userobj.skill2}" name="sk2" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
      </div>
      <div class="input-group input-group-sm mb-3">
      <div class="input-group-prepend">
      <span class="input-group-text" id="inputGroup-sizing-sm"><i class="bi bi-plus"></i>Skill</span>
      </div>
      <input type="text" class="form-control" value="${userobj.skill3}" name="sk3" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
      </div>
      <div class="input-group input-group-sm mb-3">
      <div class="input-group-prepend">
      <span class="input-group-text" id="inputGroup-sizing-sm"><i class="bi bi-plus"></i>Skill</span>
      </div>
      <input type="text" class="form-control" value="${userobj.skill4}" name="sk4" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
      </div>
      <div class="input-group input-group-sm mb-3">
      <div class="input-group-prepend">
      <span class="input-group-text" id="inputGroup-sizing-sm"><i class="bi bi-plus"></i>Skill</span>
      </div>
      <input type="text" class="form-control" value="${userobj.skill5}" name="sk5" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
        <button type="submit" class="btn text-white btn-sm" style="background-color: rgb(57, 117, 207);">Save changes</button>
      </div>
      </form>
    </div>
  </div>
</div>

<!-- Modal 3 -->
<div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel3">Edit Course/Certificate</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form action="editcourse" method="post">
       <input type="hidden" value="${userobj.id}" name="rid">
      <div class="input-group input-group-sm mb-3">
      <div class="input-group-prepend">
      <span class="input-group-text"  id="inputGroup-sizing-sm"><i class="bi bi-plus"></i>Certificate</span>
      </div>
      <input type="text" class="form-control" value="${userobj.certi1}" name="c1" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
      </div>
       <div class="input-group input-group-sm mb-3">
      <div class="input-group-prepend">
      <span class="input-group-text" id="inputGroup-sizing-sm"><i class="bi bi-plus"></i>Certificate</span>
      </div>
      <input type="text" class="form-control" value="${userobj.certi2}" name="c2" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
      </div>
       <div class="input-group input-group-sm mb-3">
      <div class="input-group-prepend">
      <span class="input-group-text" id="inputGroup-sizing-sm"><i class="bi bi-plus"></i>Certificate</span>
      </div>
      <input type="text" class="form-control" value="${userobj.certi3}" name="c3" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
        <button type="submit" class="btn text-white btn-sm" style="background-color: rgb(57, 117, 207);">Save changes</button>
       </form>
      </div>
    </div>
  </div>
</div>

<div class="container-fluid">
   <div class="row">
    <div class="col-md-6" style="position: fixed;">
    <div class="card mb-2" style="width: 50rem;margin-top: 70px;" >
        <div class="card-body">
          <div class="row">
          <div class="col-3-mb pl-4">
          <img src="images/profile-img/<%=user.getPhoto()%>" class="img-responsive rounded-circle" style="height: 163px;width: 170px">
          </div>
          <div class="col-6-mb pt-4 pl-4">
          <h1 class="card-title">${userobj.name}</h1>
          <span class="card-text" id="s1">${userobj.clname}</span><br>
          <i class="card-text" style="color: grey;"><i class="bi bi-pencil-square"></i> ${userobj.rerole}</i><br>
        </div>
      </div>
         <!-- Button trigger modal -->
<button type="button" class="btn btn-primary text-white float-right btn-sm" data-toggle="modal" data-target="#exampleModal" style="background-color: rgb(57, 117, 207);">
  Edit
</button>
        </div>
      </div>
      <div class="card mb-2 " style="width: 50rem;">
        <div class="card-body">
          <h5 class="card-title">Skills:</h5>
          <span class="card-text ski">${userobj.skill1}</span>
          <span class="card-text ski">${userobj.skill2}</span>
          <span class="card-text ski">${userobj.skill3}</span>
          <span class="card-text ski">${userobj.skill4}</span>
          <span class="card-text ski">${userobj.skill5}</span><br>  
    <button type="button" class="btn btn-primary text-white float-right btn-sm" data-toggle="modal" data-target="#exampleModal1" style="background-color: rgb(57, 117, 207);">
     Edit
    </button>

        </div>
      </div>
      <div class="card mb-2" style="width: 50rem;">
        <div class="card-body">
          <h5 class="card-title">Course (Certification):</h5>
          <span class="card-text skil">${userobj.certi1}</span><br><br>
          <span class="card-text skil">${userobj.certi2}</span><br><br>
          <span class="card-text skil">${userobj.certi3}</span>
         <!-- Button trigger modal -->
<button type="button" class="btn btn-primary text-white float-right btn-sm" data-toggle="modal" data-target="#exampleModal3" style="background-color: rgb(57, 117, 207);">
  Edit
</button>


        </div>
      </div> 
     </div> 
   
   <div class="col-md-3 mt-5 mb-2" style="margin-left: 173px">
      <div class="card mt-4" style="width: 27rem;margin-left: 634px;">
  <div class="card-header text-white" style="background-color: rgb(57, 117, 207);">
   Your Applied Application ...
  </div>
 <table class="table table-sm">
  <thead>
    <tr>
      <th scope="col">Company</th>
      <th scope="col">Job Role</th>
      <th scope="col">Location</th>
    </tr>
  </thead>
  <tbody>
   <%
    if(!v.isEmpty()){
    for(AppliedVacancy a:v){
    %>
    <tr>
      <td><%=a.getCompany()%></td>
      <td><%=a.getJobrole()%></td>
      <td><%=a.getLocation()%></td>
    </tr>
     <%
     }
    }else{
    	%>
    	<tr>
    	<td>not applied form..</td>
    	</tr>
   <% }
    
    %>
    
  </tbody>
</table>
</div>
   <div class="card mt-2" style="width: 27rem;margin-left: 634px;">
   <div class="card-header text-center text-white" style="background-color: rgb(57, 117, 207);">
    <p style="margin: -1px;">Top Companies</p>
  </div>
   <div class="card mx-auto mt-2 mb-2" style="width: 24rem;box-shadow: 0px 0px 2px 2px #5660b4b8;">
  <div class="card-body">
    <img alt="" src="images/ck3.jpg" width="100%">
  </div> 
</div>
<div class="card mx-auto mt-2 mb-2" style="width: 24rem;box-shadow: 0px 0px 2px 2px #5660b4b8;">
  <div class="card-body">
    <img alt="" src="images/ck2.jpg" width="100%">
  </div>
  </div>
  
  <div class="card mx-auto mt-2 mb-2" style="width: 24rem;box-shadow: 0px 0px 2px 2px #5660b4b8;">
  <div class="card-body">
    <img alt="" src="images/ck1.jpg" width="90%">
  </div>
  </div>
   <div class="card mx-auto mt-2 mb-3" style="width: 24rem;box-shadow: 0px 0px 2px 2px #5660b4b8;">
  <div class="card-body">
    <img alt="" src="images/ck1.png" width="90%">
  </div>
  </div>
   </div>
</div>
   </div>

<%@ include file="includes/footer.jsp" %>
</body>
</html>