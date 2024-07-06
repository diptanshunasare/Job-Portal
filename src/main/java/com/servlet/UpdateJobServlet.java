
package com.servlet;

import com.DAO.JobDAO;
import com.DB.ConnectionProvider;
import com.entity.Jobs;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/update")
public class UpdateJobServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          try{
          int id = Integer.parseInt(req.getParameter("id"));    
          String title = req.getParameter("title");
          String location = req.getParameter("location");
          String category = req.getParameter("category");
          String status = req.getParameter("status");
          String description = req.getParameter("description");
          
          
          Jobs j = new Jobs();
          j.setId(id);
          j.setTitle(title);
          j.setDescription(description);
          j.setLocation(location);
          j.setCategory(category);
          j.setStatus(status);
          
          HttpSession session = req.getSession();
          
          JobDAO dao = new JobDAO(ConnectionProvider.getConn());
          boolean f = dao.updateJobs(j);
          if(f)
          {
              session.setAttribute("succMsg", "Job Updated Sucessfully");
              resp.sendRedirect("viewjob.jsp");
              
          }
          else{
              session.setAttribute("succMsg", "Something went wrong!!!");
              resp.sendRedirect("viewjob.jsp");
          }
          
          }catch(Exception e){
          }
          
    }
    
    
}
