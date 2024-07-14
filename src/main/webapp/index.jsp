<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HikeUp Site</title>
<%@ include file="includes/head.jsp" %>
<style type="text/css">


</style>
</head>
<body>
<%@ include file="includes/navbar.jsp" %>
  <div id="carouselExampleSlidesOnly" class="carousel slide mt-5" data-ride="carousel" data-interval="2000" data-pause="false">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100 img-fluid" src="images/img6.jpg" id="first" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100 img-fluid" src="images/img3.png" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100 img-fluid" src="images/pic2.jpg" alt="Third slide">
    </div>
  </div>
</div>


<%@ include file="includes/footer.jsp" %>
</body>
</html>