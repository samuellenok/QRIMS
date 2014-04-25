<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*,java.util.*,java.util.Date,java.util.Calendar,java.text.DateFormat"%>
<%@page import="Database.DBConn"%>
<%
if(session.getAttribute("userName")==null)
    response.sendRedirect("index.jsp");
else {
	DBConn db=new DBConn();
	ResultSet rss=db.executeQuery("SELECT * FROM qrbs_user WHERE username='"+session.getAttribute("userName")+"' AND user_type =0");
    if(rss.next()){
        if(request.getParameter("id")!=null){	
%>
    <% 
     String x="",x1="",name="";
     String fPurchaseAmount="",fSalesAmount=""; 
     int amount,amount1;
     Date d,d1;
     int l;
     for(int i=0; i<=10;i++)
     {      
        l=0;
        Calendar cal = Calendar.getInstance();
        int daysToDecrement = -i;
        cal.add(Calendar.DATE, daysToDecrement);
        d= cal.getTime();
        DateFormat dF=new SimpleDateFormat("yyyy-MM-dd");
        String date=dF.format(d);
        String xdate=new SimpleDateFormat("MM/dd").format(d);
        x=x+"'"+xdate+"',";
        ResultSet rs1=db.executeQuery("SELECT * FROM qrbs_products WHERE id='"+request.getParameter("id")+"'");
        if(rs1.next()){
            name=rs1.getString("name");
            List<String> asList=new ArrayList();
            ResultSet rs=db.executeQuery("SELECT * FROM qrbs_sales_item WHERE product_id='"+request.getParameter("id")+"' && DATE(create_date)='"+date+"'");
            while(rs.next()){
                l+= rs.getInt("qty");     
            }
            fSalesAmount=fSalesAmount+""+l+".0,";;
        }
     }
    %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>QRBillingSystem_Server</title>
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
    </style>
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="assets/ico/favicon.ico">

    <script src="assets/js/jquery.min.js"></script>
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
	<script type='text/javascript'>//<![CDATA[ 
	$(function () {
	        $('#container').highcharts({
	            chart: {
	                type: 'column'
	            },
	            title: {
	                text: 'Product Analysis'
	            },
	            subtitle: {
	                text: 'QRIMS Database'
	            },
	            xAxis: {
	                categories: [<%= x %>]
	            },
	            yAxis: {
	                min: 0,
	                title: {
	                    text: 'No.Units'
	                }
	            },
	            tooltip: {
	                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
	                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
	                    '<td style="padding:0"><b>{point.y:.1f} units</b></td></tr>',
	                footerFormat: '</table>',
	                shared: true,
	                useHTML: true
	            },
	            plotOptions: {
	                column: {
	                    pointPadding: 0.2,
	                    borderWidth: 0
	                }
	            },
	            series: [{
	                name: '<%=name%>',
	                data: [<%=fSalesAmount %>]
	            }]
	        });
	    });
	//]]>  
	</script>
  </head>
  <body>
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
               <li class="active"><a href="adminHome.jsp">Home</a></li>           
               <li><a href="product.jsp" >Product </a></li>
               <li><a href="staff.jsp" >Staff </a></li>
               <li><a href="sales.jsp" >Sales </a></li>
               <li><a href="purchase.jsp" >Purchase </a></li>
               <li><a href="supplier.jsp" >Supplier </a></li>               
               <li ><a href="category.jsp" >Categories </a></li>
            </ul>
        <!-- The drop down menu -->
        <ul class="nav pull-right">
          <li class="divider-vertical"></li>          
          <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%= session.getAttribute( "userName" )%> <b class="caret"></b></a>
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
    <div class="container">
      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="hero-unit">
        <img height="250px" src="assets/img/hero.png">
      </div>
    <ul class="breadcrumb">
    <li class="active">Home</li>
    </ul>
      <!-- Example row of columns --> 
      <div class="row">

        
        <div >
          
        <div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
        </div>

      <hr>

      <footer>
        <p>&copy; Company 2012<br/>All Rights Reserved</p>
      </footer>

    </div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/js/bootstrap-dropdown.js"></script>
    <script src="assets/js/js/highcharts.js"></script>
    <script src="assets/js/js/exporting.js"></script>
  </body>
</html>
<%
    }
    db.close(); 
}else{
	response.sendRedirect("index.jsp");
	
}
}%>