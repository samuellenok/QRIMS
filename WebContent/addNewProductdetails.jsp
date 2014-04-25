    <%@page import="java.sql.ResultSet"%>
    <%@page import="Database.DBConn"%>
    <%
if(session.getAttribute("userName")==null)
    response.sendRedirect("index.jsp");
else {
    DBConn db=new DBConn();
    ResultSet rss=db.executeQuery("SELECT * FROM qrbs_user WHERE username='"+session.getAttribute("userName")+"' AND user_type =0");
    if(rss.next()){

        
%>
<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <title>QRBillingSystem_Server_Edit Product</title>
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
      a.plain:link
	{ color: #333; text-decoration: none }
	a.plain:active
	{ color: #333; text-decoration: none }
	a.plain:visited
	{ color: #333; text-decoration: none }
	a.plain:hover
	{ color: #333; text-decoration: none }
    </style>
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
    </head>

<body data-spy="scroll" data-target=".subnav" data-offset="50">

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
                    <li><a href="product.jsp">Products</a></li>
                    <li><a href="adminHome.jsp">Home</a></li>
                </ul>

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
                  <li><a href="#">Logout</a></li>
                  <li><a href="#">One more separated link</a></li>
                </ul>
              </li>
          
          
          

        </ul>

            </div>
        </div>
    </div>
</div></div>

<div class="container">

    <div class="row">
                <%if(request.getParameter("type")!=null){
            
            if(request.getParameter("type").startsWith("Sucess")){%> 
                 <div class="alert alert-sucess">
                   Sucess :Entered data Sucessfully inserted into database.
                 </div>
                <% }
                else if(request.getParameter("type").startsWith("fail")){%>

                <div class="alert alert-error">
                  Error :Error in inserting into database
                </div>
              <% } }%>
    <form id="form" class="form-horizontal span12" action="addProductdetailsAction.jsp" method="post">
        <fieldset>
            <legend>Product Details</legend>
            <br>
            <div class="row">
                <div class="span9">
                    <div class="control-group">
                        <label for="name" class="control-label">Name:</label>

                        <div class="controls">
                            <input id="name" name="name" placeholder="name of product" type="text">
                            <span class="help-inline"></span>
                        </div>
                    </div>

                    <div class="control-group">
                        <label for="catList" class="control-label">Category</label>
                        <div class="controls">
                            <%
						/*	 DBConn db=new DBConn();*/
							 ResultSet rs=db.executeQuery("SELECT* FROM qrbs_category");
    					%>    
    					<select name="catList" class="span2">
    					<%while(rs.next()){%>
    					<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%> </option><%}%>
						</select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label for="brand" class="control-label">Brand/Manufacturer:</label>

                        <div class="controls">
                            <input id="brand" name="brand" placeholder="Name of Manufacturer" type="text">
                            <span class="help-inline"></span>
                        </div>
                    </div>

                    <div class="control-group">
                        <label for="reOrderLevel" class="control-label">Re-Order Level:</label>

                        <div class="controls">
                            <input id="reorderlevel" name="reorderlevel"  type="text">
                        </div>
                    </div>

                    <div class="control-group">
                        <label for="supplier" class="control-label">Supplier:</label>
						<%	 DBConn db1=new DBConn();
							 ResultSet rs1=db1.executeQuery("SELECT* FROM qrbs_supplier");
    					%>   
                        <div class="controls">
                            <select class="span2" id="supplier" name="supplier" >
                             <%while(rs1.next()){%>
    					<option value="<%=rs1.getString(1)%>"><%=rs1.getString(2)%> </option>
    					<% } %>
						</select>
                        </div>
                    </div>

                    

                </div>

                <div class="span3">
                    <div class="well">
                        <p><img id="picture" src="" width="180"></p>

                        <p>QR image will be uploaded by Staff from Android app</p>
                    </div>
                </div>

            </div>

        </fieldset>

        <div class="form-actions">
            <input type="submit" class="btn btn-primary save" value="Save"></input>
              <input type="reset" class="btn delete" value="Reset"></input>
        </div>

    </form></div>

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

 <script type="text/javascript" src="assets/js/jquery.validate.js"></script>  

      <script type="text/javascript">
      $(document).ready(function(){
            
            $("#form").validate({
                rules:{
                    name:{
                    	required:true,
                    	regex: "^[a-zA-Z 0-9]+$"
                    },
                    catList:"required",
                    brand:"required",
                    reorderlevel:"required",
                    stock:"required",
                    supplier:"required",
                   
                },
                messages:{
                    name:{
                        required:"Enter user name",
                        regex:"Invalid characters",
                    },
                },
                
                errorClass: "help-inline",
                errorElement: "div",
                highlight:function(element, errorClass, validClass) {
                    $(element).parents('.control-group').addClass('error');
                },
                unhighlight: function(element, errorClass, validClass) {
                    $(element).parents('.control-group').removeClass('error');
                    $(element).parents('.control-group').addClass('success');
                }
            });
        });
      </script>
</body></html>
<%db.close(); 
}else{
    response.sendRedirect("index.jsp");
    
}
    }%>