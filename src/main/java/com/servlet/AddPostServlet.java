
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


@WebServlet("/addjob")
public class AddPostServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try
      {
          
          String title = req.getParameter("title");
          String location = req.getParameter("location");
          String category = req.getParameter("category");
          String status = req.getParameter("status");
          String description = req.getParameter("description");
          
          Jobs j = new Jobs();
          
          j.setTitle(title);
          j.setDescription(description);
          j.setLocation(location);
          j.setStatus(status);
          j.setCategory(category);
          
          
          HttpSession session = req.getSession();
          
          JobDAO dao = new JobDAO(ConnectionProvider.getConn());
          boolean f = dao.addJobs(j);
          if(f)
          {
              session.setAttribute("succMsg", "Job Post Sucessfully");
              resp.sendRedirect("addjob.jsp");
              
          }
          else{
              session.setAttribute("succMsg", "Something went wrong!!!");
              resp.sendRedirect("addjob.jsp");
          }
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
    }
    
}
