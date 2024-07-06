<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<%@page import="java.util.List"%>
<%@page import="com.entity.Jobs"%>
<%@page import="com.DAO.JobDAO"%>
<%@page import="com.DB.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Job</title>
    <%@include file="all_components/all_css.jsp"%>
    <style type="text/css">
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            background: url("img/blur.jpeg") no-repeat center center fixed;
            background-size: cover;
        }
        .navbar {
            width: 100%;
        }
        .container {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            margin: 30px auto;
            width: 90%;
        }
        h2 {
            text-align: center;
            font-weight: bold;
        }
        .job-item {
            background: #f9f9f9;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            font-size: 17px;
        }
        .job-item h4 {
            margin: 0 0 10px 0;
        }
        .job-item p {
            margin-top: 10px;
            font-size: 18px;
            font-weight: bold;
        }
        .view-more-btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            margin: 10px;
        }
        .inp {
            outline: none;
            border: none;
            padding: 10px 35px;
            background-color: #e9ecef;
        }
        .footer {
            width: 100%;
            text-align: center;
            padding: 10px;
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            position: fixed;
            bottom: 0;
        }
        .job-details {
            display: flex;
            justify-content: space-around;
            margin-right: 500px;
        }
        .job-details div {
            flex: 1;
            background: #e9ecef;
            padding: 10px;
            border-radius: 5px;
            margin-right: 10px;
            text-align: center;
        }
        .job-details div:last-child {
            margin-right: 0;
        }
    </style>
</head>
<body>
    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp"/>
    </c:if>
    <%@include file="all_components/navbar.jsp"%>
    <div class="container">
        <h2>Job Description</h2>
        <br>
        <div class="job-item">
            <%
            int id = Integer.parseInt(request.getParameter("id"));
            JobDAO dao = new JobDAO(ConnectionProvider.getConn());
            Jobs job = dao.getJobById(id);
            if (job != null) {
            %>
            <h4><%=job.getTitle()%></h4>
            <div><%=job.getDescription()%></div>
            <br>
            <div class="job-details">
                <input class="inp" type="text" value="Location: <%=job.getLocation()%>" readonly>
                <input class="inp" type="text" value="Category: <%=job.getCategory()%>" readonly>
            </div>
            <p>Publish Date: <%=job.getPdate().toString()%></p>
            <%
            } else {
            %>
            <p>No job available</p>
            <%
            }
            %>
        </div>
    </div>
    <%@include file="all_components/Footer.jsp"%>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
