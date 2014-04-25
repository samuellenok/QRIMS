<!DOCTYPE html>
<html lang="en">
  <head>
   	<%@page import="java.sql.ResultSet"%>
	<%@page import="Database.DBConn"%>
    <meta charset="utf-8">
    <title>Purchase</title>
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
	  { 
		color: #333; 
	    text-decoration: none 
	  }
	   a.plain:active
	  { 
	    color: #333; 
	    text-decoration: none 
	  }
	  a.plain:visited
	  { 
	     color: #333;
	     text-decoration: none 
	  }
	  a.plain:hover
	  { 
	     color: #333; 
	     text-decoration: none 
	  }
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
	                    <li><a href="purchase.jsp">Purchase</a></li>
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
	</div></div>
	
	<div class="container">
	 
	    <div class="row">
	    <% 
	                if(request.getParameter("id")!=null){
	                    String id=request.getParameter("id");
	  
	                    DBConn db0=new DBConn();
	                    ResultSet rs0=db0.executeQuery("SELECT* FROM qrbs_purchase WHERE id='"+id+"'");
	        
	                    if(rs0.next()){
	             
	            %>
	    <form id="form" class="form-horizontal span12" action="updatePurchaseAction.jsp" method="post">
	        <fieldset>
	            <legend>Product Details</legend>
	            <br>
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
	                <div class="span9">
	                    <div class="control-group">
	                        <label for="id" class="control-label">ID</label>
	                        <div class="controls">
	                            <input id="id" name="id" readonly="readonly" value="<%= request.getParameter("id") %>" type="text">
	                            <span class="help-inline"></span>
	                        </div>
	                    </div>
	                    <div class="control-group">
	                        <label for="pdtList" class="control-label">Select Product</label>
	                        <div class="controls">
	                            <%
								 DBConn db=new DBConn();
								 ResultSet rs=db.executeQuery("SELECT* FROM qrbs_products");
	    					%>    
	    					<select name="pdtList" class="span2">
	    					<%while(rs.next()){%>
	    					<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%> </option><%}%>
							</select>
	                        </div>
	                    </div>
	
	                    <div class="control-group">
	                        <label for="qty" class="control-label">Quantity</label>
	
	                        <div class="controls">
	                            <input id="qty" name="qty" placeholder="Quantity/No. of items" type="text" value="<%=rs0.getString(4)%>"> 
	                            <span class="help-inline"></span>
	                        </div>
	                    </div>
	
	                    <div class="control-group">
	                        <label for="price" class="control-label">Price</label>
	
	                        <div class="controls">
	                            <input id="price" name="price"  type="text" placeholder="Per Unit Price " value="<%=rs0.getString(5)%>">
	                        </div>
	                    </div>
	
	                    <div class="control-group">
	                        <label for="disc" class="control-label">Discount</label>
	
	                        <div class="controls">
	                            <input id="disc" name="disc"  type="text" placeholder="Discount" value="<%=rs0.getString(7)%>">
	                        </div>
	                        </div>
	                           <div class="control-group">
	                        <label for="tax" class="control-label">Tax Per Unit</label>
	
	                        <div class="controls">
	                            <input id="tax" name="tax"  type="text" placeholder="Per Unit Tax" value="<%=rs0.getString(6)%>">
	                        </div>
	                        </div>
	                        
	                        <div class="control-group">
	                        <label for="supplier" class="control-label">Supplier:</label>
	                        <%   DBConn db1=new DBConn();
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
	
	                    
	
	                </div>
	
	               
	            
	
	        </fieldset>
	
	        <div class="form-actions">
	            <input type="submit" class="btn btn-primary save" value="Save"></input>
	            <a href="updatePurchaseAction.jsp?action=delete&&id=<% out.println(rs0.getString("id"));%>" class="btn delete">Delete</a>
	
	        </div>
	
	    </form>
	     <% } }
	                  else{
	            }%>
	        
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
	    
<script type="text/javascript" src="assets/js/jquery.validate.js"></script>  

      <script type="text/javascript">
      $(document).ready(function(){
            
            $("#form").validate({
                rules:{
                    pdtList:"required",
                    qty:"required",
                    price:"required",
                    disc:"required",
                    tax:"required",
                    supplier:"required",
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
