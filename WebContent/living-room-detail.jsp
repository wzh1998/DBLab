<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ie.ucd.comp2004J.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="zxx">
  <head>
    <meta charset="utf-8">
    <title>Smart Home | Living Room Detail</title>
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
    
    <script>
	function alertNull(){
	alert("This is already The last Page!");
	window.document.location.href="environment.jsp";
	}
	</script>
  </head>
  
  <body class="black">
  	<%
  	if(session.getAttribute("user") == null) {
  		response.sendRedirect("index.jsp");
  	} 
  	%>
  	<%List<Sensor> sensors = SensorDAO.getSensorsByRoom("Living Room");%>
  	<%
	if(sensors.isEmpty()) {%> 
	<script type="text/javascript">alertNull();</script> 
	<%
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
            <div id="sub-icon" class="social-icons-subnav hidden-sm hidden-xs">
                
                
                <a href="logOut.jsp"><span>Log Out</span></a>
                
            </div>
            <div class="social-icons-subnav">
      			<% User u = (User)session.getAttribute("user"); %>
                <a data-toggle="modal" ><span class="ti-lock"></span> Hi <%=u.getUsername() %>, Welcome back!</a>
                <!-- <a data-toggle="modal" ><span class="ti-lock"></span> Log Out</a> -->
                <!-- <a data-toggle="modal" data-target="#fsignUp"><span class="ti-user"></span> Sign up</a> -->
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
                 <a href="Overview.jsp">Overview
                  <span class="hidden-lg span-drop"></span>
                 </a>
                 
                </li>

                <li>
                 <a href="actuator-control.jsp?Page=1">Device
                  <span class="hidden-lg span-drop"></span>
                 </a>
                </li>

                
              

                <li>
                 <a class="actived" href="environment.jsp">Environment
                  <span class="hidden-lg span-drop"></span>
                 </a>
                </li>  
                <li>
                 <a href="about-team.jsp">Contact
                  <span class="hidden-lg span-drop"></span>
                 </a>
                 <ul>
                    <li><a href="about-team.jsp">Our Team</a></li>
                  	<li><a href="about-team.jsp">Team Members</a></li>
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
      
      <!--  breadcumb --> 
      <section aria-label="breadcumb" class="no-padding crumbs">
        <div class="container-fluid m-5-hor">
          <div class="row">
            <div class="col-md-12">
              <h1 class="crumbs">Projects</h1>
                <ul id="crumbs">
                  <li><a href="#">home</a></li>
                  <li>Projects Detail</li>
                </ul>
              </div>
          </div>
        </div>
      </section>
      <!--  breadcumb end --> 

      <!--  projects detail --> 
      <section  aria-label="projects" class="no-padding">
        <div class="container-fluid m-5-hor">
          <div class="row">
                
                <!-- detail project --> 

                <div id="detailproject" class="col-md-12">
                 <div id="owl-detail" class="owl-carousel">
                   <div class="item">
                    <div class="gal-home">
                      <div class="hovereffect">

                        <a class="big-img-1" href="img/gallery-home/img1.jpg">
                          <img alt="imageportofolio" class="img-responsive" src="img/gallery-home/img1.jpg">
                        </a>
                      </div>
                    </div>
                    <!-- sticky detail -->
                    <%Sensor s0 = sensors.get(0);	%>
                    <div class="stiky-detail">
                      <div class="detaillist" style="height: 450px;">
                        <!-- <h2>Sensor Detail</h2> -->
                        <span>
                          <strong>Sensor ID</strong><span>:</span> 
                          
                          <%=s0.getSensorID() %>
                        </span>
                        <span>
                          <strong>Sensor Name</strong><span>:</span> 
                          <%=s0.getSenName() %>
                        </span>
                        <span>
                          <strong>Sensor Type</strong><span>:</span>
                          <%=s0.getType() %>
                        </span>
                        <span>
                          <strong>Sensor State</strong><span>:</span>
                          <%=s0.getSenState()==1 ? "ON" : "OFF" %>
                        </span>
                        <span>
                          <strong>Control Actuator</strong><span>:</span>
                          <%=s0.getActID() %>
                          
                        </span>
                        <span>
                          <strong>Last Update Time</strong><span>:</span>
                          <%=s0.getUpdateTime() %>
                        </span>
                        <span>
                          <strong>Last Update Date</strong><span>:</span>
                          <%=s0.getUpdateData() %>
                        </span>
                        <span>
                          <strong>Unit</strong><span>:</span>
                          <%=s0.getUnit() %>
                        </span>
                      </div>
                      <div class="hide-detail">HIDE DETAIL &rarr;</div>
                      <div class="show-detail">&larr; SHOW DETAIL</div>
                    </div>
                    <!-- sticky detail end -->
                    </div>




                    <div class="item">
                    <div class="gal-home">
                      <div class="hovereffect">
                        <a class="big-img-1" href="img/gallery-home/img2.jpg">
                          <img alt="imageportofolio" class="img-responsive" src="img/gallery-home/img2.jpg">
                        </a>
                      </div>
                    </div>
                    <!-- sticky detail -->
                    <div class="stiky-detail">
                      <div class="detaillist" style="height: 450px;">
                        <!-- <h2>Sensor Detail</h2> -->
                        <span>
                          <strong>Sensor ID</strong><span>:</span> 
                          <%Sensor s1 = sensors.get(1);	%>
                          <%=s1.getSensorID() %>
                        </span>
                        <span>
                          <strong>Sensor Name</strong><span>:</span> 
                          <%=s1.getSenName() %>
                        </span>
                        <span>
                          <strong>Sensor Type</strong><span>:</span>
                          <%=s1.getType() %>
                        </span>
                        <span>
                          <strong>Sensor State</strong><span>:</span>
                          <%= s1.getSenState()==1 ? "ON" : "OFF" %>
                        </span>
                        <span>
                          <strong>Control Actuator</strong><span>:</span>
                          <%=s1.getActID() %>
                          
                        </span>
                        <span>
                          <strong>Last Update Time</strong><span>:</span>
                          <%=s1.getUpdateTime() %>
                        </span>
                        <span>
                          <strong>Last Update Date</strong><span>:</span>
                          <%=s1.getUpdateData() %>
                        </span>
                        <span>
                          <strong>Unit</strong><span>:</span>
                          <%=s1.getUnit() %>
                        </span>
                      </div>
                      <div class="hide-detail">HIDE DETAIL &rarr;</div>
                      <div class="show-detail">&larr; SHOW DETAIL</div>
                    </div>
                    <!-- sticky detail end -->
                    </div>

                    <div class="item">
                    <div class="gal-home">
                      <div class="hovereffect">
                        <a class="big-img-1" href="img/gallery-home/img3.jpg">
                          <img alt="imageportofolio" class="img-responsive" src="img/gallery-home/img3.jpg">
                        </a>
                      </div>
                    </div>
                    <!-- sticky detail -->
                    <div class="stiky-detail">
                      <div class="detaillist" style="height: 450px;">
                        <!-- <h2>Sensor Detail</h2> -->
                        <span>
                          <strong>Sensor ID</strong><span>:</span> 
                          <%Sensor s2 = sensors.get(2);	%>
                          <%=s2.getSensorID() %>
                        </span>
                        <span>
                          <strong>Sensor Name</strong><span>:</span> 
                          <%=s2.getSenName() %>
                        </span>
                        <span>
                          <strong>Sensor Type</strong><span>:</span>
                          <%=s2.getType() %>
                        </span>
                        <span>
                          <strong>Sensor State</strong><span>:</span>
                          <%= s2.getSenState()==1 ? "ON" : "OFF" %>
                        </span>
                        <span>
                          <strong>Control Actuator</strong><span>:</span>
                          <%=s2.getActID() %>
                          
                        </span>
                        <span>
                          <strong>Last Update Time</strong><span>:</span>
                          <%=s2.getUpdateTime() %>
                        </span>
                        <span>
                          <strong>Last Update Date</strong><span>:</span>
                          <%=s2.getUpdateData() %>
                        </span>
                        <span>
                          <strong>Unit</strong><span>:</span>
                          <%=s2.getUnit() %>
                        </span>
                      </div>
                      <div class="hide-detail">HIDE DETAIL &rarr;</div>
                      <div class="show-detail">&larr; SHOW DETAIL</div>
                    </div>
                    <!-- sticky detail end -->
                    </div> 

                  </div>
                  
                 </div>
                 <!-- detail project end -->    
                
                

       </div>
      </div>
      </section> 
      <!--  projects detail end --> 
      
			<div class="container-fluid m-5-hor">
            <div class="bottom-footer">
              <div class="row">
                <div class="col-sm-6 copyright">
                  <span>© 2019 Intelligent Home Control System, All Right Reserved</span>
                </div>
                <!-- <div class="col-sm-6 col-xs-12">
                  <div class="social-icons">
                    <a href="#"><i class="fa fa-facebook"></i></a> 
                    <a href="#"><i class="fa fa-pinterest"></i></a> 
                    <a href="#"><i class="fa fa-tumblr"></i></a> 
                    <a href="#"><i class="fa fa-twitter"></i></a> 
                    <a href="#"><i class="fa fa-instagram"></i></a>
                  </div>
                </div> -->
              </div>
            </div>
          </div><!-- end bottom footer -->
       
      
      
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