/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.SignUP;
import common.MyConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author NG_tailor
 */
public class SignupDelete extends HttpServlet {

   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
       SignUP sd=new SignUP(MyConnection.connectTo());
      if(sd.delete(Integer.parseInt(req.getParameter("id")))){
        resp.sendRedirect("admin/index.jsp?status=deleted");  
      }else{
        resp.sendRedirect("admin/index.jsp?status= not deleted");   
      }
       
   }
}
