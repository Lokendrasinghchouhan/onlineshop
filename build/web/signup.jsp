<%-- 
    Document   : signup
    Created on : Oct 7, 2020, 12:03:38 PM
    Author     : NG_tailor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>A-Bit-Shop</title>
        <%@include file="common/cdn.jsp" %>
        <link rel="stylesheet" href="css/common.css" type="text/css">
        
    </head>
    <body>
       <%@include file="common/header.jsp" %>
       <div class="container signup">
           <h1>Sign Up Form</h1>
           <form method="post" action="Signup">
               <div class="row">
               <div class="col-sm-6">
                   <label>Name</label>
                   <input calss="form-control" type="text"name="name">
               </div>
                   <div class="col-sm-6">
                   <label>Contact</label>
                   <input calss="form-control" type="text"name="contact">
                   </div>
                 </dav> 
                 <div class="row">
               <div class="col-sm-6">
                   <label>Email</label>
                   <input calss="form-control" type="text"name="email">
               </div>
                      <div class="col-sm-6">
                   <label>Password</label>
                   <input calss="form-control" type="text"name="password">
                   </div>
                 </dav> 
                 <div class="col-sm-12">
                     <button tytype="submit" class="btn btn-success">Submit</button>
                     <a href="signin.jsp">Sign in?</a>
                     </div>
                 </div>
               </form> 
           </div>
         <%@include file="common/footer.jsp" %>
    </body>
</html>
