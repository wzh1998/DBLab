<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="ie.ucd.comp2004J.*" %>
<!DOCTYPE html>
<html lang="zxx">
  <head>
    <meta charset="utf-8">
    <title>Smart Home | Actuator Control</title>
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
    <style>
      /* Switch 1 Specific Styles Start */

.box_1{
  background: #eee;
}

input[type="checkbox"].switch_1{
  font-size: 30px;
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  width: 3.5em;
  height: 1.5em;
  background: #ddd;
  border-radius: 3em;
  position: relative;
  cursor: pointer;
  outline: none;
  -webkit-transition: all .2s ease-in-out;
  transition: all .2s ease-in-out;
  }
  
  input[type="checkbox"].switch_1:checked{
  background: #0ebeff;
  }
  
  input[type="checkbox"].switch_1:after{
  position: absolute;
  content: "";
  width: 1.5em;
  height: 1.5em;
  border-radius: 50%;
  background: #fff;
  -webkit-box-shadow: 0 0 .25em rgba(0,0,0,.3);
          box-shadow: 0 0 .25em rgba(0,0,0,.3);
  -webkit-transform: scale(.7);
          transform: scale(.7);
  left: 0;
  -webkit-transition: all .2s ease-in-out;
  transition: all .2s ease-in-out;
  }
  
  input[type="checkbox"].switch_1:checked:after{
  left: calc(100% - 1.5em);
  }
  
/* Switch 1 Specific Style End */
/* Switch 2 Specific Style Start */

.box_2{
	background: #666;
}

input[type="checkbox"].switch_2{
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  width: 100px;
  height: 8px;
  background: #444;
  border-radius: 5px;
  position: relative;
  outline: 0;
  cursor: pointer;
}

input[type="checkbox"].switch_2:before,
input[type="checkbox"].switch_2:after{
  position: absolute;
  content: "";
  -webkit-transition: all .25s;
  transition: all .25s;
}

input[type="checkbox"].switch_2:before{
  width: 40px;
  height: 40px;
  background: #ccc;
  border: 5px solid #666;
  border-radius: 50%;
  top: 50%;
  left: 0;
  -webkit-transform: translateY(-50%);
          transform: translateY(-50%);
}

input[type="checkbox"].switch_2:after{
  width: 30px;
  height: 30px;
  background: #666;
  border-radius: 50%;
  top: 50%;
  left: 10px;
  -webkit-transform: scale(1) translateY(-50%);
          transform: scale(1) translateY(-50%);
  -webkit-transform-origin: 50% 50%;
          transform-origin: 50% 50%;
}

input[type="checkbox"].switch_2:checked:before{
  left: calc(100% - 35px);
}

input[type="checkbox"].switch_2:checked:after{
  left: 75px;
  -webkit-transform: scale(0);
          transform: scale(0);
}

/* Switch 2 Specific Style End */
    </style>
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
                 <a class="actived" href="actuator-control.jsp?Page=1">Device
                  <span class="hidden-lg span-drop"></span>
                 </a>
                </li>

               

                <li>
                 <a href="environment.jsp">Environment
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


<div class="container">
  <button type="button" class="btn btn-default" ><a data-toggle="modal" data-target="#addAct"><span></span> Add Actuators</a></button>
  <br />
  <div class="table-responsive">
    <table class="table"> <thead>
    <tr> <th></th> 
    <th>Actuator ID</th> <th>Name</th> <th>Type</th> <th>State</th>
    </tr> </thead>
    <%
    int currentPage = 1;
    int numberPerPage = 5;
    int totalPages = ActuatorDAO.getPageNum();
    String requestPage = request.getParameter("Page"); 
    if (requestPage != null) {
    currentPage = Integer.parseInt(requestPage); 
    }
    int Page = currentPage;
  List<Actuator> actuators = ActuatorDAO.getAllActuators(Page);
  //Disable button when reaching first or last page.
  String disableButtonNext = currentPage >= totalPages ? "disabled=\"disabled\"" : "";
  String disableButtonUp = currentPage == 1 ? " disabled=\"disabled\"" : "";
  
    for (Actuator act : actuators) {
    %> 
    <!--- Editing starting --->

              <div id=<%= "actEdit_" + act.getActID()%> class="modal fade">
                <div class="modal-dialog modal-login">
                  <div class="modal-content">
                    <div class="modal-header">      
                      <h4 class="modal-title">Actuator Editing</h4>
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                      <form method="post" action="confirmUpdateActuator.jsp">
                        <div class="form-group">
                        <label>Actuator Serial No.</label>
                        <input type="text" name="ActID" class="form-control" readonly="true" value="<%=act.getActID() %>" placeholder="<%=act.getActID() %>">
                        </div>
                        <div class="form-group">
                        <label>Actuator Name</label>
                        <input type="text" name="ActName" class="form-control"  placeholder="<%=act.getActName() %>" required>
                        </div>
                        <div class="form-group">
                        <label>Actuator State</label>

                        <input type="checkbox" name="ActState" class="switch_1" style="left: 75px; top: 13px;" value="on">
                        <br />
                        <br />
                        <br />
                        <div class="form-group"><input type="submit" value="Confirm Changing" class="btn btn-primary btn-block btn-lg"></div>
                        </div>    
                      </form>         
                    </div>
                    
                  </div>
                </div>
              </div>


              <!--- Editing ending ---->
    <tr>
    <td><a data-toggle="modal" data-target=<%="#actEdit_"+ act.getActID() %>>Edit</a>&nbsp<a href=<%="confirmDeletingActuator.jsp?ActID=" + act.getActID() %>>Delete</a>&nbsp<a href="http://39.108.231.244/XHProject/addtempkeyDBHW.php"> <%= (act.getActID() > 2000 && act.getActID() < 3000) ? "Send Temp Key" : ""%> </a></td>
	
    <td>
    <div title= "<%= (act.getActID() > 4000 && act.getActID() < 5000) ? ("Water Volume: " + String.valueOf(ActuatorDAO.getVolumn(act.getActID()))) : "" %>">
 	<p><%=act.getActID()%></p>
	</div>
	</td>

    <td><%=act.getActName()%></td>
    <td><%=act.getActID()<2000? "Alarm" : (act.getActID()<3000?"Bluetooth Lock" :(act.getActID()<4000?"Curtain":(act.getActID()<5000?"Humidifier":"Lamp")) )%></td>
    <td><%=act.getActState()==1 ? "ON" : "OFF"%></td>
    </tr>
    
    <%
    }
    %> </table>
    </div>
    <button type="button" class="btn btn-default" <%= disableButtonUp %> onclick="window.location.href='actuator-control.jsp?Page=<%=Page - 1%>';">Previous</button>Page<%=currentPage%>/<%=totalPages%>
    <button type="button" class="btn btn-default" <%=disableButtonNext%> onclick="window.location.href='actuator-control.jsp?Page=<%= Page + 1%>';">Next</button>
    </div>
    
      <!--  gallery home end --> 

          <div class="container-fluid m-5-hor">
            <div class="bottom-footer">
              <div class="row">
                <div class="col-sm-6 copyright">
                 <span>© 2019 Intelligent Home Control System, All Right Reserved</span>
                </div>
                <div class="col-sm-6 col-xs-12">
                  <div class="social-icons">
                    <!-- <a href="#"><i class="fa fa-facebook"></i></a> 
                    <a href="#"><i class="fa fa-pinterest"></i></a> 
                    <a href="#"><i class="fa fa-tumblr"></i></a> 
                    <a href="#"><i class="fa fa-twitter"></i></a> 
                    <a href="#"><i class="fa fa-instagram"></i></a> -->
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
              <!--- registrition starting  --->
              <div id="addAct" class="modal fade">
                <div class="modal-dialog modal-login">
                  <div class="modal-content">
                    <div class="modal-header">      
                      <h4 class="modal-title">Adding New Actuator</h4>
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                      <form method="post" action="confirmAddingActuator.jsp">
                        <div class="form-group">
                        <label>Actuator Serial No.</label>
                        <input type="text" name="ActID" class="form-control" required>
                        </div>
                        <div class="form-group">
                        <label>Actuator Name</label>
                        <input type="text" name="ActName" class="form-control" required>
                        </div>
                        
                        <div class="form-group"><input type="submit" value="Submit" class="btn btn-primary btn-block btn-lg"></div>
                        <div class="clearfix"></div>
                      </form>       
                      
                    </div>
                    
                  </div>
                </div>
              </div>

              <!--- registrition ending  --->
              


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