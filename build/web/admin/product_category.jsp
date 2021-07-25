<%-- 
    Document   : index
    Created on : Oct 7, 2020, 12:14:31 PM
    Author     : NG_tailor
--%>
<%@page import="bean.Product_cat_bean"%>
<%@page import="DAO.Product_catDAO"%>
<%@page import="bean.Signup"%>
<%@page import="java.util.ListIterator"%>
<%@page import="common.MyConnection" %>
 <%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="DAO.SignUP"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="common/login_check.jsp" %> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/css" charset=UTF-8">
        <title>Admin</title>
        <%@include file="common/cdn.jsp" %>
         <link rel="stylesheet" href="common/common.css" type="text/css">
    </head>
    <body>
        <%@include file="common/header.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 sidebar-col">
                    <%@include file="common/sidebar.jsp" %>
                    </div>
                <div class="col-sm-9 main-col">
                    <h3>Create  Products Category</h3>
                     <div style="color:red;">
                    <%
                       if(request.getParameter("status")!=(null)){
                          out.print(" "+request.getParameter("status").toUpperCase());
                     }
                        %>
                    </div>
                    <form method="POST" action="../Product_category_insert_controller">
                    <div class="row">
                        <div class="col-sm-6">
                            <label>Title</label>
                             <input type="text" name="title" class="form-control" placeholder="headphone">                            
                        </div>          
                        <div class="col-sm-6"> 
                            <label style="display: block;"> &nbsp;</lable>
                            <button class="btn btn-success">Save</button> 
                        </div>
                    </div>
                    </form>                   
                    <h3>product-category list</h3>
                    <table class="table table-border">
                               <tr>                                  
                                   <th></th>
                                   <th></th>
                                   <th>ID</th>
                                   <th>Title</th>
                                   <th>Status</th>
                                   
                               </tr>

                        <%
                        List li=new Product_catDAO(MyConnection.connectTo()).getAll();    
                      ListIterator  lit=li.listIterator();
                      while(lit.hasNext()){
                          Product_cat_bean pcb = (Product_cat_bean)lit.next();     
                   %>
                                                             
                            <tr>
                                <td><a href="" class="btn btn-dark">Update</a></td>
                                <td><a href="../Delete_controller?id=<%= pcb.getId() %>" class="btn btn-dark">Delete</a></td>
                                <td><%= pcb.getId() %></td>
                                  <td><%= pcb.getTitle() %></td>
                                     <td><%= pcb.getStatus() %></td> 
                                      
                               </tr>
                           
                               <%       
                      }
                       %>
             
                    </table>                      
                </div>
            </div>
        </div>
    </body>
</html>
