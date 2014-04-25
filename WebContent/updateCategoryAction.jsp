<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.ResultSet"%>
<%@page import="Database.DBConn" %>
         <%
         if(request.getParameter("action")!=null){
             if(request.getParameter("action").startsWith("delete")){
                 if(request.getParameter("id")!=null){
                     DBConn db=new DBConn();
                     int j=db.executeUpdate("DELETE FROM qrbs_category WHERE id="+request.getParameter("id"));
                     if(j>0){
                         response.sendRedirect("category.jsp?type=Sucess&id="+request.getParameter("id"));
                     }
                     else
                     {
                           response.sendRedirect("updateCategoryDetails.jsp?type=fail&id="+request.getParameter("id"));
                     }       
                 }
             }
        }else{
         
         DBConn db=new DBConn();
        String name=request.getParameter("name");
        String description=request.getParameter("description");
        try{
        int j=db.executeUpdate("UPDATE qrbs_category SET name='"+name+"',description='"+description+"'WHERE id='"+request.getParameter("id")+"'");
          if(j>0){
                response.sendRedirect("updateCategoryDetails.jsp?type=Sucess&id="+request.getParameter("id"));
               }         
            else
            {
               response.sendRedirect("updateCategoryDetails.jsp?type=fail&id="+request.getParameter("id"));
            }              
          }
          catch(Exception e){
          }
         }
        
       %>
