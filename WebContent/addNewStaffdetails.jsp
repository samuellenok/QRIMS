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
				<li class="add-menu"><a href="staff.jsp">Staff</a></li>
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
    <legend>Staff Details</legend>
            <div class="row">
            <div class="span9">
               <form class="form-horizontal" id="addStaff" name="addStaff" method='post' action='addStaffdetailsAction.jsp'>
               <fieldset>
                    <div class="control-group">
	      				<label class="control-label" >Name</label>
	      				<div class="controls">
	        				<input type="text" class="input-xlarge" id="name" name="name" placeholder="name of staff">
	        			</div>
					</div>
					 <div class="control-group">
						<label class="control-label" >Email</label>
					    <div class="controls">
					        <input type="text" class="input-xlarge" id="email" name="email" placeholder="email of staff eg:name@example.com" >
					    </div>
					</div>
					<div class="control-group">
                        <label class="control-label" for="input01">Mobile</label>
                        <div class="controls">
                            <input type="text" class="input-xlarge" id="mobile" name="mobile"  placeholder="mobile number of staff" >
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="input01">Landline</label>
                        <div class="controls">
                            <input type="text" class="input-xlarge" id="ll" name="ll"  placeholder="land line number of staff" >
                        </div>
                    </div>
					<div class="control-group">
						<label class="control-label" for="input01">Birthday</label>
					    <div class="controls">
					         <input id="dob" name="dob" class="span2" type="text" value="" readonly="readonly" data-date-format="yyyy-mm-dd" " placeholder="yyyy-mm-dd">
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
                        <label  class="control-label">Postal Adress</label>
                        <div class="controls">
                            <textarea id="postalAdress" name="postalAdress" class="span6" rows="6">
							</textarea>
                        </div>
                    </div>
					<div class="control-group">
						<label class="control-label" for="input01">Postal Code</label>
					    <div class="controls">
					        <input type="text" class="input-xlarge" id="zip" name="zip" placeholder="zip code-xxxxxx"  >
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">Educational Qualification</label>
					    <div class="controls">
					        <input type="text" class="input-xlarge" id="educationalQualfication" name="educationalQualfication"  placeholder="basic educational qualification">
					    </div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">Designation</label>
					    <div class="controls">
					        <input type="text" class="input-xlarge" id="designation" name="designation"  placeholder="designation to which the staff is appointed" >
					    </div>
					</div>
					<div class="control-group">
                        <label class="control-label" for="input01">User Name</label>
                        <div class="controls">
                            <input type="text" class="input-xlarge" id="user_name" name="user_name"  placeholder="user name for staff " >
                        </div>
                    </div>
          
                    <div class="control-group">
                        <label class="control-label" >Password</label>
                        <div class="controls">
                            <input type="password" class="input-xlarge" id="pwd" name="pwd" placeholder="password for staff" >
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" >Confirm Password</label>
                        <div class="controls">
                            <input type="password" class="input-xlarge" id="cpwd" name="cpwd" placeholder="confirm password for staff">
                        </div>
                    </div>
					<div class="form-actions">
		             	<button type="submit" class="btn btn-primary" >Save</button>
		            </div>
		        </fieldset>
    	</form>
	    </div>
	     
		<div class="span3" style="border:1px;">
	       	<ul class="thumbnails">
				<li class="span3">		
					<div id='preview'>
					</div> 
				<form id="imageform" method="post" enctype="multipart/form-data" action="upload.jsp">
					<span class="btn btn-success fileinput-button">
						<i class="icon-plus icon-white"></i>
						<span>Upload Image</span>
						<input type="file" name="photoimg" id="photoimg" >
					</span>
				</form>
				</li>
	       	</ul>
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
				$('#dob').datepicker('yyyy-mm-dd');
	 </script>

	  
	   <script type="text/javascript">
	  $(document).ready(function(){
          $('#photoimg').live('change', function(){ 
              $("#preview").html('');
              $("#preview").html('<img src="assets/img/uploading.gif" alt="Uploading...."/>');
              $("#imageform").ajaxForm({
               target: '#preview'
              }).submit();
          });
			$("#addStaff").validate({
				rules:{
					
					name:"required",
					ll:"required",
                    mobile:"required",
                    dob:"required",
                    gender:"required",
                    educationalQualfication:"required",
                    postalAdress:"required",
                    zip:"required",
                    user_name:{
                    	required:true,
                    	remote: {
                            url: "checkusername.jsp",
                            type: "get",
                            data: {
                            action: function () {
                                return "checkusername";
                            },
                            username: function() {
                                var username = $("#username").val();
                                return username;
                            }
                            }
                        }
        
                      
                    },
                    designation:"required",
					email:{
							required:true,
							email: true,
	                         remote: {
	                                url: "checkusername.jsp",
	                                type: "get",
	                                data: {
	                                action: function () {
	                                    return "checkusername";
	                                },
	                                username: function() {
	                                    var username = $("#username").val();
	                                    return username;
	                                }
	                                }
	                            }
	            
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
					name:"Enter  first and last name",
					user_name:{
						required:"Enter user name",
						remote:"This user name already exist",
					},
					email:{
						required:"Enter email address",
						email:"Enter valid email address",
						remote:"This Email already exist",
					},
					pwd:{
						required:"Enter password",
						minlength:"Password must be minimum 6 characters"
					},
					cpwd:{
						required:"Enter confirm password",
						equalTo:"Password and Confirm Password must match"
					},
					dob:"Select Birthday",
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
	  
	  
	 <!-- <script type="text/javascript" src="assets/js/jquery.min.js"></script>
	  <script type="text/javascript" src="assets/js/jquery.form.js"></script>

	  <script type="text/javascript" >

	  </script> --> 
	  
</body>
</html>
<%db.close(); 
}else{
    response.sendRedirect("index.jsp");
    
}
    }%>
