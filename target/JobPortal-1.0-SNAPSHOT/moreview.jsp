<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Jobs"%>
<%@page import="com.DAO.JobDAO"%>
<%@page import="com.DB.ConnectionProvider"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Job Listings</title>
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
            text-align: center;
        }
        h2 {
            text-align: center;
            font-weight: bold;
        }
        .message {
            font-size: 20px;
            color: #ff0000;
            font-weight: bold;
        }
        .job-item {
            background: #f9f9f9;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            font-size: 17px;
            text-align: left;
        }
        .job-item h4 {
            margin: 0 0 10px 0;
        }
        .job-item p {
            margin: 10px 0;
        }
        .job-details {
            display: flex;
            justify-content: space-around;
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
        .footer {
            width: 100%;
            text-align: center;
            padding: 10px;
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            position: fixed;
            bottom: 0;
        }
        .view-more-btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            margin: 10px;
            margin-left:  485px;
        }
    </style>
</head>
<body>
    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp"/>
    </c:if>
    <%@include file="all_components/navbar.jsp"%>
    <div class="container">
        <h2>Job Listings</h2>
        <%
            String loc = request.getParameter("loc");
            String cat = request.getParameter("cat");
            String msg = "";
            
            JobDAO dao = new JobDAO(ConnectionProvider.getConn());
            List<Jobs> list = null;
            if("lo".equals(loc) && "ca".equals(cat)) {
                list = new ArrayList<Jobs>();
                msg = "Job Not Available";
            } else if ("lo".equals(loc) || "ca".equals(cat)) {
                list = dao.getJobsORLocationAndCate(cat, loc);
            } else {
                list = dao.getJobsANDLocationAndCate(cat, loc);
            }
            if (list.isEmpty()) {
        %>
            <p class="message">Currently, there are no job listings available. Please check back later.</p>
        <%
            } if (list != null) {
                for (Jobs j : list) {
        %>
            <div class="job-item">
                <h4><%= j.getTitle() %></h4>
                <p><%= j.getDescription() %></p>
                <div class="job-details">
                    <div>Location: <%= j.getLocation() %></div>
                    <div>Category: <%= j.getCategory() %></div>
                </div>
                <p>Publish Date: <%= j.getPdate().toString() %></p>
                <a href="description.jsp?id=<%=j.getId()%>"><button class="view-more-btn">View More</button></a>
           
            </div>
        <%
                }
            }
else{
        %>
        <h4 class="text-center text-danger"><%=msg%></h4>
        <%
            } 
        %>
    </div>
    <%@include file="all_components/Footer.jsp"%>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
