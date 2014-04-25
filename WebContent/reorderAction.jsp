<%@page contentType="text/html" import="java.util.*,java.text.*,java.net.*,java.io.*" %>
<%@page import="Database.DBConn" %>
<%             
HttpURLConnection connection = null;  
PrintWriter outWriter = null;  
BufferedReader serverResponse = null;  
StringBuffer buff = new StringBuffer();
String line; 
try  
{  
//OPEN CONNECTION  
    connection = ( HttpURLConnection ) new URL( "http://daniqrims.site40.net/mail.php").openConnection();  

//SET REQUEST INFO  
    connection.setRequestMethod( "POST" );  
    connection.setDoOutput( true );  
//CREATE A WRITER FOR OUTPUT  
    outWriter = new PrintWriter( connection.getOutputStream() );  
//PARAMETERS  
    buff.append( "message=" );   
    buff.append( URLEncoder.encode( request.getParameter("description"), "UTF-8" ) );  
    buff.append( "to=" );   
    buff.append( URLEncoder.encode( request.getParameter("to"), "UTF-8" ) );  
//SEND PARAMETERS  
    outWriter.println( buff.toString() );  
    outWriter.flush();  
    outWriter.close(); 
//RESPONSE STREAM  
    serverResponse = new BufferedReader( new InputStreamReader( connection.getInputStream() ) );  
//READ THE RESPOSNE  
   
    while ( (line = serverResponse.readLine() ) != null ){  
        System.out.println( line );  
    }  
    response.sendRedirect("reorder.jsp?type=Sucess&id="+request.getParameter("id"));
}catch (MalformedURLException mue){  
    mue.printStackTrace();
    response.sendRedirect("reorder.jsp?type=fail&id="+request.getParameter("id"));
}catch (IOException ioe){  
    ioe.printStackTrace(); 
    response.sendRedirect("reorder.jsp?type=fail&id="+request.getParameter("id"));
}catch (Exception e) {
	e.printStackTrace();
	response.sendRedirect("reorder.jsp?type=fail&id="+request.getParameter("id"));
}finally{  
    if ( connection != null )  
         connection.disconnect();   
    if ( serverResponse != null ){  
        try { 
             serverResponse.close();
             }catch (Exception ex) {
            	 ex.printStackTrace();
             }  
    }  
}
                             
                                    
%>