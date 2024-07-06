<%@page import="java.util.List"%>
<%@page import="com.entity.Jobs"%>
<%@page import="com.DB.ConnectionProvider"%>
<%@page import="com.DAO.JobDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Job</title>
    <%@include file="all_components/all_css.jsp"%>
    <style type="text/css">
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
            
        }
        .navbar {
            width: 100%;
            position: fixed;
            top: 0;
            z-index: 1030;
        }
        .job-container {
            background: #ffffff;
            /*padding: 20px;*/
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 800px;
            margin: 20px auto;
            text-align: center;
            flex: 1;
            overflow-y: auto;
            margin-top: 80px;
        }
        .jobs{
            padding: 20px;
        }
         h5{
            font-size: 30px;
            font-weight: bold;
            text-decoration: underline;
        }
        .job-container h2 {
            color: #343a40;
            margin-bottom: 10px;
        }
        .job-container p {
            color: #6c757d;
            margin-bottom: 20px;
        }
        .job-details {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
        }
        .job-details div {
            flex: 1;
            margin: 0 10px;
            text-align: left;
        }
        .job-details div label {
            font-weight: bold;
            color: #495057;
        }
        .job-details div input {
            width: 100%;
            border: none;
            background: #e9ecef;
            padding: 10px;
            border-radius: 5px;
            margin-top: 5px;
            color: #495057;
            font-weight: bold;
        }
        .job-actions {
            display: flex;
            justify-content: center;
            
        }
        .job-actions button {
            margin: 0 10px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            color: #ffffff;
            cursor: pointer;
        }
        a{
            text-decoration: none;
            color: white;
        }
        a:hover{
            text-decoration: none;
            color: white;
            
        }
        .job-actions .edit-btn {
            
            background: #28a745;
        }
        .job-actions .delete-btn {
            background: #dc3545;
        }
    </style>
</head>
<body>
            <c:if test="${userobj.role ne 'admin'}">
            <c:redirect url="login.jsp"></c:redirect>
            
        </c:if>
    <%@include file="all_components/navbar.jsp"%>
   
    
        
        <div class="jobs">
            <div class="job-container">
            <br>
            
            <c:if test="${not empty succMsg}">
                    <div class="alert alert-success" role="alert">
                        ${succMsg}
                    </div>
                        <c:remove var="succMsg"/>
                </c:if>
         <%
            JobDAO dao = new JobDAO(ConnectionProvider.getConn());
            List<Jobs> list =dao.getAllJobs();
            for(Jobs j:list)
            {%>
            <br>
        <h2 id="job-title"><%=j.getTitle()%></h2>
        <p id="job-description"><%=j.getDescription()%></p>
        <div class="job-details">
            <div>
                <label>Location: </label>
                <input type="text" id="job-location" readonly value="<%=j.getLocation()%>">
            </div>
            <div>
                <label>Category:</label>
                <input type="text" id="job-category" value="<%=j.getCategory()%>" readonly>
            </div>
            <div>
                <label>Status:</label>
                <input type="text" id="job-status" value="<%=j.getStatus()%>" readonly>
            </div>
        </div>
        <p>Publish Date: <span id="publish-date"><%=j.getPdate()%></span></p>
        <div class="job-actions">
            <button class="edit-btn" id="ed"><a href="editjob.jsp?id=<%=j.getId()%>">Edit</a></button>
            <button class="delete-btn"><a href="delete?id=<%=j.getId()%>">Delete</a></button>
        </div>
        <br>
        <hr>
        <%}

            
        %>
        </div>
        
    </div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
