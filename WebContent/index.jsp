<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>QRIMS_Admin</title>
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
      .loginb a {
        width:  450px;
        height: 280px;
        display: block;
        background-image: url('assets/img/login.png');
        }

    .loginb a:hover {
    background-image: url('assets/img/loginh.png');
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
          <a class="brand" href="#">QRIMS SuperMarket</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
                          <li class="active"><a href="index.jsp">Home</a></li>
              <li><a href="about.jsp">About Us</a></li>
              <li><a href="contact.jsp">Contact Us</a></li>
              </ul>
        <!-- The drop down menu -->
        <ul class="nav pull-right">

          
        </ul>
      </div>
    </div>
    </div>
    </div>

    <div class="container">

      <!-- Main hero unit for a primary marketing message or call to action -->

    <ul class="breadcrumb">
     <li><a href="index.html">Home</a> <span class="divider">/</span></li>
    <li class="active">Login</li>
    </ul>
      <!-- Example row of columns -->
      <div class="row">

      <!-- <img src="assets/img/login.jpg" ></img>
      <ul class="thumbnails">
        <li class="span5">
        <a href="#" class="thumbnail"> -->
        <img src="assets/img/loginh.png" class="pull-right"></img>
       <!--    </a>
        </li>
        </ul> -->
     
        <div class="span6" >
        <%if(request.getParameter("msg")!=null){%>
                <div class="alert alert-error">
                  <%= request.getParameter("msg")%>
                </div>
              <% } %>
          <form class="form-horizontal" id="login" method='post' action='loginAction.jsp' >
	  <fieldset>
	    <legend>
	    Login 
	    </legend>
	  
          <p>Please fill Login details:</p>
	    <div class="control-group">
	      <label class="control-label" for="input01">Username</label>
	      <div class="controls">
	        <input type="text" class="input-xlarge" id="userName" name="userName" >        
	      </div>
	   </div>
	
	<div class="control-group">
		<label class="control-label" for="input01">Password</label>
	      <div class="controls">
	        <input type="password" class="input-xlarge" id="password" name="password" >       
	      </div>
	</div>
	
	
	<p><a href="#" >Forgot Password</a></p>
	<div class="control-group">
		<label class="control-label" for="input01"></label>
	      <div class="controls">
	       <button type="submit" class="btn btn-primary" >Sign In</button>
	       
	      </div>
	
	</div>
	
	
	   
	  </fieldset>
	</form>
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
	  $(document).ready(function(){
			
			$("#login").validate({
				rules:{
					userName:"required",
					pwd:{
						required:true,
						minlength: 6
					},
				},
				messages:{
					userName:"Enter your username",
					pwd:{
						required:"Enter your password",
						minlength:"Password must be minimum 6 characters"
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


  </body>
</html>
