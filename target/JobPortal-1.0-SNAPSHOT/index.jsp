<%@page import="java.sql.Connection"%>
<%@page import="com.DB.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Job Portal</title>
        <%@include file="all_components/all_css.jsp"%>
        <style type="text/css">
            
            .back-img {
                background: url("img/office-865091.jpg") no-repeat center center;
                width: 100%;
                height: 80vh;
                background-size: cover;
            }
            .text-center {
                height: 80vh;
                display: flex;
                justify-content: flex-start;
                align-items: center;
                font-size: 50px;
                color: #fff;
                padding: 0 80px;
            }
            .footer-container {
                background-color: #343434;
                padding: 10px 0;
                box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            .footer-container p {
                margin: 0;
                font-size: 1.2em;
                color: #ffffff;
            }
        </style>
    </head>
    <body>
        <%@include file="all_components/navbar.jsp"%>
        
        <div class="container-fluid back-img">
            <div class="text-center">
                <h1>
                    <i class="fa fa-book" aria-hidden="true"></i> Online Job Portal
                </h1>
            </div>
        </div>
        <%@include file="all_components/Footer.jsp"%>
    </body>
</html>
