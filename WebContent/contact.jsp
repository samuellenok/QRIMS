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
             <li><a href="index.jsp">Home</a></li>
              <li><a href="about.jsp">About Us</a></li>
              <li  class="active"  ><a href="contact.jsp">Contact Us</a></li>
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
    <li class="active">Contact Form</li>
    </ul>
      <!-- Example row of columns -->
      <div class="row">
      <section class="span6">
			<form id="contact" method='post' action=''>
			<div class="control-group">
			<label class="control-label" for="inputEmail">
			<i class="icon-user"></i>
			Full Name
			</label>
			<div class="controls controls-row">
			<input id="inputName" name="inputName" class="input-xxlarge" type="text" placeholder="Cool Person">
			</div>
			</div>
			<div class="control-group">
			<label class="control-label" for="inputEmail">
			<i class="icon-envelope"></i>
			Email
			</label>
			<div class="controls">
			<input id="inputEmail" name="inputEmail" class="input-xxlarge" type="text" placeholder="you@yourdomain.com">
			</div>
			</div>
			<div class="control-group">
			<label class="control-label" for="inputEmail">
			<i class="icon-question-sign"></i>
			Subject
			</label>
			<div class="controls">
			<input id="inputSubject" class="input-xxlarge" type="text" placeholder="what's up?">
			</div>
			</div>
			<div class="control-group">
			<label class="control-label" for="inputEmail">
			<i class="icon-pencil"></i>
			Message
			</label>
			<div class="controls">
			<textarea name="message" class="input-xxlarge" placeholder="What's on your mind?" rows="6"></textarea>
			</div>
			</div>
			<div class="control-group">
			<div class="controls">
			<button class="btn btn-success" type="submit">Send Message</button>
			</div>
			<br class="clear">
			</div>
			</form>
		</section>
		<section class="span6">

<iframe width="100%" draggable="false" scrolling="no" height="350"  src="https://maps.google.com/maps?f=q&source=s_q&hl=en&geocode=&q=new+york+city&aq=&sll=37.6,-95.665&sspn=60.867771,135.263672&t=m&ie=UTF8&hq=&hnear=New+York&z=11&iwloc=A&output=embed" ></iframe>

</section>
		
		
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
			
			$("#contact").validate({
				rules:{
					inputName:"required",
					inputEmail:{
						required:true,
						email: true
					},
					message:"required"
					
				},
				messages:{
					inputName:"Enter your FullName",
					inputEmail:{
						required:"Enter your email address",
						email:"Enter valid email address"
					},
					message:"This Field cannot be blank"
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
