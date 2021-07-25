<%-- 
    Document   : cart-item
    Created on : Oct 13, 2020, 8:13:31 PM
    Author     : NG_tailor
--%>

<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="bean.Products_bean"%>
<%@page import="DAO.ProductsDAO"%>
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
        <%@include file="common/header.jsp" %>9
        <div class="container-fluid">


            <%-- ----------------------------product section --%>
            <table class=" table table-border">
                <thead>
                    <tr>
                        <th> #</th>
                        <th> ID</th>
                        <th>Image</th>
                        <th> Name</th>
                        <th> Item </th>

                    </tr>
                </thead>

                <%  Signup  signup=(Signup)session.getAttribute("signup");
                    if (session.getAttribute("addToCart") != null) {
                        ListIterator lit = ((List) session.getAttribute("addToCart")).listIterator();
                        ProductsDAO pdo = new ProductsDAO(MyConnection.connectTo());
                        int a = 0;
                        int total = 0;
                        String pnmaes="";
                        String ids= "";
                        while (lit.hasNext()) {
                            a++;
                            int id = Integer.parseInt((String)lit.next());
                            Products_bean pb =(Products_bean) pdo.getOne(id);
                            total += pb.getCost();
                            pnmaes += pb.getTitle()+",";
                            ids += pb.getId()+ ",";
                %>
                <tr>
                    <td><%= a%></td>
                    <td><%= pb.getId()%></td>
                    <td><img src="img/products/<%= pb.getFilename()%>" height="50" width="50"></td>
                    <td><%= pb.getTitle()%></td>
                    <td><%= pb.getCost()%></td>
                </tr>
                <%
                    }
                %>
                <tr>
                    <td colspan="4"><strong>Total</strong></td> 
                    <td><%= total%></td>
                </tr>
                <tr>
                    <td style="text-align: center" colspan="5"><a href="payuform.jsp?amount=<%= total%>&firstname=<%=signup.getName() %>&email=<%=signup.getEmail()%>&phone=<%= signup.getContact()%>&productinfo=<%= pnmaes%>&surl=furl=http://nitrr.ac.in/&furl=http://bitsinfotech.in/&furl=http://bitsinfotech.in/&furl=http://bitsinfotech.in/&udf1=<%= ids%>" class=" btn btn-success btn-lg">Pay Now</a></td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
        <%@include file="common/footer.jsp" %>
    </body>
</html>
