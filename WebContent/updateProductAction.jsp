<%@page  import="java.sql.ResultSet"%>
<%@page import="Database.DBConn" %>
         <%
        if(request.getParameter("action")!=null){
        	 if(request.getParameter("action").startsWith("delete")){
        		 if(request.getParameter("id")!=null){
        			 DBConn db=new DBConn();
        			 int j=db.executeUpdate("DELETE FROM qrbs_products WHERE id="+request.getParameter("id"));
        			 if(j>0){
        				 response.sendRedirect("product.jsp?type=Sucess&id="+request.getParameter("id"));
        			 }
        			 else
        	         {
        	               response.sendRedirect("updateProductDetails.jsp?type=fail&id="+request.getParameter("id"));
        	         }  	 
        		 }
        	 }
        }
        else {//if(request.getContentType()=="POST"){//check if request is post
        DBConn db=new DBConn();
        String id=request.getParameter("id");
        String name=request.getParameter("name");
        String manufacturer=request.getParameter("brand");
        String catList=request.getParameter("catList");
        String reOrderLevel=request.getParameter("reorderlevel");
        String supplier=request.getParameter("supplier");  
        String stock=request.getParameter("stock");  
        out.print(name+manufacturer+catList+reOrderLevel+supplier);
        try{
        int j=db.executeUpdate("UPDATE qrbs_products SET name='"+name+"',category_id='"+catList+"',brand='"+manufacturer+"',reorderlevel='"+reOrderLevel+"',supplier_id='"+supplier+"',stock='"+stock+"'WHERE id='"+id+"'");
          if(j>0){
                response.sendRedirect("updateProductDetails.jsp?type=Sucess&id="+request.getParameter("id"));
               }         
            else
            {
               response.sendRedirect("updateProductDetails.jsp?type=fail&id="+request.getParameter("id"));
            }              
        }
           catch(Exception e){
           }
        }
      /*  else{
        	//response.sendError(404);
        }*/
       %>
