<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.ResultSet"%>
<%@page import="Database.DBConn" %>
         <%
         DBConn db=new DBConn();
        String pdtList=request.getParameter("pdtList");
        int qty=Integer.parseInt(request.getParameter("qty"));
        String price=request.getParameter("price");
        String disc=request.getParameter("disc"); 
        String tax=request.getParameter("tax");
        String supplier=request.getParameter("supplier"); 
        int nqty;
        //out.print(name+manufacturer+catList+reOrderLevel+supplier);
        try{
        	out.println(":haii");
        int j=db.executeUpdate("INSERT INTO qrbs_purchase(products_id,supplier_id,no_of_units,price_perunit,tax_per_unit,discount) VALUES ('"+pdtList+"','"+supplier+"','"+qty+"','"+price+"','"+tax+"','"+disc+"')");
          if(j>0){
        	  DBConn db1=new DBConn();
        	  ResultSet rs=db1.executeQuery("SELECT stock FROM qrbs_products WHERE id='"+pdtList+"'");
        	  if(rs.next())
        		 nqty=qty+rs.getInt("stock");
        	  else 
        		  nqty=qty; 
        	  out.println(nqty);
        	  DBConn db2=new DBConn();
        	  int k=db2.executeUpdate("UPDATE qrbs_products SET stock='"+nqty+"'WHERE id='"+pdtList+"' ");
        	  if(k>0)
        		    response.sendRedirect("addNewPurchasedetails.jsp?type=Sucess");
        	  else
        		  response.sendRedirect("addNewPurchasedetails.jsp?type=fail");
               }         
            else
            {
               response.sendRedirect("addNewPurchasedetails.jsp?type=fail");
            }              
        }
           catch(Exception e){
        	   out.println(e);
           }
       %>
