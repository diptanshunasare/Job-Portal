package com.servlet;

import com.DAO.UserDAO;
import com.DB.ConnectionProvider;
import com.entity.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            HttpSession session = req.getSession();
            User u = new User();

            if ("admin@gmail.com".equals(email) && "admin@121".equals(password)) {
                u.setEmail(email);
                u.setRole("admin");
                session.setAttribute("userobj", u);
                resp.sendRedirect("admin.jsp");
            } else {
                UserDAO dao =  new UserDAO(ConnectionProvider.getConn());
                User user = dao.login(email, password);
                
                if(user!=null)
                {
                    session.setAttribute("userobj", user);
                    resp.sendRedirect("home.jsp");
                    
                }else{
                    session.setAttribute("succMsg", "Invalid Credentials");
                    resp.sendRedirect("login.jsp");
                }
            }
            
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
