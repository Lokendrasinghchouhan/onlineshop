
package controller.product_category;

import DAO.Product_catDAO;
import bean.Product_cat_bean;
import common.MyConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Product_category_insert_controller extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Product_cat_bean pcb=new Product_cat_bean();
        if(req.getParameter("title")!=null && !req.getParameter("title").equals(" ")){
        pcb.setTitle(req.getParameter("title"));
       boolean b= new Product_catDAO(MyConnection.connectTo()).insert(pcb);
       if(b){
           resp.sendRedirect("admin/product_category.jsp?status=success");
       }else{
       
       resp.sendRedirect("admin/product_category.jsp?status= not success");
        }
        }
   }
}

    