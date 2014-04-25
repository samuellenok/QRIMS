<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.ResultSet"%>
<%@page import="Database.DBConn" %>
         <%
         if(request.getParameter("action")!=null){
             if(request.getParameter("action").startsWith("delete")){
                 if(request.getParameter("id")!=null){
                     DBConn db=new DBConn();
                     int j=db.executeUpdate("DELETE FROM qrbs_purchase WHERE id='"+request.getParameter("id")+"'");
                     if(j>0){
                         response.sendRedirect("purchase.jsp?type=Sucess&id="+request.getParameter("id"));
                     }
                     else
                     {
                           response.sendRedirect("updatePurchaseDetails.jsp?type=fail&id="+request.getParameter("id"));
                     }       
                 }
             }
        }else{
        DBConn db=new DBConn();
        String pdtList=request.getParameter("pdtList");
        String qty=request.getParameter("qty");
        String price=request.getParameter("price");
        String disc=request.getParameter("disc"); 
        String tax=request.getParameter("tax");
        String supplier=request.getParameter("supplier");   
        //out.print(name+manufacturer+catList+reOrderLevel+supplier);
        try{
        int j=db.executeUpdate("UPDATE  qrbs_purchase SET products_id='"+pdtList+"',supplier_id='"+supplier+"',no_of_units='"+qty+"',price_perunit='"+price+"',tax_per_unit='"+tax+"',discount='"+disc+"'WHERE id='"+request.getParameter("id")+"'");
          if(j>0){
                response.sendRedirect("updatePurchaseDetails.jsp?type=Sucess&id="+request.getParameter("id"));
               }         
            else
            {
               response.sendRedirect("updatePurchaseDetails.jsp?type=fail&id="+request.getParameter("id"));
            }              
        }
           catch(Exception e){
           }
        }
       %>
