<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.ResultSet"%>
<%@page import="Database.DBConn" %>
         <%
         DBConn db=new DBConn();
        String name=request.getParameter("name");
        String manufacturer=request.getParameter("brand");
        String catList=request.getParameter("catList");
        String reOrderLevel=request.getParameter("reorderlevel");
        String supplier=request.getParameter("supplier");   
        out.print(name+manufacturer+catList+reOrderLevel+supplier);
        try{
        int j=db.executeUpdate("INSERT INTO qrbs_products(name,category_id,brand,reorderlevel,supplier_id) VALUES ('"+name+"','"+catList+"','"+manufacturer+"','"+reOrderLevel+"','"+supplier+"')");
          if(j>0){
                response.sendRedirect("addNewProductdetails.jsp?type=Sucess");
               }         
            else
            {
               response.sendRedirect("addNewProductdetails.jsp?type=fail");
            }              
        }
           catch(Exception e){
           }
       %>
