
package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
   
    private static Connection con;
    
    public static Connection getConn(){
        try{
            if(con == null){
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal", "root","root");
                
            }
        }
        
        catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
}
