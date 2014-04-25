<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>QRBillingSystem_Server_Add Product</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- styles -->
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
		color: #333; text-decoration: none 
		}
		a.plain:hover{ 
		color: #333; text-decoration: none 
		}
    </style>
    <link rel="stylesheet" href="assets/css/datepicker.css">
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
				<li class="add-menu"><a href="supplier.jsp">Supplier</a></li>
				<li><a href="adminHome.jsp">Home</a></li>
			</ul>
			<ul class="nav pull-right">
				<li class="divider-vertical"></li>
				<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown"><%= session.getAttribute("userName" )%><b class="caret"></b></a>
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
</div>
</div>
<div class="container">
    <legend>Update Supplier Details</legend>
             <div class="row">
             <%if(request.getParameter("type")!=null){
            	    if(request.getParameter("type").startsWith("Sucess")){%> 
	                 <div class="alert alert-sucess">
	                   Sucess :Entered data Sucessfully inserted into database.
	                 </div>
                <% }else if(request.getParameter("type").startsWith("fail")){%>
	                <div class="alert alert-error">
	                  Error :Error in inserting into database
	                </div>
                <% } 
            }%>
            <div class="span9">
            <%if(request.getParameter("id")!=null){
                    String id=request.getParameter("id");
  
                    DBConn db=new DBConn();
                    ResultSet rs=db.executeQuery("SELECT* FROM qrbs_supplier WHERE id='"+id+"'");
        
                    if(rs.next()){
            %>
            <form class="form-horizontal" id="updateSupplier" name="updateSupplier" method='POST' action='updateSupplierAction.jsp'>
            <%// out.print(request.getParameter("type")); %>
            <fieldset>
                <div class="control-group">
                    <label for="id" class="control-label">ID</label>
                        <div class="controls">
                            <input id="id" name="id" readonly="readonly" value="<%= request.getParameter("id") %>"type="text">
                            <span class="help-inline"></span>
                        </div>
                    </div>
                    <div class="control-group">
	      				<label class="control-label" >Name</label>
	      				<div class="controls">
	        				<input type="text" class="input-xlarge" id="user_name" name="user_name" value="<%= rs.getString(2) %>">
	        			</div>
					</div>
				    <div class="control-group">
						<label class="control-label" >Email</label>
					    <div class="controls">
					        <input type="text" class="input-xlarge" id="user_email" name="user_email" value="<%= rs.getString(5) %>">
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label" >Mobile</label>
					    <div class="controls">
					        <input type="text" class="input-xlarge" id="mob" name="mob" value="<%= rs.getString(3) %>">
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label" >LandLine</label>
					    <div class="controls">
					        <input type="text" class="input-xlarge" id="landline" name="landline" value="<%= rs.getString(4) %>">
					    </div>
					</div>
                    <div class="control-group">
                        <label  class="control-label">Postal Adress</label>
                        <div class="controls">
                            <textarea id="address" name="address" class="span4" rows="4" >
                            <%= rs.getString(6) %>
							</textarea>
                        </div>
                    </div>
					<div class="control-group">
						<label class="control-label" for="input01">Postal Code</label>
					    <div class="controls">
					        <input type="text" class="input-xlarge" id="zip" name="zip" value="<%= rs.getString(7) %>">
					    </div>
					</div>
					<div class="form-actions">
		             	<input type="submit" class="btn btn-primary" value="Save">
		             	<a href="updateSupplierAction.jsp?action=delete&id=<%=rs.getString("id")%>" class="btn delete">Delete</a>
		            </div>
		     </fieldset>
    	</form>
	    </div>
	     
		<div class="span3" style="border:1px;">
	       	<ul class="thumbnails">
				<li class="span3">		
					<div class='preview'><img src="http://chart.apis.google.com/chart?chs=150x150&cht=qr&chl=<%out.print(rs.getString(2)+"\n"+rs.getString(3)+"\n"+rs.getString(4)+"\n"+rs.getString(6)+"\n"+rs.getString(7)+"\n"+rs.getString(7));%>&choe=ISO-8859-1" alt="" height="150" width="125"></img>
					</div> 
				
				</li>
	       	</ul>
	     </div>
		</div>
        
       <% } }
                  else{
            }%>
        
 
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
    <script src="assets/js/bootstrap-datepicker.js"></script>

 <script type="text/javascript" src="assets/js/jquery.validate.js"></script>  

	 <script type="text/javascript">
				$('#dob').datepicker('dd/mm/yyyy');
	 </script>

	  
	   <script type="text/javascript">
	  $(document).ready(function(){
			
			$("#updateSupplier").validate({
				rules:{
					user_name:"required",
					user_email:{
							required:true,
							email: true
						},
					mob:"required",
					landline:"required",
					address:"required",
					zip:"required",
					
				},
				messages:{
					user_name:"Enter your first and last name",
					user_email:{
						required:"Enter your email address",
						email:"Enter valid email address"
					},

				},
				errorClass: "help-inline",
				errorElement: "span",
				highlight:function(element, errorClass, validClass) {
					$(element).parents('.control-group').addClass('error');
				},
				unhighlight: function(element, errorClass, validClass) {
					$(element).parents('.control-group').removeClass('error');
					$(element).parents('.control-group').addClass('success');
				}
			});
		

				
	            $('#photoimg').live('change', function()			{ 
				           $("#preview").html('');
				    $("#preview").html('<img src="assets/img/uploading.gif" alt="Uploading...."/>');
				$("#imageform").ajaxForm({
							target: '#preview'
			}).submit();
			
				});
	        }); 
	  
	
	  </script>
	  
	  
	 <!--   <script type="text/javascript" src="assets/js/jquery.min.js"></script>
	  <script type="text/javascript" src="assets/js/jquery.form.js"></script>

	  <script type="text/javascript" >

	  </script>-->
	  
</body>
</html>
