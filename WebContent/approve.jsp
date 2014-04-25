<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.ResultSet,Database.DBConn"%>
         <% DBConn db=new DBConn();
          int i=db.executeUpdate("UPDATE  qrbs_user SET status='1' WHERE id='"+request.getParameter("id")+"'");
           if(i>0){
                           response.sendRedirect("staffHome.jsp?type=sucess&id="+request.getParameter("id"));
                       }
                       else
                       {
                           response.sendRedirect("staffHome.jsp?type=fail&id="+request.getParameter("id"));
                       }  
                       %>