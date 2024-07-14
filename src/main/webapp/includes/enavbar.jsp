<nav class="navbar navbar-expand-lg navbar-light fixed-top bg-light">
	<div class="container">
		<a class="navbar-brand" href="employer.jsp" style="color: rgb(69, 69, 173);"><i class="bi bi-bar-chart-line-fill"></i><span style="color: rgb(57, 117, 207);">Hike</span>Up</a>
		<ul class="navbar-nav" style="color:#008000b5;font-size: 14px;">
        <i class="bi bi-check-circle-fill"></i>
		<c:if test="${userobj.role eq 'Recruiter'}">
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
			    <a class="nav-link" href="employer.jsp"><li class="nav-item"><i class="bi bi-plus-circle"></i>Add_vacancy</li></a>
			    <a class="nav-link" href="recapplication.jsp"><li class="nav-item"><i class="bi bi-download"></i>Received_Application</li></a>						
				<a class="nav-link" href="log-out"><li class="nav-item"><i class="bi bi-list"></i>Logout</li></a>
            </ul>
       </div>
    </div>
</nav>