<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>QRBillingSystem_Server_Add Product</title>
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
      a.plain:link{ 
        color: #333; 
        text-decoration: none 
      }
      a.plain:active{ 
        color: #333; 
        text-decoration: none 
      }
      a.plain:visited{ 
        color: #333; 
        text-decoration: none 
      }
      a.plain:hover{ 
        color: #333; 
        text-decoration: none 
      }
    </style>
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <%@page import="Database.DBConn,java.sql.*" %>
    <%
         DBConn db=new DBConn();
         ResultSet rs=db.executeQuery("SELECT* FROM qrbs_products WHERE id='"+request.getParameter("id")+"'");
         if(rs.next()){
    %>
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
      <!-- Example row of columns -->
      <div class="row">
             <%if(request.getParameter("type")!=null){
            
            if(request.getParameter("type").startsWith("Sucess")){%> 
                 <div class="alert alert-sucess">
                   Sucess :Mailed a request to supplier sucessfully.
                 </div>
                <% }
                else if(request.getParameter("type").startsWith("fail")){%>

                <div class="alert alert-error">
                  Error :Error in sending mail
                </div>
              <% } 
            }%>
            <div class="span9">
            

               <form class="form-horizontal" id="reorder" name="reorder" method='post' action='reorderAction.jsp'>
               <fieldset>
                    <div class="control-group">
                        <label for="id" class="control-label">ID</label>

                        <div class="controls">
                            <input id="id" name="id" readonly="readonly" value="<%= request.getParameter("id") %>"type="text">
                            <span class="help-inline"></span>
                        </div>
                    </div>
                    <%String name=rs.getString("name");
                       ResultSet rs1=db.executeQuery("SELECT * FROM `qrbs_supplier` WHERE `id`='"+rs.getString(7)+"'");
                       if(rs1.next()){
                    %>
                    <div class="control-group">
                        <label class="control-label" >Supplier</label>
                        <div class="controls">
                        
                            <input type="text" class="input-xlarge" id="to" name="to" value="<%= rs1.getString("email") %>" >
                        </div>
                    </div>
                     <%} %>
                    <div class="control-group">
             .           <label  class="control-label">Message</label>
                        <div class="controls">
                            <textarea id="description" name="description" class="span6" rows="6">
                            The Product <%= name %> is under low stock please contact us
                            </textarea>
                        </div>
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary" >Send</button>
                    </div>
                </fieldset>
        </form>
           </div>
      </div>
<% }%>
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
          
          $("#reorder").validate({
              rules:{
                  
                  name:"required",
                  description:"required"
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
