    <%
    if(session.getAttribute("userName")==null)
    response.sendRedirect("index.jsp"); 
    else
    {
    session.setAttribute("userName",null);
    session.invalidate();
    response.sendRedirect("index.jsp");
    }
    %>