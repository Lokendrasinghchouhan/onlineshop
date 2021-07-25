/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.product_category;

import DAO.Product_catDAO;
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
public class Delete_controller extends HttpServlet {

   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
       Product_catDAO pd=new Product_catDAO(MyConnection.connectTo());
      if(pd.delete(Integer.parseInt(req.getParameter("id")))){
        resp.sendRedirect("admin/product_category.jsp?status=deleted");  
      }else{
        resp.sendRedirect("admin/product_category.jsp?status= not deleted");   
      }
       
   }
}
