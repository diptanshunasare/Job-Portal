
<%@page import="com.entity.Jobs"%>
<%@page import="com.DB.ConnectionProvider"%>
<%@page import="com.DAO.JobDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="all_components/all_css.jsp"%>
        <title>Edit Job Page</title>
        <style type="text/css">
            body, html {
                height: 100%;
                margin: 0;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                background-image:linear-gradient(#546e7a,#263238) ;
            }
            .navbar {
                width: 100%;
            }
            .form-container {
                flex: 1;
                padding: 50px 15px;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .form-card {
                width: 100%;
                max-width: 600px;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
                background: rgba(241, 241, 241 ,1);
                border: 1px solid white;
            }
            .form-card .form-group {
                margin-bottom: 15px;
            }
            .form-card .form-control {
                border-radius: 5px;
            }
            .form-card .btn-publish {
                background-color: #ff4b5c;
                color: white;
                border-radius: 5px;
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
        </style>
    </head>
    <body>
                <c:if test="${userobj.role ne 'admin'}">
            <c:redirect url="login.jsp"></c:redirect>
            
        </c:if>
        <%@include file="all_components/navbar.jsp"%>
         <div class="container form-container">
            <div class="form-card">
                <%
                    int id = Integer.parseInt(request.getParameter("id"));
                   JobDAO dao = new JobDAO(ConnectionProvider.getConn());
                   Jobs j = dao.getJobById(id);%>
                <h3 class="text-center mb-4">Edit Job</h3>
                <form action="update" method="POST">
                    <input type="hidden" value='<%=j.getId()%>' name="id">
                    <div class="form-group">
                        <label for="title" name="title"><i class="fa fa-briefcase"></i> Job Title</label>
                        <input type="text" class="form-control" id="title" name="title" value="<%=j.getTitle()%>" placeholder="Enter Job Title" required>
                    </div>
                    <div class="form-group">
                        <label for="location"><i class="fa fa-map-marker" aria-hidden="true"></i> Location</label>
                        <select class="form-control" id="location" name="location" required>
                            <option value="<%=j.getLocation()%>" disabled selected><%=j.getLocation()%></option>
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
                    </div>
                    <div class="form-group">
                        <label for="category"><i class="fa fa-tags"></i> Category</label>
                        <select class="form-control" id="category" name="category" required>
                            <option value="<%=j.getCategory()%>" disabled selected><%=j.getCategory()%></option>
                            <option value="IT">IT</option>
                            <option value="Developer">Developer</option>
                            <option value="Banking">Banking</option>
                            <option value="Engineer">Engineer</option>
                            <option value="Teacher">Teacher</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="status" ><i class="fa fa-toggle-on"></i> Status</label>
                        <select class="form-control" id="status" name="status" required>
                            <option value="" disabled selected>Select Status</option>
                            <option value="<%=j.getStatus()%>"><%=j.getStatus()%></option>
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="description"><i class="fa fa-align-left"></i> Description</label>
                        <textarea class="form-control" name="description" id="description" rows="4" placeholder="Enter Job Description" required><%=j.getDescription()%></textarea>
                    </div>
                    <button type="submit" class="btn btn-publish btn-block"><i class="fa fa-upload"></i> Update Job</button>
                </form>
            </div>
        </div>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
        
    </body>
</html>
