<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand" href="#"><img src="all_components\logo-removebg-preview.png" height="50px" width="60px" alt="alt"/></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      
      <c:if test="${userobj.role eq 'admin'}">
          <li class="nav-item">
        <a class="nav-link" href="addjob.jsp"><i style="margin-right: 6px" class="fa fa-plus-square-o" aria-hidden="true"></i>Post Job</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="viewjob.jsp"><i style="margin-right: 6px" class="fa fa-eye" aria-hidden="true"></i>View Job</a>
      </li>
      </c:if>
      
      
    </ul>
    <form class="form-inline my-2 my-lg-0">
        <c:if test="${userobj.role eq 'admin'}">
            <a href="#" class="btn btn-light mr-1 "><i style="margin-right: 7px" class="fa fa-user-circle" aria-hidden="true"></i> Admin</a>
        <a href="logout" class="btn btn-light"><i style="margin-right: 7px" class="fa fa-sign-in" aria-hidden="true"></i>Log Out</a>
        
        </c:if>   
        <c:if test="${userobj.role eq 'user'}">
            <a href="#" class="btn btn-light mr-1 " data-toggle="modal" data-target="#exampleModal"><i style="margin-right: 7px" class="fa fa-user-circle" aria-hidden="true"></i> ${userobj.name}</a>
        <a href="logout" class="btn btn-light"><i style="margin-right: 7px" class="fa fa-sign-in" aria-hidden="true"></i>Log Out</a>
        
        </c:if>
        
            
        <c:if test="${empty userobj}">
            <a href="login.jsp" class="btn btn-light mr-1 "><i style="margin-right: 7px" class="fa fa-sign-in" aria-hidden="true"></i> Log in</a>
            <a href="signup.jsp" class="btn btn-light"><i style="margin-right: 7px" class="fa fa-user-circle" aria-hidden="true"></i>Sign up</a>
        </c:if>
        
    </form>
  </div>
</nav>

