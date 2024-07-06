/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet;

import com.DAO.JobDAO;
import com.DB.ConnectionProvider;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/delete")
public class DeleteJobServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
            try{
                int id = Integer.parseInt(req.getParameter("id"));
                JobDAO dao = new JobDAO(ConnectionProvider.getConn());
                boolean f = dao.deleteJobs(id);
                
                 HttpSession session = req.getSession();
          if(f)
          {
              session.setAttribute("succMsg", "Job Delete Sucessfully");
              resp.sendRedirect("viewjob.jsp");
              
          }
          else{
              session.setAttribute("succMsg", "Something went wrong!!!");
              resp.sendRedirect("viewjob.jsp");
          }
                
                
            }catch(Exception e)
            {
                e.printStackTrace();
            }
    }
    
    
    
}
