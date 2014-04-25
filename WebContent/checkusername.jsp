<%@page import="Database.DBConn,java.sql.ResultSet" %>
         <%
                DBConn db=new DBConn();

if (request.getParameter("email")!=null||request.getParameter("username")!=null)
{

    ResultSet rs=db.executeQuery("SELECT* FROM qrbs_user WHERE email='"+request.getParameter("email")+"'OR username='"+request.getParameter("user_name")+"'");
     if(rs.next()){
    	 out.println("false"); 
     }
     else{
         out.println("true");
     }
}
else
{
	out.println("false");
}

%>