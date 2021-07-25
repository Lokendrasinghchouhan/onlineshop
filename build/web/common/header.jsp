<%@page import="bean.Product_cat_bean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.Product_catDAO"%>
<%@page import="common.MyConnection"%>
<%@page import="bean.Signup"%>
<link rel="stylesheet" href="common/common.css" type="text/css">
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <a class="navbar-brand" href="#">A-Bit-shop</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link dropdown" href="index.jsp">Home</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="products.jsp"
                   id="navbardrop " data-toggle="dropdown">Product</a>
                <div class="dropdown-menu">
                    <%
                        Product_catDAO pcd = new Product_catDAO(MyConnection.connectTo());
                        List li = pcd.getAll();
                        Iterator it=li.iterator();
                        while(it.hasNext()){
                            Product_cat_bean pcb =(Product_cat_bean)it.next();
                        
                    %>
                    <a class="dropdown-item" href="product.jsp?id=<%= pcb.getId() %>"><%= pcb.getTitle() %></a>
                    <% } %>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="about.jsp">About</a>
            </li> 
            <li class="nav-item">
                <a class="nav-link" href="contact.jsp">Contact</a>
            </li> 
            <li class="nav-item">
                <a class="nav-link" href="signup.jsp">Sign UP</a>
            </li> 
            <li class="nav-item dropdown">

                <%
                    if (session.getAttribute("signup") != null) {
                        Signup sb = (Signup) session.getAttribute("signup");

                %>
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" id="navbardrop">
                    <%= sb.getName()%>
                    <span class="caret"></span>
                </a>
                <div class="dropdown-menu">
                    <%
                        if (sb.getRole().equals("admin")) {
                    %>
                    <a class="dropdown-item" href="admin/index.jsp">Dashboard</a>
                    <a class="dropdown-item" href="Logout">Logout</a>
                    <%
                    } else if (sb.getRole().equals("user")) {
                    %>
                    <a class="dropdown-item" href="user/index.jsp">Dashboard</a>
                    <a class="dropdown-item" href="logout">Logout</a>
                </div>
                <%
                    }
                } else {
                %>
                <a class="nav-link" href="signin.jsp">Sign In</a> 
                <%
                    }
                %>
            </li> 
        </ul>
    </div>  
</nav>
