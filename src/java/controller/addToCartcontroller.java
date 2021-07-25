/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NG_tailor
 */
public class addToCartcontroller extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        List li;
        if (session.getAttribute("signup") != null) {
            String param = req.getParameter("id");
            if (session.getAttribute("addToCart") == null) {
                li = new ArrayList();
                li.add(param);
                session.setAttribute("addToCart", li);
            } else {
                li = (List) session.getAttribute("addToCart");
                if (!li.contains(param)) {
                    li.add(param);
                }
                session.setAttribute("addToCart", li);
            }
            resp.getWriter().print(li.size());
        }else{
            resp.getWriter().print(0);
          session.invalidate();

    }
    }
}
    

    
    


    
        


// </editor-fold>

