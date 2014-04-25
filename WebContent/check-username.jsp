<%@page contentType="text/html" import="java.util.*,java.text.*,java.sql.*" %>
<%@page import="Database.DBConn,com.google.gson.Gson;" %>
<%
DBConn db=new DBConn();
String name = request.getParameter("username");
ResultSet rs=db.executeQuery("SELECT* FROM qrbs_user WHERE email='"+name+"' OR username='"+name+"'");
if(rs.next())
{
	   String json = new Gson().toJson(false); // anyObject = List<Bean>, Map<K, Bean>, Bean, String, etc..
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);
}
else 
{

    String json = new Gson().toJson(true); // anyObject = List<Bean>, Map<K, Bean>, Bean, String, etc..
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    response.getWriter().write(json);
}
%>
