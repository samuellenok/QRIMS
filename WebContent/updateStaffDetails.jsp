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
				<li class="add-menu"><a href="#wines/add"><i class="icon-edit icon-white"></i> Add Staff</a></li>
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
    <%if(request.getParameter("id")!=null){
            String id=request.getParameter("id");
  
        DBConn db=new DBConn();
        ResultSet rs=db.executeQuery("SELECT* FROM qrbs_staff WHERE id='"+id+"'");
        
  if(rs.next()){
             
            %>
    <form id="updateStaff" name="updateStaff"class="form-horizontal span12" action="updateStaffAction.jsp" method="POST">
		<fieldset>
			<legend>Staff Details</legend>
            <br>
            <div class="row">
                <div class="span9">
                    <div class="control-group">
                        <label for="id" class="control-label">ID</label>

                        <div class="controls">
                            <input id="id" name="id" readonly="readonly" value="<%= request.getParameter("id") %>"type="text">
                            <span class="help-inline"></span>
                        </div>
                    </div>
                    <div class="control-group">
		      			<label class="control-label" for="user_name">Name</label>
		      			<div class="controls">
		        		    <input type="text" class="input-xlarge" id="user_name" name="user_name" value="<%= rs.getString(3) %>" >
	        		     </div>
					</div>
                    <div class="control-group">
                        <label class="control-label" for="input01">Mobile</label>
                        <div class="controls">
                            <input type="text" class="input-xlarge" id="mobile" name="mobile" value="<%= rs.getString(6) %>" >
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="input01">Landline</label>
                        <div class="controls">
                            <input type="text" class="input-xlarge" id="ll" name="ll" value="<%= rs.getString(7) %>" >
                        </div>
                    </div>
					<div class="control-group">
						<label class="control-label" for="input01">Birthday</label>
					      <div class="controls">
					         <input id="dob" name="dob" class="span2" type="text" value="<%= rs.getString(4) %>" readonly="readonly" data-date-format="yyyy-mm-dd">
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
                        <label for="description" class="control-label">Postal Adress</label>
                        <div class="controls">
                            <textarea id="postalAdress" name="postalAdress" class="span6" rows="6">
                           <%= rs.getString(8) %>
							</textarea>
                        </div>
                    </div>
					<div class="control-group">
						<label class="control-label" for="input01">Postal Code</label>
					      <div class="controls">
					        <input type="text" class="input-xlarge" id="zip" name="zip" value="<%= rs.getString(9) %>" >
					      </div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">Educational Qualification</label>
					      <div class="controls">
					        <input type="text" class="input-xlarge" id="educationalQualfication" name="educationalQualfication" value="<%= rs.getString(10) %>" >
					      </div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">Designation</label>
					      <div class="controls">
					        <input type="text" class="input-xlarge" id="designation" name="designation" value="<%= rs.getString(11) %>" >
					      </div>
					</div>
					<div class="control-group">
                        <label class="control-label" for="input01">Staff Account Status</label>
                          <div class="controls">
                            <select name="status" id="status" >
                                            <option value="">Select</option>
                                            <option value="1">Active</option>
                                            <option value="0">Banned</option>
                            </select>
                          </div>
                    </div>
	    </div>
		<div class="span3">
			<div class="well">
	        	<p><img id="picture" src="<%= rs.getString(12) %>" width="150"></p>
				<a href="#" class="btn btn-primary save">Change</a>   
	        </div>
	     </div>
		</div>
        </fieldset>
        <div class="form-actions">
            <input type="submit" class="btn btn-primary save" value="Save" ></input>
            <a href="updateStaffAction.jsp?action=delete&id=<%= rs.getString("id") %>" class="btn delete">Delete</a>
        </div>
    </form>
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
    <script src="assets/js/prettify.js"></script>
    <script type="text/javascript" src="assets/js/jquery.validate.js"></script>  

	 <script type="text/javascript">
				$('#dob').datepicker('yyyy/mm/dd');
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
            $("#updateStaff").validate({
                rules:{
                    
                	user_name:"required",
                    ll:"required",
                    mobile:"required",
                    dob:"required",
                    gender:"required",
                    educationalQualfication:"required",
                    postalAdress:"required",
                    zip:"required",
                    status:"required",
                    user_name: {
                        required: true,
                        
                        remote: {
                            url:"check-username.jsp",
                            type: "POST",
                            data: {
                              username: function() {
                                return $("#user_email").val();
                             }
                            }
                        }
                    },
                    designation:"required",
                    email:{
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
                	user_name:"Enter  first and last name",
                    email:{
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
