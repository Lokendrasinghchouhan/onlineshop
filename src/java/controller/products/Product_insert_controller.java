/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.products;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletConfig;
import DAO.ProductsDAO;
import bean.Products_bean;
import common.MyConnection;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;

import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

/**
 *
 * @author NG_tailor
 */
public class Product_insert_controller extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html;charset-UTF-8");
        Products_bean pb = new Products_bean();
        PrintWriter out = resp.getWriter();
        String contentType = req.getContentType();
        String realPath = getServletConfig().getServletContext().getRealPath("/");
        realPath = realPath.replace("build\\web\\", "web\\img\\products");

        File file;
        if (contentType.indexOf("multipart/form-data") >= 0) {
            try {
                DiskFileItemFactory factory = new DiskFileItemFactory();
                factory.setSizeThreshold(8000000);
                factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
                ServletFileUpload upload = new ServletFileUpload(factory);
                upload.setSizeMax(8000000);
                List fileItems = upload.parseRequest(new ServletRequestContext(req));
                Iterator i = fileItems.iterator();
                while (i.hasNext()) {
                    FileItem fi = (FileItem) i.next();
                    if (!fi.isFormField()) {
                        String name = fi.getName();
                        file = new File(realPath, name);
                        fi.write(file);
                        pb.setFilename(name);
                        out.println("sdsfs" + name);
                    } else if (fi.isFormField()) {
                        if (fi.getFieldName().equals("description")) {
                            pb.setDescription(fi.getString());
                        } else if (fi.getFieldName().equals("title")) {
                            pb.setTitle(fi.getString());
                        } else if (fi.getFieldName().equals("quantity")) {
                            pb.setQuantity(Integer.parseInt(fi.getString()));
                        } else if (fi.getFieldName().equals("product_category_id")) {
                            pb.setProduct_category_id(Integer.parseInt(fi.getString()));
                        } else if (fi.getFieldName().equals("cost")) {
                            pb.setCost(Float.parseFloat(fi.getString()));
                        }

                    }
                }

            } catch (Exception ex) {
                System.out.println(ex);
            }

        }

        boolean b = new ProductsDAO(MyConnection.connectTo()).insert(pb);
        if (b) {
            resp.sendRedirect("admin/products.jsp?status=success");
        } else {
            resp.sendRedirect("admin/products.jsp?status=failed");
        }

    }

}
