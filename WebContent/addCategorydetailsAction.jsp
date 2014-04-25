<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.ResultSet"%>
<%@page import="Database.DBConn" %>
         <%
         DBConn db=new DBConn();
        String name=request.getParameter("name");
        String description=request.getParameter("description");
        try{
        int j=db.executeUpdate("INSERT INTO qrbs_category(name,description) VALUES ('"+name+"','"+description+"')");
          if(j>0){
                response.sendRedirect("addNewCategorydetails.jsp?type=Sucess");
               }         
            else
            {
               response.sendRedirect("addNewCategorydetails.jsp?type=fail");
            }              
        }
           catch(Exception e){
           }
       %>
