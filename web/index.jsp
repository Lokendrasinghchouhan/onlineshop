<%-- 
    Document   : index
    Created on : Oct 7, 2020, 11:56:45 AM
    Author     : NG_tailor
--%>
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
        <%@include file="common/header.jsp" %>
        <div class="container-fluid">
            <%-- ----------------------------bannner section --%>
            <section class="banner-section">
                <div class="row">
                   <div class="col-sm-12">
                       <img scr="img/products/wat.png">
                   </div>
                </div>
            </section>
            <%-- ----------------------------product section --%>
            <section class="products">
                <h1>recent products</h1>
                <div class="row">
                    <%       ProductsDAO pd = new ProductsDAO(MyConnection.connectTo());
                        List li2 = pd.getAll();
                        Iterator it2 = li2.iterator();
                        while (it2.hasNext()) {
                            Products_bean pb = (Products_bean) it2.next();
                    %>

                    <div class="col-sm-3">
                        <div class="product_wrapper">
                            <img src="img/products/<%= pb.getFilename() != null ? pb.getFilename() : "coolwin.jpg.jpg"%>" class="pimg" >
                            <div class="product_title"><%=pb.getTitle()%></div> 
                            <div class="product_cost"><%=pb.getCost()%></div> 
                            <div class="action_wrapper">
                                <button type="button" class="btn btn-primary" onclick="addToCart('<%=pb.getId()%>')">Add to cart</button>
                                <a class="btn btn-success" href="#">Buy Now</a>
                            </div>
                        </div>  
                    </div>
                    <%
                        }
                    %>
                </div>
            </section>
        </div>  
    </div>
    <%@include file="common/footer.jsp" %>
    <script>
       
        function addToCart(id){
            
            $.post("addToCartcontroller",{
                id:id
            },function(data,status){
                $(".stickyItemlist").text(data+" Items");
                
            });
        }
    </script>
    <div class="stickyItemlist" onclick="window.location.href='cart-item.jsp'">
       <%
       if(session.getAttribute("addToCart")!=null){
        out.print(((List)session.getAttribute("addToCart")).size()+" Items in cart");
           
       }
       %>  
    </div>
</body>
</html>
