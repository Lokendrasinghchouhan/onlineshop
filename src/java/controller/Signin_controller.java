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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author hp
 */
public class Signin_controller extends HttpServlet {
    
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
       String[] error = new String[2];
       Signup s = new Signup();
    SignUP sd = new SignUP(MyConnection.connectTo());
        if (!req.getParameter("email").equals("")&& !req.getParameter("email").equals(" ")){
                s.setEmail(req.getParameter("email"));
            }else{
                error[0] = "Email field is not valid";
             }
            if (!req.getParameter("password").equals("")&& !req.getParameter("password").equals(" ")){
              
                 s.setPassword(BCrypt.hashpw(req.getParameter("password"), BCrypt.gensalt(12)));
            }else{
                error[1] = "password field is not valid";
                  }
             Signup sb = sd.signiin(s);
             if(sb != null){
               HttpSession session = req.getSession();
               session.setAttribute("signup",sb);
                if(sb.getRole().equals("admin")){
                        resp.sendRedirect("admin/index.jsp");
                     }
                else if(sb.getRole().equals("user")){
                        resp.sendRedirect("user/index.jsp");
                 }
            }else{
                resp.sendRedirect("signin.jsp?info=failed");
             }
        }
}