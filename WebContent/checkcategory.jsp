<%@page import="Database.DBConn,java.sql.ResultSet" %>
<%
DBConn db=new DBConn();
if (request.getParameter("email")!=null||request.getParameter("username")!=null)
{
    ResultSet rs=db.executeQuery("SELECT* FROM qrbs_category WHERE name='"+request.getParameter("name")+"'");
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