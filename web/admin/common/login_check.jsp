
<%@page import="bean.Signup"%>
<%
    if(session.getAttribute("signup") !=null){
          Signup sb=(Signup) session.getAttribute("signup");
    if(sb.getRole().equals("admin")){
        
    }else{
        response.sendRedirect("../signin.jsp");
    }
    
    } else{
    response.sendRedirect("../signin.jsp");    
    }
            


%>