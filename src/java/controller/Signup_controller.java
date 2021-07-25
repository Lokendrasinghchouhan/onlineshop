/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
import DAO.SignUP;
import bean.Signup;
import common.MyConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;
public class Signup_controller extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException,IOException{
            String[] error = new String[4];
            Signup s = new Signup();
            PrintWriter out = resp.getWriter();
            if (!req.getParameter("name").equals("")&& !req.getParameter("name").equals(" ")){
                s.setName(req.getParameter("name"));
            }else{
                error[0] = "Name field is not valid";
             }
            if (!req.getParameter("contact").equals("")&& !req.getParameter("contact").equals(" ")){
                s.setContact(req.getParameter("contact"));
            }else{
                error[1] = "Contact field is not valid";
             }
            if (!req.getParameter("email").equals("")&& !req.getParameter("email").equals(" ")){
                s.setEmail(req.getParameter("email"));
            }else{
                error[2] = "Email field is not valid";
             }
            if (!req.getParameter("password").equals("")&& !req.getParameter("password").equals(" ")){
              
                s.setPassword(BCrypt.hashpw(req.getParameter("password"), BCrypt.gensalt(12)));
            }else{
                error[3] = "password field is not valid";
             }
       
      
      SignUP sd;
        sd = new SignUP(MyConnection.connectTo());
        boolean bool = sd.insert(s);
        if (bool){
        resp.sendRedirect("success.jsp");
        }else{
        resp.sendRedirect("signup.jsp?inf0=");
        }
}
}
