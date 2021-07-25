<%-- 
    Document   : index
    Created on : Oct 7, 2020, 12:14:31 PM
    Author     : NG_tailor
--%>
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
                    <h3>User List</h3>
                    <div style="color:red;">
                    <%
                        if(request.getParameter("status")!=(null)){
                            out.print(" "+request.getParameter("status").toUpperCase());
                        }
                        %>
                    </div>
                    <table class="table table-border">
                               <tr>                                  
                                   <th></th>
                                   <th></th>
                                   <th>ID</th>
                                   <th>Name</th>
                                   <th>Contact</th>
                                   <th>Email</th>
                                   <th>Role</th>
                               </tr>

                        <%
                        List li=new SignUP(MyConnection.connectTo()).getAll();
                      ListIterator  lit=li.listIterator();
                      while(lit.hasNext()){
                          Signup sb = (Signup)lit.next(); 
                   %>
                                                             
                            <tr>
                                <td><a href="" class="btn btn-dark">Update</a></td>
                                <td><a href="../SignupDelete?id=<%= sb.getId() %>" class="btn btn-dark">Delete</a></td>
                                <td><%= sb.getId() %></td>
                                  <td><%= sb.getName() %></td>
                                    <td><%= sb.getContact() %></td>
                                     <td><%= sb.getEmail() %></td> 
                                      <td><%= sb.getRole() %></td>   
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
