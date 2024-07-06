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
    <title>View Jobs</title>
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
        h2{
            text-align: center;
            font-weight:bold;
        }
        .job-list {
            margin: 20px 0;
            height: 400px; 
            overflow-y: scroll;
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
        
        .job-item p{
            margin-top: 10px;
            font-size: 18px;
            font-weight: bold;
        }
        .job-item .view-more-btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            margin: 10px;
            margin-left:  485px;
        }
        #filterButton{
            background-color: #28a745; 
            color: white;
            
        }
        .inp{
            outline:none;
            border: none;
            padding: 10px 35px;
            background-color: #e9ecef;
            margin-left: 20px;
        }      
        .filter-section {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
        }
        .filter-section select, .filter-section button {
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
            background: #f9f9f9;
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
        <h2>Job Listings</h2>
        <br>
        <form action="moreview.jsp" method="get">
            <div class="filter-section">
             
            <select id="locationFilter" name="loc">
                <option value="lo">Select Location</option>
                <option value="Andhra Pradesh">Andhra Pradesh</option>
                <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                <option value="Assam">Assam</option>
                <option value="Bihar">Bihar</option>
                <option value="Chhattisgarh">Chhattisgarh</option>
                <option value="Goa">Goa</option>
                <option value="Gujarat">Gujarat</option>
                <option value="Haryana">Haryana</option>
                <option value="Himachal Pradesh">Himachal Pradesh</option>
                <option value="Jharkhand">Jharkhand</option>
                <option value="Karnataka">Karnataka</option>
                <option value="Kerala">Kerala</option>
                <option value="Madhya Pradesh">Madhya Pradesh</option>
                <option value="Maharashtra">Maharashtra</option>
                <option value="Manipur">Manipur</option>
                <option value="Meghalaya">Meghalaya</option>
                <option value="Mizoram">Mizoram</option>
                <option value="Nagaland">Nagaland</option>
                <option value="Odisha">Odisha</option>
                <option value="Punjab">Punjab</option>
                <option value="Rajasthan">Rajasthan</option>
                <option value="Sikkim">Sikkim</option>
                <option value="Tamil Nadu">Tamil Nadu</option>
                <option value="Telangana">Telangana</option>
                <option value="Tripura">Tripura</option>
                <option value="Uttar Pradesh">Uttar Pradesh</option>
                <option value="Uttarakhand">Uttarakhand</option>
                <option value="West Bengal">West Bengal</option>
            </select>
            <select id="categoryFilter" name="cat">
                <option value="ca">Select Category</option>
                <option value="IT">IT</option>
                <option value="Developer">Developer</option>
                <option value="Banking">Banking</option>
                <option value="Engineer">Engineer</option>
                <option value="Teacher">Teacher</option>
            </select>
            <button  id="filterButton">Submit</button>
          
        </div>
        </form>
        
  
        
        <div class="job-list">
            <%
            JobDAO dao = new  JobDAO(ConnectionProvider.getConn());
            List<Jobs> list = dao.getAllJobsForUser();
            for (Jobs j : list){
            
    %>
            <div class="job-item">
                <h4><%=j.getTitle()%></h4>
                <% 
                      if(j.getDescription().length()>0 && j.getDescription().length()<120){
                %>
                    
                <div><%=j.getDescription()%>.</div>
                <%
                    }else{
                %>
                <div><%=j.getDescription().substring(0,120)%>...</div>
                <%
                    }
                %>
                <br>
                <div class="job-details">
                    <input class="inp" type="text" value="Location: <%=j.getLocation()%>" readonly>
                    <input class="inp" type="text" value="Category: <%=j.getCategory()%>" readonly>
                    
                </div>
                
                <p>Publish Date: <%=j.getPdate().toString()%></p>
                <a href="description.jsp?id=<%=j.getId()%>"><button class="view-more-btn">View More</button></a>
            </div>
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
