<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="ie.ucd.comp2004J.*" %>
<!DOCTYPE html>
<html lang="zxx">
  <head>
    <meta charset="utf-8">
    <title>Concreate | Interior Architecture Template</title>
    <meta content="" name="description">
    <meta content="" name="author">
    <meta content="" name="keywords">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport">
    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- font themify CSS -->
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- font awesome CSS -->
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <!-- date picker CSS -->
    <link href="css/datepicker.min.css" rel="stylesheet">
    <!-- revolution slider css -->
	  <link rel="stylesheet" type="text/css" href="rs-plugin/css/settings.css" media="screen" />
    <link rel="stylesheet" href="css/rev-settings.css" type="text/css">
    <!-- on3step CSS -->
    <link href="css/animated-on3step.css" rel="stylesheet">
    <link href="css/owl.carousel.css" rel="stylesheet">
    <link href="css/owl.theme.css" rel="stylesheet">
    <link href="css/on3step-style.css" rel="stylesheet">
    <link href="css/queries-on3step.css" media="all" rel="stylesheet">

    <link rel="stylesheet" 15 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    
  </head>
  
  <body class="black">
  	<%
  	if(session.getAttribute("user") == null) {
  		response.sendRedirect("index.jsp");
  	} 
  	%>
    <!-- preloader -->
    <div class="bg-preloader-white"></div>
    <div class="bg-preloader-white-bot"></div>
    <div class="preloader">
        <div class="prtf-st-loader1">
            <div class="prtf-outline">
                <div class="prtf-line-1"></div>
                <div class="prtf-line-2"></div>
                <div class="prtf-line-3"></div>
                <div class="prtf-line-4"></div>
            </div>        
        </div>
    </div>
    <!-- preloader end -->
    
   <!-- content wraper -->
   <div class="content-wrapper">
    
   <header class="init">
    
    <!-- subnav -->
    <div class="container-fluid m-5-hor">
    <div class="row">

         <div class="col-md-12">
          <div class="subnav">

          <div class="left">
            <div class="social-icons-subnav hidden-xs">
                <div>Contact Us : Beijing-Dublin International College</div>
            </div>
          </div>
          
          <div class="right">
          <!--   <div id="sub-icon" class="social-icons-subnav hidden-sm hidden-xs">
                <a href="#"><span class="ti-facebook"></span></a>
                <a href="#"><span class="ti-dribbble"></span></a>
                <a href="#"><span class="ti-twitter"></span></a>
                <a href="#"><span class="ti-instagram"></span></a>
                <a href="#"><span class="ti-linkedin"></span></a>
            </div> -->
            <div class="social-icons-subnav">
                <a data-toggle="modal" data-target="#fLogin"><span class="ti-lock"></span> Login</a>
                <a data-toggle="modal" data-target="#fsignUp"><span class="ti-user"></span> Sign up</a>
            </div>
          </div>
            
         </div>
        </div>
        
    </div>
    </div>
    <!-- subnav end -->
    
      <!-- nav -->
      <div class="navbar-default-white navbar-fixed-top">
        <div class="container-fluid m-5-hor">
        <div class="row">
        

          <!-- logo --> 
          <a class="navbar-brand white" href="index.jsp">
          <img alt="logo" src="img/logo-white.png">
          </a> 
          <!-- logo end -->

           <!-- menu mobile display -->
           <button class="navbar-toggle" data-target=".navbar-collapse" data-toggle="collapse">
           <span class="icon icon-bar"></span> 
           <span class="icon icon-bar"></span> 
           <span class="icon icon-bar"></span></button> 
           <!-- menu mobile display end -->
          
          <!-- mainmenu start -->
          <div class="white menu-init" id="main-menu">
            <nav id="menu-center">
              <ul>
                <li>
                 <a href="setActuators.jsp?Page=1">Device
                  <span class="hidden-lg span-drop"></span>
                 </a>
                 
                </li>
                <li>
                 <a class="actived" href="viewSensors.jsp">Environment
                  <span class="hidden-lg span-drop"></span>
                 </a>
                 
                </li>

                <li><a href="#">Works
                  <span class="hidden-lg span-drop"></span>
                </a>
                <ul>
                    <li><a href="works.html">Works-2-col</a></li>
<li><a href="works-black.html">Works Black</a></li>
                    <li><a href="works-3-col.html">Works-3-col</a></li>
                    <li><a href="projects-detail.html">Projects Detail</a></li>
                    <li><a href="projects-detail-2-col.html">Projects Detail 2</a></li></ul>
                </li>
                <li><a  href="#">Gallery
                  <span class="hidden-lg span-drop"></span>
                </a>
                <ul>
                    <li><a href="gallery.html">Gallery</a></li>
<li><a href="gallery-black.html">Gallery Black</a></li>
<li><a href="gallery-filter.html">Gallery Filter</a></li>
<li><a href="gallery-filter-black.html">Gallery Filter Black</a></li>
                    </ul>
                </li>
                <li><a href="#">Blog
                  <span class="hidden-lg span-drop"></span>
                </a>
                  <ul>
                    <li><a href="blog.html">Blog Single</a></li>
<li><a href="blog-black.html">Blog Black</a></li>
                    <li><a href="blog-post.html">Blog Post</a></li>
                    </ul>
                </li>
                <li>
                 <a href="#">Contact
                  <span class="hidden-lg span-drop"></span>
                 </a>
                 <ul>
                    <li><a  href="contact.html">Contact</a></li>
					<li><a  href="contact-black.html">Contact Black</a></li>
                 </ul>
                </li>
              </ul>
            </nav>
          </div>
          <!-- mainmenu end -->
          
        </div>
        </div>
        <!-- container -->
      </div>
      <!-- nav end -->
      </header>
      
      

      <!--  gallery home --> 
      <section  aria-label="projects">
        <div class="container-fluid m-5-hor">
          <div class="row">
          
          <div class="col-md-12">
            <div class="wrapheading">
              <h1 class="heading no-top">PROJECTS</h1>
              <h2 >Our <br>Works</h2>
              <h2 class="headingcontent">We Build Architectural & Design</h2>
            </div>



      <!--  gallery home end --> 

          <div class="container-fluid m-5-hor">
            <div class="bottom-footer">
              <div class="row">
                <div class="col-sm-6 copyright">
                  <span>© 2019 Concreate, All Right <a href="http://www.17sucai.com/" title="17sucai">Reserved</a></span>
                </div>
                <div class="col-sm-6 col-xs-12">
                  <div class="social-icons">
                    <a href="#"><i class="fa fa-facebook"></i></a> 
                    <a href="#"><i class="fa fa-pinterest"></i></a> 
                    <a href="#"><i class="fa fa-tumblr"></i></a> 
                    <a href="#"><i class="fa fa-twitter"></i></a> 
                    <a href="#"><i class="fa fa-instagram"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div><!-- end bottom footer -->
      </footer>
      <!-- footer end -->
      
      
      <!-- ScrolltoTop -->
      <div id="totop" class="init">
        &uarr;
      </div>  

              <!-- modal login -->
              <div id="fLogin" class="modal fade">
                <div class="modal-dialog modal-login">
                  <div class="modal-content">
                    <div class="modal-header">      
                      <h4 class="modal-title">Member Log In</h4>
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                      <form action="#" method="post">
                        <div class="form-group">
                          <label>User Name</label>
                          <input type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                          <label>Password</label>
                          <input type="password" class="form-control" required>         
                        </div>
                        <div class="form-group">
                          <input type="submit" class="btn btn-primary btn-block btn-lg" value="Log In">
                        </div>
                      </form>       
                      
                    </div>
                    <div class="modal-footer">
                      <a href="#">or Sign Up</a>
                    </div>
                  </div>
                </div>
              </div>
              <!-- modal login end -->

              <!-- modal registration -->
              <div id="fsignUp" class="modal fade">
                <div class="modal-dialog modal-login">
                  <div class="modal-content">
                    <div class="modal-header">      
                      <h4 class="modal-title">Member Registration</h4>
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                      <form>
                        <div class="form-group">
                        <label>First Name</label>
                        <input type="text" name="firstname" class="form-control" required>
                        </div>
                        <div class="form-group">
                        <label>Last Name</label>
                        <input type="text" name="lastname" class="form-control" required>
                        </div>
                        <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" name="email" class="form-control" required>
                        </div>
                        <div class="form-group">
                        <label>Username</label>
                        <input type="text" name="username" class="form-control" required>
                        </div>
                        <div class="form-group">
                        <label>Password</label>
                        <input type="password" name="password" class="form-control" required>
                        </div>
                        <div class="form-group">
                        <label><input type="checkbox" name="terms"> I agree with the <a href="#">Terms and Conditions</a>.</label>
                        </div>
                        <div class="form-group"><input type="submit" value="Sign up" class="btn btn-primary btn-block btn-lg"></div>
                        <div class="clearfix"></div>
                      </form>       
                      
                    </div>
                    <div class="modal-footer">
                      <a href="#">or Log In</a>
                    </div>
                  </div>
                </div>
              </div>
              <!-- modal registration end -->      

    </div>
    <!-- content wraper end --> 
    
    <!-- plugin JS -->
    <script src="plugin/pluginson3step.js"></script> 
    <script src="plugin/bootstrap.min.js"></script>
    <script src='plugin/bootstrap-datepicker.min.js'></script>
    <script src="plugin/sticky.js"></script> 
    <!-- slider revolution  -->
    <script src="rs-plugin/js/jquery.themepunch.tools.min.js"></script>
    <script src="rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
    <!-- on3step JS -->
    <script src="js/on3step.js"></script>
    <script src="js/plugin-set.js"></script>
  </body>
</html>