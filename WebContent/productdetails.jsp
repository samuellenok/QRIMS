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
                    <li class="add-menu"><a href="#wines/add"><i class="icon-edit icon-white"></i> Add Product</a></li>
                    <li><a href="adminHome.jsp">Home</a></li>
                </ul>

               <ul class="nav pull-right">

		
          <li class="divider-vertical"></li>
          
          
          <li class="dropdown">
          
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">SAMUEL J MATHEW <b class="caret"></b></a>
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
    <form class="form-horizontal span12">


        <fieldset>

            <legend>Wine Details</legend>
            <br>

            <div class="row">
                <div class="span9">

                    <div class="control-group">
                        <label for="wineId" class="control-label">Id:</label>

                        <div class="controls">
                            <input id="wineId" name="id" value="2" class="span1" disabled="disabled" type="text">
                        </div>
                    </div>

                    <div class="control-group">
                        <label for="name" class="control-label">Name:</label>

                        <div class="controls">
                            <input id="name" name="name" value="LAN RIOJA CRIANZA" type="text">
                            <span class="help-inline"></span>
                        </div>
                    </div>

                    <div class="control-group">
                        <label for="grapes" class="control-label">Grapes:</label>

                        <div class="controls">
                            <input id="grapes" name="grapes" value="Tempranillo" type="text">
                            <span class="help-inline"></span>
                        </div>
                    </div>

                    <div class="control-group">
                        <label for="country" class="control-label">Country:</label>

                        <div class="controls">
                            <input id="country" name="country" value="Spain" type="text">
                            <span class="help-inline"></span>
                        </div>
                    </div>

                    <div class="control-group">
                        <label for="region" class="control-label">Region:</label>

                        <div class="controls">
                            <input id="region" name="region" value="Rioja" type="text">
                        </div>
                    </div>

                    <div class="control-group">
                        <label for="year" class="control-label">Year:</label>

                        <div class="controls">
                            <select class="span1" id="year" name="year" value="2006">
                                <option selected="selected">2012</option>
                                <option>2011</option>
                                <option>2010</option>
                                <option>2009</option>
                                <option>2008</option>
                                <option>2007</option>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label for="description" class="control-label">Notes:</label>

                        <div class="controls">
                            <textarea id="description" name="description" class="span6" rows="6">A
 resurgence of interest in boutique vineyards has opened the door for 
this excellent foray into the dessert wine market. Light and bouncy, 
with a hint of black truffle, this wine will not fail to tickle the 
taste buds.</textarea>
                        </div>
                    </div>

                </div>

                <div class="span3">
                    <div class="well">
                        <p><img id="picture" src="Backbone%20Cellar_files/lan_rioja.jpg" width="180"></p>

                        <p>To change the picture, drag a new picture from your file system onto the box above.</p>
                    </div>
                </div>

            </div>

        </fieldset>

        <div class="form-actions">
            <a href="#" class="btn btn-primary save">Save</a>
            <a href="#" class="btn delete">Delete</a>
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

<script src="Backbone%20Cellar_files/jquery-1.js"></script>
<script src="Backbone%20Cellar_files/underscore-min.js"></script>
<script src="Backbone%20Cellar_files/backbone-min.js"></script>
<script src="Backbone%20Cellar_files/bootstrap.js"></script>

<!-- NOTE: memorystore.js will set up an in-memory datastore to allow you to experience the app without setting up
back-end infrastructure. All the changes you make to the data will be lost the next time you access the app or hit Refresh.
To use the app with a persistent RESTful back-end (provided in the GitHub repo), simply comment out the line below. -->
<script src="Backbone%20Cellar_files/memorystore.js"></script>

<script src="Backbone%20Cellar_files/utils.js"></script>
<script src="Backbone%20Cellar_files/models.js"></script>
<script src="Backbone%20Cellar_files/paginator.js"></script>
<script src="Backbone%20Cellar_files/header.js"></script>
<script src="Backbone%20Cellar_files/winelist.js"></script>
<script src="Backbone%20Cellar_files/winedetails.js"></script>
<script src="Backbone%20Cellar_files/about.js"></script>
<script src="Backbone%20Cellar_files/main.js"></script>



</body></html>
