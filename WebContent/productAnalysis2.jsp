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
    <% /*String x="";
    Calendar calendar=Calendar.getInstance();
    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("dd/MM");
    String formattedDateToday="";
    for(int i=0; i<=30;i++) {
    	int daysToDecrement = -i;
    	calendar.add(Calendar.DATE, daysToDecrement);
    formattedDateToday=simpleDateFormat.format(calendar.getTime());
         x=x+"'"+formattedDateToday+"',";
    }*/
    %>
    <% String x="",x1="",name="";
    String fPurchaseAmount="",fSalesAmount=""; 
     int amount,amount1;
     Date d,d1;
     
     int l;
	for(int i=0; i<=10;i++)
	{      l=0;
		Calendar cal = Calendar.getInstance();
		int daysToDecrement = -i;
		cal.add(Calendar.DATE, daysToDecrement);
		d= cal.getTime();
		DateFormat dF=new SimpleDateFormat("yyyy-MM-dd");
		
		String date=dF.format(d);
		String xdate=new SimpleDateFormat("MM/dd").format(d);
		x=x+"'"+xdate+"',";
		//out.println(date+"--\n");
	/* 	amount=0;
		ResultSet rs=db.executeQuery("SELECT * FROM qrbs_purchase WHERE  DATE(create_date)='"+date+"'");
		while(rs.next()){
			//out.println("amount**"+amount+"--\n");
			amount+=((rs.getInt("price_perunit")+rs.getInt("tax_per_unit"))*rs.getInt("no_of_units"))-rs.getInt("discount");
			//out.println("amount**"+amount+"--\n");
		}
		rs.close();
		//db.con.close();
		   fPurchaseAmount+=amount+",";
	}
    for(int j=0; j<=30;j++)
    {
        Calendar cal1 = Calendar.getInstance();
        int daysToDecrement1 = -j;
        cal1.add(Calendar.DATE, daysToDecrement1);
        d1= cal1.getTime();
        DateFormat dF1=new SimpleDateFormat("yyyy-MM-dd");
        
        String date=dF1.format(d1);
        String xdate1=new SimpleDateFormat("MM/dd").format(d1);
        x1=x1+"'"+xdate1+"',";
        //out.println(date+"--\n");
        amount1=0;
        ResultSet rs1=db.executeQuery("SELECT * FROM qrbs_sales_item WHERE  DATE(create_date)='"+date+"'");
        while(rs1.next()){
            //out.println("amount**"+amount+"--\n");
            amount1+=((rs1.getInt("price")+rs1.getInt("tax_percentage"))*rs1.getInt("qty"))-rs1.getInt("discount");
            //out.println("amount**"+amount+"--\n");
        }
        rs1.close();
           fSalesAmount+=amount1+",";
    } */
   
        /*DBConn db=new DBConn();
        Calendar cal = Calendar.getInstance();
        Date d= cal.getTime();
        DateFormat dF=new SimpleDateFormat("yyyy-MM-dd");
        String date=dF.format(d);
        int amount=0;*/
        ResultSet rs1=db.executeQuery("SELECT * FROM qrbs_products WHERE id='"+request.getParameter("id")+"'");
        if(rs1.next()){
        	name=rs1.getString("name");
        List<String> asList=new ArrayList();
        ResultSet rs=db.executeQuery("SELECT * FROM qrbs_sales_item WHERE product_id='"+request.getParameter("id")+"' && DATE(create_date)='"+date+"'");
        //out.println("\nSELECT * FROM qrbs_sales_item WHERE product_id='"+request.getParameter("id")+"'& DATE(create_date)='"+date+"'");
        while(rs.next()){
            //   amount+=((rs.getInt("price")+rs.getInt("tax_percentage"))*rs.getInt("qty"))-rs.getInt("discount");
               /*String[] city = rs1.getArray("product_id");*/
              // out.println("product"+rs.getInt("product_id"));
              // out.println("amount**"+amount+"--\n");
              l+= rs.getInt("qty");
              //(int k=0;k<l;i++){
               //asList.add(rs.getInt("product_id")+"");
             // }
        }
        fSalesAmount=fSalesAmount+"'"+l+".0',";;
       // Collections.frequency(asList,rs1.getString("product_id"));
     // fSalesAmount=fSalesAmount+"'"+Collections.frequency(asList,request.getParameter("id"))+"',";
    }

        }

%>
 

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
<!--       <div class="span8"><div style="float:left"><img src="assets/img/lw.png"></img></div> -->
      
<%--       <% ResultSet rs1=db.executeQuery("SELECT * FROM qrbs_products WHERE stock<reorderlevel"); --%>
<!--      %> -->
<!--        <ul class="thumbnails"> -->
<%--          <%while(rs1.next()){ %> --%>
<!--         <li class="span3"> -->
<%--             <a href="reorder.jsp?id=<%= rs1.getString(1) %>" class="thumbnail plain"> --%>
<%--             <img src="http://chart.apis.google.com/chart?cht=qr&chl=<%= rs1.getString(8) %>&chs=120x120" alt="" height="150" width="125"> --%>
<%--             <p align="center"><%= rs1.getString(2) %><br> --%>
<%--             <i class="icon-globe"></i> <%= rs1.getString(4) %> <br>stock:<%= rs1.getString(6) %><br/> --%>
<%--             <input type="button" class="btn" src="reorder.jsp?id=<%= rs1.getString(1) %>" value="reorder"></input> --%>
<!--             </p> -->
            
<!--             </a> -->
            
<!--         </li> -->
<%--         <%} %> --%>
<!--         </ul> -->
<!--     </div><p></p><br/></div><p></p><br/> -->
<!--       <div class="row"> -->
     

       <!--  <div class="span4" >
         <div class="span3">
          <h2>Latest News</h2>
          <marquee direction="up" >
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn" href="#">View details &raquo;</a></p>
          </marquee>
          </div>
        </div>-->
        
        <div >
          <script src="assets/js/js/highcharts.js"></script>
<script src="assets/js/js/exporting.js"></script>
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

     <script src="assets/js/bootstrap-transition.js"></script>
<!--   <!-- <script src="assets/js/bootstrap-transition.js"></script> -->
<!--     <script src="assets/js/bootstrap-alert.js"></script> -->
<!--     <script src="assets/js/bootstrap-modal.js"></script> -->
<!--     <script src="assets/js/bootstrap-dropdown.js"></script> -->
<!--     <script src="assets/js/bootstrap-scrollspy.js"></script> -->
<!--     <script src="assets/js/bootstrap-tab.js"></script> -->
<!--     <script src="assets/js/bootstrap-tooltip.js"></script> -->
<!--     <script src="assets/js/bootstrap-popover.js"></script> -->
<!--     <script src="assets/js/bootstrap-button.js"></script> -->
<!--     <script src="assets/js/bootstrap-collapse.js"></script> -->
<!--     <script src="assets/js/bootstrap-carousel.js"></script> -->
<!--     <script src="assets/js/bootstrap-typeahead.js"></script>--> -->
    <script src="assets/js/js/jquery.min.js"></script>
<!--     <script src="assets/js/bootstrap-dropdown.js"></script> -->
  <!--   <script src="assets/js/highcharts.js"></script>
    <script src="assets/js/exporting.js"></script> -->
    
  <%-- <script type='text/javascript'>//<![CDATA[ 

$(function () {
        $('#container').highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: 'Monthly Average Rainfall'
            },
            subtitle: {
                text: 'Source: WorldClimate.com'
            },
            xAxis: {
                categories: [<%= x %>]
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Rainfall (mm)'
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
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
                name: 'Purchase',
                data: [<%=fPurchaseAmount %>]
            }, {
                name: 'Sales',
                data: [<%=fSalesAmount %>]
            }]
        });
   
});
//]]>  

</script>   --%>

  </body>
</html>
<%
    }
    db.close(); 
}else{
	response.sendRedirect("index.jsp");
	
}
    }%>