<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.ResultSet"%>
<%@page import="Database.DBConn" %>
         <%
         DBConn db=new DBConn();
        String staffID=request.getParameter("StaffID");
        String sBList=request.getParameter("BList");
        String[] temp = sBList.split(",");
        try {

            
            int j=db.executeUpdate("INSERT INTO qrbs_sales(staff_id) VALUES ('"+staffID+")"); 
            if(j>0){
                ResultSet rs=db.executeQuery("SELECT id FROM qrbs_sales WHERE staff_id='"+staffID+"'");
                if(rs.next()) { 
                    int salesID=rs.getInt(0);
                  for (int i = 1; i < temp.length / 5; i++) {
                      int k=db.executeUpdate("INSERT INTO qrbs_sales_item(sales_id,product_id,price,discount,tax_percentage) VALUES ('"+salesID+"','"+temp[i*5 + 0]+"','"+temp[i*5 + 1]+"','"+temp[i*5 + 2]+"','"+temp[i*5 + 3]+"','"+temp[i*5 + 4]+"')"); 
                  } 
                }
               out.println("sales saved sucessfully"); 
           }
           else {
        	   out.println("error in saving sales"); 
           }
           
      } catch (Exception e) {
    	  out.println("error in saving sales"+e); 
      }

       %>
