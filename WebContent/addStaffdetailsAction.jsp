<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.ResultSet"%>
<%@page import="Database.DBConn" %>
         <%

         
	        try{
	            DBConn db=new DBConn();
	            String name=request.getParameter("name");
	            String email=request.getParameter("email");
	            String mobile=request.getParameter("mobile");
	            String ll=request.getParameter("ll");
	            String dob=request.getParameter("dob");
	            String gender=request.getParameter("gender");
	            String postalAdress=request.getParameter("postalAdress");
	            String zip=request.getParameter("zip");  
	            String educationalQualfication=request.getParameter("postalAdress");
	            String designation=request.getParameter("designation");
	            String username=request.getParameter("user_name");
	            String pwd=request.getParameter("pwd");
	        	int i=db.executeUpdate("INSERT INTO qrbs_user(username,email,password_hash,activation_key,user_type,status) VALUES ('"+username+"','"+email+"','"+pwd+"','xxxxxxxxxxx','1','1')");
	            if(i>0){
	            	   ResultSet rset=db.executeQuery("SELECT id FROM qrbs_user WHERE username='"+username+"'");
	            	   while(rset.next()){
	            		   int uid=rset.getInt("id");
	            	   int j=db.executeUpdate("INSERT INTO qrbs_staff(user_id,name,dob,gender,mobile,landline,postal_address,postcode,educationalqualification,designation) VALUES ('"+uid+"','"+name+"','"+dob+"','"+gender+"','"+mobile+"','"+ll+"','"+postalAdress+"','"+zip+"','"+educationalQualfication+"','"+designation+"')");
	            	   if(j>0){
	            		   response.sendRedirect("addNewStaffdetails.jsp?type=Sucess");
	            	   }
	            	   else
	                   {
	                      response.sendRedirect("addNewStaffdetails.jsp?type=fail");
	                   }  
	            	   }
	            }
	            else
	            {
	               response.sendRedirect("addNewStaffdetails.jsp?type=fail");
	            }              
	        }
	        catch(Exception e){
	        }
	        %>
