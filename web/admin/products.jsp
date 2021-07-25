<%-- 
    Document   : index
    Created on : Oct 7, 2020, 12:14:31 PM
    Author     : NG_tailor
--%>
<%@page import="bean.Product_cat_bean"%>
<%@page import="java.util.Iterator"%>
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
                    <h3>Create Products</h3>
                     <div style="color:red;">
                    <%
                       if(request.getParameter("status")!=(null)){
                          out.print(" "+request.getParameter("status").toUpperCase());
                     }
                        %>
                    </div>
                    <form method="POST" action="../Product_insert_controller" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-sm-6">
                                <label>Title</label>
                                <input type="text" name="title" class="form-control" placeholder="title">                            
                            </div>
                            <div class="row">
                                <div class="col-sm-6"></div>
                                <label>Cost</label>
                                <input type="text" name="cost" class="form-control" placeholder="price"> 
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <label>Quantity</label>
                                <input type="text" name="quantity" class="form-control" placeholder="Quantity"> 
                            </div>

                            <div class="col-sm-6">
                                <label>Select Product category</label>
                                <select name="product_category_id" class="form-control">
                                    <%                                List li = new Product_catDAO(MyConnection.connectTo()).getAll();
                                        Iterator it = li.iterator();
                                        while (it.hasNext()) {
                                            Product_cat_bean pcb = (Product_cat_bean) it.next();
                                    %>
                                    <option value="<%=pcb.getId()%>"><%=pcb.getTitle()%></option>
                                    <%
                                        }
                                    %> 
                                </select>
                            </div>  
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <br>
                                <textarea name="description" id="description" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <br>
                                <input type="file" name="img" class="form-control">
                            </div>
                            <div class="col-sm-6">
                                <br>
                                <button style="margin-left:40% ;width:150px;" class="btn btn-success">Save</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
    </body>
    <script src="https://cdn.ckeditor.com/4.13.1/standard/ckeditor.js"></script>
    <script>
        CKEDITOR.replace("description");
    </script>
</html>
