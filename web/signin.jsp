<%-- 
    Document   : signin
    Created on : Oct 7, 2020, 12:06:28 PM
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
          <h1>Sign In Form</h1>
          <%
          if(request.getParameter("info")!=null){
          out.print("<h1>Login failed</h1>");
          }
          %>
           <form method="post" action="Signin">
             
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
                   <div class="row">
                 <div class="col-sm-12">
                     <button tytype="submit" class="btn btn-success">Submit</button>
                     <a href="signup.jsp">Sign Up?</a>
                     </div>
                 </div>
               </form> 
           </div>
         <%@include file="common/footer.jsp" %>
    </body>
</html>

