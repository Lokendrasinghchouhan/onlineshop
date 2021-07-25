/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NG_tailor
 */
public class Signout_controller extends HttpServlet {

     protected void doGet(HttpServletRequest req, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=req.getSession();
        session.invalidate();
        response.sendRedirect("signin.jsp");
        
    }

        }
    

    