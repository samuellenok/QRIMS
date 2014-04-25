<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!--jsp:useBean id="db" class="Database.Dbcon" /-->
<%@page import="Database.DBConn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
        DBConn db=new DBConn("qrbs","root","root");
        String userName=request.getParameter("userName");
        String password=request.getParameter("password");
        try{
        	ResultSet rs;
        	if (userName.contains("@")) {
        		  rs=db.executeQuery("SELECT* FROM qrbs_user WHERE email='"+userName+"' and password='"+password+"'");
    		} else {
    				  rs=db.executeQuery("SELECT* FROM qrbs_user WHERE username='"+userName+"' and password_hash='"+password+"'");
    		}

           if(rs.next()){
        	   if(rs.getString("status").equals("0")){
                   response.sendRedirect("index.jsp?msg=your account is inactive ");
               }else{
        	   session.setAttribute("userName", userName);
        	   session.setAttribute("user_id", rs.getString("id"));
               String type=rs.getString("user_type");
               if(type.equals("0")){
                    response.sendRedirect("adminHome.jsp");
               }else if(type.equals("1")){
            	    response.sendRedirect("staffHome.jsp");
               }
               else{
                   response.sendRedirect("index.jsp?msg=Access violation");
               }
           }
          
       }
       else
                     {
           response.sendRedirect("index.jsp?msg=invalid username or password combination");
       }
        
               }
               
               catch(Exception e){
            	  out.print(e.toString());
               }
       %>
</body>
</html>