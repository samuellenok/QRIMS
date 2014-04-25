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
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>QRBillingSystem_Server_Add Category</title>
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
				<li class="add-menu"><a href="category.jsp">Categories</a></li>
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
    <legend>Category Details</legend>
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
              <% } 
            }%>
            <div class="span9">
            

               <form class="form-horizontal" id="addCategory" name="addCategory" method='post' action='addCategorydetailsAction.jsp'>
               <fieldset>
                    <div class="control-group">
	      				<label class="control-label" >Name</label>
	      				<div class="controls">
	        				<input type="text" class="input-xlarge" id="name" name="name" >
	        			</div>
					</div>
					 
                    <div class="control-group">
                        <label  class="control-label">Description</label>
                        <div class="controls">
                            <textarea id="description" name="description" class="span6" rows="6">
							</textarea>
                        </div>
                    </div>
					<div class="form-actions">
		             	<button type="submit" class="btn btn-primary" >Save</button>
		            </div>
		        </fieldset>
    	</form>
	    </div>
	     
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
    <script src="assets/js/bootstrap-datepicker.js"></script>
    <script src="assets/js/prettify.js"></script>
    <script type="text/javascript" src="assets/js/jquery.validate.js"></script>  

	 <script type="text/javascript">
				$('#dob').datepicker('dd/mm/yyyy');
	 </script>

	  
	   <script type="text/javascript">
	  $(document).ready(function(){
			
			$("#addCategory").validate({
				rules:{
					
					name:{
                        required:true,
                        remote: {
                            url: "checkcategory.jsp",
                            type: "get",
                            data: {
                            action: function () {
                                return "check";
                            },
                            check: function() {
                                var name = $("#name").val();
                                return name;
                            }
                            }
                        }
        
                      
                    },
					description:"required"
				},
				messages:{
                    remote:"This category exixst!!",
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
	  
	<!--   
	  <script type="text/javascript" src="assets/js/jquery.min.js"></script>
	  <script type="text/javascript" src="assets/js/jquery.form.js"></script>

	  <script type="text/javascript" >

	  </script>
	   -->
</body>
</html>
<%db.close(); 
}else{
    response.sendRedirect("index.jsp");
    
}
    }%>