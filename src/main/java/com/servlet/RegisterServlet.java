
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


@WebServlet("/adduser")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try{
            String name = req.getParameter("name");
        String qua = req.getParameter("qua");
        String email = req.getParameter("email");
        String pass = req.getParameter("pass");
            
        UserDAO dao = new UserDAO(ConnectionProvider.getConn());
        
        User u = new User(name,email,pass,qua,"role");
        boolean f = dao.addUser(u);
        
        HttpSession session = req.getSession();
        if(f)
        {
            session.setAttribute("succMsg", "Registered Sucessfully!!");
            resp.sendRedirect("login.jsp");
        }
        else{
            session.setAttribute("succMsg", "Something went wrong!");
            resp.sendRedirect("signup.jsp");
        }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
    }
    
}