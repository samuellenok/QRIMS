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
        padding-bottom: 40px;
      }
    </style>
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/datepicker.css">

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
<%@page contentType="text/html" import="java.util.*,java.text.*" %>
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
              <li class="active"><a href="index.jsp">Home</a></li>
              <li><a href="about.jsp">About Us</a></li>
              <li><a href="contact.jsp">Contact Us</a></li>
              </ul>
        <!-- The drop down menu -->
        <ul class="nav pull-right">

          <li class="divider-vertical"></li>
          <li class="dropdown">
            <a class="dropdown-toggle" href="#" data-toggle="dropdown">Sign In&nbsp; <strong class="caret"></strong></a>
            <div class="dropdown-menu" style="padding: 15px; padding-bottom: 0px;">
              <!-- Login form here -->
              <form action="login.jsp" method="post" accept-charset="UTF-8">
 
  				<input id="user_username" style="margin-bottom: 15px;" type="text" name="userName" size="30" placeholder="Email/Username"/>

  				<input id="user_password" style="margin-bottom: 15px;" type="password" name="password" size="30" placeholder="Password" />
  				<input id="user_remember_me" style="float: left; margin-right: 10px;" type="checkbox" name="remember_me" value="1" />
  				<label class="string optional" for="user_remember_me"> Remember me</label>

  				<input class="btn btn-primary" style="clear: left; width: 100%; height: 32px; font-size: 13px;" type="submit" name="commit" value="Sign In" />
			</form>
            </div>
          </li>
        </ul>
      </div>
    </div>
    </div>
    </div>

    <div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->

    <ul class="breadcrumb">
     <li><a href="index.html">Home</a> <span class="divider">/</span></li>
    <li class="active">Create New Account</li>
    </ul>
      <!-- Example row of columns -->
      <div class="row">

        <div class="span7" >
          
          <form class="form-horizontal" id="registerHere" method='post' action='registeraction.jsp'>
	  <fieldset>
	    <legend>
	    Create New User Account 
	    </legend>
          <p>Please fill following credentials to create a new user account:</p>
	    <div class="control-group">
	      <label class="control-label" for="input01">Name</label>
	      <div class="controls">
	        <input type="text" class="input-xlarge" id="user_name" name="user_name" >
	        
	      </div>
	</div>
	
	 <div class="control-group">
		<label class="control-label" for="input01">Email</label>
	      <div class="controls">
	        <input type="text" class="input-xlarge" id="user_email" name="user_email" >
	       
	      </div>
	</div>
	
	<div class="control-group">
		<label class="control-label" for="input01">Password</label>
	      <div class="controls">
	        <input type="password" class="input-xlarge" id="pwd" name="pwd" >
	       
	      </div>
	</div>
	<div class="control-group">
		<label class="control-label" for="input01">Confirm Password</label>
	      <div class="controls">
	        <input type="password" class="input-xlarge" id="cpwd" name="cpwd" >
	       
	      </div>
	</div>
	<div class="control-group">
		<label class="control-label" for="input01">Birthday</label>
		<% DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
				String formattedDate = df.format(new Date());
				
				%>
	      <div class="controls">
	         <input id="dob" name="dob" class="span2" type="text" value="" readonly="readonly" data-date-format="dd-mm-yyyy">
             </div>
             
    </div>
	
	 <div class="control-group">
		<label class="control-label" for="input01">Gender</label>
	      <div class="controls">
	        <select name="gender" id="gender" >
            				<option value="">Gender</option>
			                <option value="male">Male</option>
			                <option value="female">Female</option>
			<option value="other">Other</option>
			               
			              </select>
	       
	      </div>
	
	</div>
	
	
	<div class="control-group">
		<label class="control-label" for="input01"></label>
	      <div class="controls">
	       <button type="submit" class="btn btn-primary" >Create My Account</button>
	       
	      </div>
	
	</div>
	
	
	   
	  </fieldset>
	</form>
        </div> 
              <div class="span5" >
      <img src="assets/img/register.png" ></img>
      </div>      
      </div>

      <hr>

      <footer>
        <p>&copy; Company 2012<br/>All Rights Reserved</p>
      </footer>

    </div> <!-- /container -->

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
			
			$("#registerHere").validate({
				rules:{
					user_name:"required",
					user_email:{
							required:true,
							email: true
						},
					pwd:{
						required:true,
						minlength: 6
					},
					cpwd:{
						required:true,
						equalTo: "#pwd"
					},
					dob:"required",
					gender:"required"
				},
				messages:{
					user_name:"Enter your first and last name",
					user_email:{
						required:"Enter your email address",
						email:"Enter valid email address"
					},
					pwd:{
						required:"Enter your password",
						minlength:"Password must be minimum 6 characters"
					},
					cpwd:{
						required:"Enter confirm password",
						equalTo:"Password and Confirm Password must match"
					},
					dob:"Select your Birthday",
					gender:"Select Gender"
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
		});
	  </script>


  </body>
</html>
