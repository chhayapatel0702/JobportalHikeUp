<nav class="navbar navbar-expand-lg navbar-light fixed-top bg-light">
	<div class="container">
		<a class="navbar-brand" href="jobseeker.jsp" style="color: rgb(69, 69, 173);"><i class="bi bi-bar-chart-line-fill"></i><span style="color: rgb(57, 117, 207);">Hike</span>Up</a>
		<ul class="navbar-nav" style="color:#008000b5;font-size: 14px;">
        <i class="bi bi-check-circle-fill"></i>
		<c:if test="${userobj.role eq 'Jobseeker'}">
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
			    <a class="nav-link" href="jobseeker.jsp"><li class="nav-item"><i class="bi bi-briefcase-fill"></i>Jobs</li></a>
			    <a class="nav-link" href="resume.jsp"><li class="nav-item"><i class="bi bi-person-video2"></i>Profile</li></a>
			    <a class="nav-link" href="log-out"><li class="nav-item"><i class="bi bi-list"></i>Logout</li></a>
            </ul>
       </div>
    </div>
</nav>