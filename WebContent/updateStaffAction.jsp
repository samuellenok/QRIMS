<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.ResultSet,Database.DBConn"%>
         <%
         if(request.getParameter("action")!=null){
             if(request.getParameter("action").startsWith("delete")){
                 if(request.getParameter("id")!=null){
                     DBConn db=new DBConn();
                     int j=db.executeUpdate("DELETE FROM qrbs_staff WHERE id="+request.getParameter("id"));
                     if(j>0){
                         response.sendRedirect("staff.jsp?type=Sucess&id="+request.getParameter("id"));
                     }
                     else
                     {
                           response.sendRedirect("updateStaffDetails.jsp?type=fail&id="+request.getParameter("id"));
                     }       
                 }
             }
        }else{
         DBConn db=new DBConn();
         String name=request.getParameter("user_name");
         String email=request.getParameter("email");
         String mobile=request.getParameter("mobile");
         String ll=request.getParameter("ll");
         String dob=request.getParameter("dob");
         String gender=request.getParameter("gender");
         String postalAdress=request.getParameter("postalAdress");
         String zip=request.getParameter("zip");  
         String educationalQualfication=request.getParameter("educationalQualfication");
         String designation=request.getParameter("designation");
         String username=request.getParameter("user_name");
         String pwd=request.getParameter("pwd");
         String status=request.getParameter("status");
         
	        try{
	        	//int i=db.executeUpdate("INSERT INTO qrbs_user(username,email,password_hash,activation_key,user_type,status) VALUES ('"+username+"','"+email+"','"+pwd+"','xxxxxxxxxxx','1','1')");
	            //if(i>0){
	            	   //ResultSet rset=db.executeQuery("SELECT id FROM qrbs_user WHERE username='"+username+"'");
	            	   //while(rset.next()){
	               /*int uid=rset.getInt("id");*/
	            	   int j=db.executeUpdate("UPDATE  qrbs_staff SET name='"+name+"',dob='"+dob+"',gender='"+gender+"',mobile='"+mobile+"',landline='"+ll+"',postal_address='"+postalAdress+"',postcode='"+zip+"',educationalqualification='"+educationalQualfication+"',designation='"+designation+"' WHERE id='"+request.getParameter("id")+"'");
	            	   int i=db.executeUpdate("UPDATE  qrbs_user u SET u.status='"+status+"' WHERE u.id=(SELECT id FROM qrbs_staff WHERE id='"+request.getParameter("id")+"')");
	            	   if(i>0&&j>0){
	            		   response.sendRedirect("updateStaffDetails.jsp?type=Sucess&id="+request.getParameter("id"));
	            	   }
	            	   else
	                   {
	            		   response.sendRedirect("updateStaffDetails.jsp?type=fail&id="+request.getParameter("id"));
	                   }  
	            	   //}
	           // }
	           // else
	           // {
	            //   response.sendRedirect("addNewStaffdetails.jsp?type=fail");
	           // }              
	        }
	        catch(Exception e){
	        }
        }
       %>
