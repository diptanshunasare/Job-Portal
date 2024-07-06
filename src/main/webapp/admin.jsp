
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin Page</title>
        <%@include file="all_components/all_css.jsp"%>
        <style>
            .container-fluid{
                display: flex;
                background-color: white;
                height: 88vh;
            }
            .adm{
                width: 600px;
                margin-left: 800px;
                margin-top: 150px;
            }
            .text-center{
                margin-left: 650px;
            }
            
        </style>
    </head>
    <body>
        <c:if test="${userobj.role ne 'admin'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <%@include file="all_components/navbar.jsp"%>
        <div class="container-fluid">
            <div class="img">
                <img class="adm" src="admin.png" width="width" height="height" alt="alt"/><br>
                <div class="text-center">
                <h1>Welcome Back Admin!!</h1>
          <p>You are now minutes away to add jobs!</p>
            </div>
            </div> 
            
        </div>
         <%--<%@include file="all_components/Footer.jsp"%>--%>
    </body>
</html>
