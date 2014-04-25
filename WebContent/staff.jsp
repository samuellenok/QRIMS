<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*,java.util.Date,java.util.Calendar,java.text.DateFormat"%>
<%@page import="Database.DBConn"%>
<%
if(session.getAttribute("userName")==null)
    response.sendRedirect("index.jsp");
else {
    DBConn db=new DBConn();
    ResultSet rss=db.executeQuery("SELECT * FROM qrbs_user WHERE username='"+session.getAttribute("userName")+"' AND user_type =0");
    if(rss.next()){

        
%>
<%
String pno=request.getParameter("pno"); // this will be coming from url
int pageno=0;
if(pno==null)
{
pageno=1;
}
else if(Integer.parseInt(pno)>0)
{
pageno=Integer.parseInt(pno);
}
int next=pageno+1;
int previous=pageno-1;
//for getting total rows
%>




<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>QRBillingSystem_Server_staff</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 60px;
      }
      a.plain:link{ 
      	color: #333; 
      	text-decoration: none 
      }
	  a.plain:active{ 
	  	color: #333; 
	  	text-decoration: none 
	  }
	  a.plain:visited{ 
	  	color: #333; 
	  	text-decoration: none 
	  }
	  a.plain:hover{ 
	  	color: #333; 
	  	text-decoration: none 
	  }
    </style>
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
	<%@page import="java.sql.ResultSet"%>
	<%@page import="Database.DBConn"%>
    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
    </head>
     <%
      //   DBConn db=new DBConn();
         ResultSet rs=db.executeQuery("SELECT* FROM qrbs_staff");
         
    %>
<body>

<div class="header">
<div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#">MY SuperMarket</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
                    <li class="add-menu"><a href="addNewStaffdetails.jsp"><i class="icon-edit icon-white"></i> Add staff</a></li>
                    <li><a href="adminHome.jsp">Home</a></li>
                </ul>

               	<ul class="nav pull-right">
               		<li class="divider-vertical"></li>
               		<li class="dropdown">
		                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%= session.getAttribute( "userName" )%><b class="caret"></b></a>
		                <ul class="dropdown-menu">
		                  <li><a href="#">Account Settings</a></li>
		                  <li><a href="#">EditProfile</a></li>
		                  <li><a href="#">Change Password</a></li>
		                  <li class="divider"></li>
		                  <li class="nav-header"></li>
		                  <li><a href="logout.jsp">Logout</a></li>
		                  <li><a href="#">One more separated link</a></li>
		                </ul>
              		</li>
          		</ul>
            </div>
        </div>
    </div>
</div>
</div>
<div class="container">
    <div class="row">
    <legend>Staff Details</legend>
        <div id="content" class="span12&gt;">
        <div>
         
        <ul class="thumbnails">
         <%
         while(rs.next()){ %>
        <li class="span3">
        
	        <a href="updateStaffDetails.jsp?id=<%= rs.getString(1) %>" class="thumbnail plain">
	     	<img src="http://chart.apis.google.com/chart?chs=150x150&cht=qr&chl=<%out.print(rs.getString(3)+"\n"+rs.getString(6)+"\n"+rs.getString(7)+"\n"+rs.getString(11)+"\n"+rs.getString(8)+"\n"+rs.getString(9));%>&choe=ISO-8859-1" alt="" height="150" width="125"></img>
	    		<p align="center"><%= rs.getString(3) %><br><%= rs.getString(4)%><%= rs.getString(5) %><br>
	    		<i class="icon-view"></i> <%= rs.getString(10)%><br><%= rs.getString(11)%></p>
			</a>
			
		</li>
		<%} %>
		</ul>
		
		<div class="pagination pagination-centered"><ul><li class="active"><a href="#wines/page/1">1</a></li><li><a href="#wines/page/2">2</a></li><li><a href="#wines/page/3">3</a></li></ul></div></div></div>
    </div>

    <footer class="footer">
  <p>&copy; Company 2012<br/>All Rights Reserved</p>
    </footer>

</div>

<!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap-transition.js"></script>
    <script src="assets/js/bootstrap-alert.js"></script>
    <script src="assets/js/bootstrap-modal.js"></script>
    <script src="assets/js/bootstrap-dropdown.js"></script>
    <script src="assets/js/bootstrap-scrollspy.js"></script>
    <script src="assets/js/bootstrap-tab.js"></script>
    <script src="assets/js/bootstrap-tooltip.js"></script>
    <script src="assets/js/bootstrap-popover.js"></script>
    <script src="assets/js/bootstrap-button.js"></script>
    <script src="assets/js/bootstrap-collapse.js"></script>
    <script src="assets/js/bootstrap-carousel.js"></script>
    <script src="assets/js/bootstrap-typeahead.js"></script>



</body></html><%db.close(); 
}else{
    response.sendRedirect("index.jsp");
    
}
    }%>
