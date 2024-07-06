    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>LogIn Page</title>
            <%@include file="all_components/all_css.jsp"%>
            <style type="text/css">
                body, html {
                    height: 100%;
                    margin: 0;
                    display: flex;
                    flex-direction: column;
                    justify-content: space-between;
                    background: url("img/office-865091.jpg") no-repeat center center fixed;
                    background-size: cover;
                }
                .navbar {
                    width: 100%;
                }
                .login-container {
                    background: rgba(0, 0, 0, 0.7);
                    padding: 30px;
                    border-radius: 10px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                    width: 350px;
                    margin: auto;
                }
                .login-container h2 {
                    color: #ffffff;
                    text-align: center;
                    margin-bottom: 20px;
                }
                .form-group label {
                    color: #ffffff;
                }
                .form-control {
                    background-color: #f1f1f1;
                    border: none;
                    border-radius: 4px;
                    box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);
                }
                .btn-custom {
                    background-color: #FF4B4B;
                    color: #ffffff;
                    border: none;
                    border-radius: 4px;
                }
                .forgot-password, .create-account {
                    color: #FF4B4B;
                    text-decoration: none;
                    display: block;
                    text-align: right;
                    margin-top: 10px;
                }
                .create-account {
                    text-align: center;
                    margin-top: 20px;
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
            <%@include file="all_components/navbar.jsp"%>
            <div class="container-fluid d-flex flex-column justify-content-center align-items-center" style="flex: 1;">
                <div class="login-container">
                    <h2>LOG IN</h2>
                <c:if test="${not empty succMsg}">
                    <h4 class="text-danger">${succMsg}</h4>
                    <c:remove var="succMsg"/>
                </c:if>
                    <br>
                    <form action="login" method="post">
                        <div class="form-group">
                            <label for="email"><i class="fa fa-user" aria-hidden="true"></i> E-mail</label>
                            <input type="email" class="form-control" id="email" placeholder="E-mail" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="pwd"><i class="fa fa-lock" aria-hidden="true"></i> Password</label>
                            <input type="password" class="form-control" id="pwd" placeholder="Password" name="password" required>
                        </div>
                        <button type="submit" class="btn btn-custom btn-block"><i class="fas fa-key"></i> Log in</button>
                        <a href="#" class="forgot-password">Forgot password?</a>
                        <a href="signup.jsp" class="create-account">Click here to create an account</a>
                    </form>
                </div>
            </div>
            <%@include file="all_components/Footer.jsp"%>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        </body>
    </html>
