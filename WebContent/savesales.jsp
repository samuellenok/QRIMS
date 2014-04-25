<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
    <%@page import="Database.DBConn"%>
<%                      
    if(request.getMethod()== "POST"){
        String staffID=request.getParameter("staffID");
        String sBList = request.getParameter("sBList");
        DBConn db=new DBConn();
        String[] temp = sBList.split(",");
        try {
            int j=db.executeUpdate("INSERT INTO qrbs_sales(staff_id) VALUES ('"+staffID+")"); 
            if(j>0){
                  ResultSet rs=db.executeQuery("SELECT id FROM qrbs_sales WHERE staff_id='"+staffID+"'");
                  if(rs.next()) { 
                        int salesID=rs.getInt(0);
                        for (int i = 1; i < temp.length / 5; i++) {
                        int k=db.executeUpdate("INSERT INTO qrbs_sales_item(sales_id,product_id,price,discount,tax_percentage) VALUES ('"+salesID+"','"+temp[i*5 + 0]+"','"+temp[i*5 + 2]+"','"+temp[i*5 + 3]+"','"+temp[i*5 + 4]+"')"); 
                        if(k>0)
                            out.println("Sales Item"+temp[i*5 + 1]+"sales saved sucessfully"); 
                        else
                            out.println("sales saved but Sales Item"+temp[i*5 + 1]+" not updated sucessfully"); 
                        }
                        
                 }
            }
            else {
                out.println("Error in saving sales"); 
            }
                             
        } catch (Exception e) {
                out.println("Exception"+e); 
        }


    }
    else
     out.println("Error Page Not found"); 


 %>