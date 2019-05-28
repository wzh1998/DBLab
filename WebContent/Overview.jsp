<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ie.ucd.comp2004J.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

<!DOCTYPE html>
<html lang="zxx">
  <head>
    <meta charset="utf-8">
    <title>Smart Home | Overview</title>
    <script src="js/jquery.min.js"></script>
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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
@charset "UTF-8";
* {
  box-sizing: border-box;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

html, body {
  margin: 0;
  background: #fdfdfd;
  font-family: 'Open Sans', sans-serif;
  width: 100%;
}

.center_radius, .thermostat, .thermostat .bar, .thermostat .center, .thermostat .center .small {
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
  border-radius: 50%;
}

.thermostat {
  position: absolute;
  left:400px;
  top:1111px;
  width: 200px;
  height: 200px;
  background: #6D697F;
  box-shadow: inset 0px -6px 1px 2px rgba(0, 0, 0, 0.35), 0px 7px 40px 11px rgba(84, 81, 97, 0.4);
}
.thermostat:hover .number {
  opacity: 1;
}
.thermostat .shadow {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%) rotateZ(10deg);
          transform: translate(-50%, -50%) rotateZ(10deg);
  width: 25px;
  height: 86%;
  text-align: center;
  -webkit-transition: 0.7s ease;
  transition: 0.7s ease;
  -webkit-animation: shadow 1.4s ease-out both;
          animation: shadow 1.4s ease-out both;
}
.thermostat .shadow .shadow-cube {
  position: absolute;
  top: 0;
  width: 25px;
  height: 0px;
  box-shadow: 0 0 45px 13px rgba(255, 158, 35, 0.5);
}
.thermostat .number {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%) rotateZ(10deg);
          transform: translate(-50%, -50%) rotateZ(10deg);
  width: 40px;
  height: 82%;
  text-align: center;
  -webkit-transition: 0.7s ease;
  transition: 0.7s ease;
  opacity: 0;
}
.thermostat .number .ext {
  font-size: 16px;
  color: white;
  font-weight: 1000;
  text-shadow: 1px 3px 3px #302e38;
}
.thermostat .bar {
  position: absolute;
  width: 356px;
  height: 356px;
}
.thermostat .bar .inner_bar {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 344px;
  height: 344px;
  margin-left: -172px;
  margin-top: -172px;
  border-radius: 100%;
  background-color: #6D697F;
  z-index: 4;
}
.thermostat .bar .inner_bar:after {
  content: '';
  display: block;
  position: absolute;
  width: 0;
  height: 0;
  border-top: 70px solid transparent;
  border-left: 70px solid transparent;
  border-right: 70px solid transparent;
  border-bottom: 150px solid #6D697F;
  bottom: -7px;
  left: 50%;
  -webkit-transform: translatex(-50%);
          transform: translatex(-50%);
}
.thermostat .bar .hold {
  position: absolute;
  width: 100%;
  height: 100%;
  clip: rect(0px, 356px, 356px, 178px);
  border-radius: 100%;
  background-color: #3a3749;
}
.thermostat .bar .fill {
  position: absolute;
  width: 100%;
  height: 100%;
  border-radius: 100%;
  clip: rect(0px, 178px, 356px, 0px);
}
.thermostat .bar .fill1 {
  background: -webkit-linear-gradient(top, #FF4900 20%, #FF4900 100%);
}
.thermostat .bar .fill2 {
  background: -webkit-linear-gradient(top, #FF4900 40%, #FF9E23 100%);
}
.thermostat .bar .right {
  z-index: 3;
  -webkit-transform: rotate(180deg);
  transform: rotate(180deg);
}
.thermostat .bar .right .fill {
  z-index: 3;
  -webkit-transform: rotate(180deg);
          transform: rotate(180deg);
  -webkit-animation: right 1s linear both;
          animation: right 1s linear both;
  -webkit-transition: -webkit-transform 0.6s;
  transition: -webkit-transform 0.6s;
  transition: transform 0.6s;
  transition: transform 0.6s, -webkit-transform 0.6s;
}
.thermostat .bar .left .fill {
  z-index: 1;
  -webkit-animation: left 0.3s linear both;
          animation: left 0.3s linear both;
  -webkit-animation-delay: 1s;
          animation-delay: 1s;
  -webkit-transition: -webkit-transform 0.6s;
  transition: -webkit-transform 0.6s;
  transition: transform 0.6s;
  transition: transform 0.6s, -webkit-transform 0.6s;
}
.thermostat .bar span {
  width: 356px;
  font-weight: 800;
  position: absolute;
  bottom: 0px;
  text-align: center;
  text-transform: uppercase;
  font-size: 15px;
  color: #2e2c3a;
  z-index: 10;
}
.thermostat .center {
  position: absolute;
  width: 260px;
  height: 260px;
  background: #e3e4ed;
  -webkit-animation: bound-in 0.6s ease forwards;
          animation: bound-in 0.6s ease forwards;
}
.thermostat .center:hover .arrow {
  opacity: 1;
  -webkit-transition: opacity 0.3s;
  transition: opacity 0.3s;
}
.thermostat .center:hover .minus {
  left: 10px;
  -webkit-transition: left 0.3s ease-out;
  transition: left 0.3s ease-out;
}
.thermostat .center:hover .plus {
  right: 45px;
  -webkit-transition: right 0.3s ease-out;
  transition: right 0.3s ease-out;
}
.thermostat .center span i {
  position: absolute;
  color: #b9b6c8;
  font-size: 40px;
  font-weight: 500;
  line-height: 260px;
}
.thermostat .center .arrow {
  opacity: 0;
  -webkit-transition: opacity 0.3s;
  transition: opacity 0.3s;
  cursor: pointer;
}
.thermostat .center .minus {
  position: absolute;
  -webkit-animation: arrow-left 1s forwards;
          animation: arrow-left 1s forwards;
}
.thermostat .center .plus {
  position: absolute;
  -webkit-animation: arrow-right 1s forwards;
          animation: arrow-right 1s forwards;
}
.thermostat .center .small {
  position: absolute;
  width: 150px;
  height: 150px;
  background: #F8F9FA;
  text-align: center;
  -webkit-animation: bound-in-small 0.6s ease forwards;
          animation: bound-in-small 0.6s ease forwards;
}
.thermostat .center .small .heat {
  line-height: 150px;
  font-size: 59px;
  color: #57545f;
  font-weight: 300;
}
.thermostat .center .small .heat:after {
  content: '℃';
  display: block;
  position: absolute;
  font-size: 28px;
  top: -20px;
  right: 30px;
}

@-webkit-keyframes shadow {
  0% {
    -webkit-transform: translate(-50%, -50%) rotate(-190deg);
            transform: translate(-50%, -50%) rotate(-190deg);
  }
  100% {
    -webkit-transform: translate(-50%, -50%) rotate(10deg);
            transform: translate(-50%, -50%) rotate(10deg);
  }
}
@-webkit-keyframes right {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(180deg);
            transform: rotate(180deg);
  }
}
@-webkit-keyframes left {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(10deg);
            transform: rotate(10deg);
  }
}
@-webkit-keyframes bound-in {
  10% {
    box-shadow: 0px 7px 30px 5px rgba(96, 93, 111, 0.25);
    -webkit-transform: translate(-50%, -50%) scale(0.8);
            transform: translate(-50%, -50%) scale(0.8);
  }
  80% {
    -webkit-transform: translate(-50%, -50%) scale(1.03);
            transform: translate(-50%, -50%) scale(1.03);
  }
  100% {
    box-shadow: 0px 15px 35px 11px rgba(46, 44, 58, 0.6);
    -webkit-transform: translate(-50%, -50%) scale(1);
            transform: translate(-50%, -50%) scale(1);
  }
}
@-webkit-keyframes bound-in-small {
  0% {
    box-shadow: 0px 5px 10px 5px rgba(96, 93, 111, 0.19);
    -webkit-transform: translate(-50%, -50%) scale(0.8);
            transform: translate(-50%, -50%) scale(0.8);
  }
  80% {
    -webkit-transform: translate(-50%, -50%) scale(1.03);
            transform: translate(-50%, -50%) scale(1.03);
  }
  100% {
    box-shadow: 0px 15px 35px 5px rgba(96, 93, 111, 0.3);
    -webkit-transform: translate(-50%, -50%) scale(1);
            transform: translate(-50%, -50%) scale(1);
  }
}
@-webkit-keyframes arrow-left {
  0% {
    left: 45px;
    opacity: 0;
  }
  100% {
    left: 10px;
    opacity: 1;
  }
}
@-webkit-keyframes arrow-right {
  0% {
    right: 75px;
    opacity: 0;
  }
  100% {
    right: 45px;
    opacity: 1;
  }
}
  </style>
  </head>
  
  <body class="black">
  
  	
  <%
  if(session.getAttribute("user") == null) {
	  response.sendRedirect("index.jsp");
  }
  %>
	
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
  
    <!-- subnav end -->
    
      <!-- nav -->
      <div class="navbar-default-white navbar-fixed-top" >
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
                 <a class="actived" href="Overview.jsp">Overview
                  <span class="hidden-lg span-drop"></span>
                 </a>
                 
                </li>

                <li>
                 <a href="actuator-control.jsp?Page=1">Device
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
      
    
  
  <!-- about home -->
  <section aria-label="about">
    <div class="container-fluid m-5-hor">
      <div class="row" >

        <div class="col-md-6 onStep" data-animation="fadeInLeft" data-time="300">
          <!-- <h2 class="heading">
            ABOUT US 
          </h2> -->
          <!-- <h3 class="headingcontent">
            We Are <br>
            Architecture<br>
            Design<br>
          </h3>
          <p class="content">
            Donec at cursus sem. Duis condimentum posuere purus, at venenatis tellus mollis. Vestibulum cursus convallis venenatis. Sed ut blandit mauris. Lorem non suscipit. Proin pretium consequat est, sit amet consectetur luctus vel. Etiam quis interdum felis, at pellentesque metus.
          </p>
          <div class="year">
            <div class="heading">23</div>
            <div class="subheading dd4425">Year <br>Experience<br> Working</div>
          </div> -->
        </div>

        <!-- start of external statistic -->
        <div class="wrapper div-inline"  >
  
  <div class="flex" >
    <div class="info">
      <h2 class="info__title">Logic's Home</h2>
      <div class="info__time"> 

      <% Date now = new Date( );
      SimpleDateFormat ft = new SimpleDateFormat ("kk:mm"); %>

      <%= 1==1? ("Current Time: " + ft.format(now)):1 %> 
    </div>
    </div>
    <div class="menu">
      <ul class="menu__list">
  <!--       <li class="menu__item menu__item--active">Activity</li>     
        <li class="menu__item">Settings</li> -->
      </ul>
     <!--  <div class="flex">
        <div class="menu-border  one-half"></div>
      </div> -->
    </div>
  </div>
  
  <div class="statistics">
    <div class="consumption-panel">
      <div class="flex flex--justify-between">
        <!-- <h6 style="color:black">
        Rooms Illumination
        </h6> -->
        <p class="title" style="color:black">Rooms Illumination</p>       
     
      </div>
      <!-- <h6 class="consumption" style="color:black"></h6> -->
      <svg id="visualisation" width="600" height="100"></svg>
      
      <p class="title" style="color:black">Rooms Humidity</p>
      <div class="bar-chart">
        
        <%List<Sensor> hum = SensorDAO.getHumidity(); 
          	String num1 = "30";
          	String num2 = "40";
          	String num3 = "50";
          	String num4 = "40";
         	String num5 = "30";
          	if(hum.size() >= 3){
          		num1 = hum.get(0).getUpdateData();
          		num2 = hum.get(1).getUpdateData();
          		num3 = hum.get(2).getUpdateData();
          		num4 = hum.get(3).getUpdateData();
          		num5 = hum.get(4).getUpdateData();
          	}
          %>
        <div class="progress progress--vertical">
          
          <div class="progress__fill" style="height: <%=num1 %>%"></div>
          <p class="progress__caption" style="color:black"><%=num1 %>%</p>          
        </div>
        
        <div class="progress progress--vertical">
          <div class="progress__fill" style="height: <%=num2 %>%"></div>
          <p class="progress__caption" style="color: black"> <%=num2 %>%</p>          
        </div>
        
        <div class="progress progress--vertical">
          <div class="progress__fill" style="height: <%=num3 %>%"></div>
          <p class="progress__caption" style="color: black"><%=num3 %>%</p>          
        </div>
        
        <div class="progress progress--vertical">
          <div class="progress__fill" style="height: <%=num4 %>%"></div>
          <p class="progress__caption" style="color: black"><%=num4 %>%</p>         
        </div>
        
        <div class="progress progress--vertical">
          <div class="progress__fill" style="height: <%=num5 %>%"></div>
          <p class="progress__caption" style="color: black"><%=num5 %>%</p>         
        </div>        

      </div>
    </div>
    
    <div class="flex-1">
      <ul class="lamps__list">
        
        <li class="lamps__item  lamps__total">
          <h2 class="lamps__count"><%=ActuatorDAO.getActCount()%></h2>
          <p class="lamps__description">Total Actuators</p>
        </li>
        
        <li class="lamps__item  lamps__active">
          <h2 class="lamps__count"><%=SensorDAO.getSenCount()%></h2>
          <p class="lamps__description">Total Sensors</p>
        </li>
        
      </ul> 
      <%
      String bData = "25";
      String lData = "21";
      String kData = "23";
      
      List<Sensor> bList = SensorDAO.getTemperatureByRoom("Bedroom");
      List<Sensor> lList = SensorDAO.getTemperatureByRoom("Living Room");
      List<Sensor> kList = SensorDAO.getTemperatureByRoom("Kitchen");
      
      if(!bList.isEmpty()) bData = bList.get(0).getUpdateData();
      if(!lList.isEmpty()) lData = lList.get(0).getUpdateData();
      if(!kList.isEmpty()) kData = kList.get(0).getUpdateData();

      %>
      
      <div class="temperature">
        <h4 class="title">General Temperature</h4>
        <div class="flex flex--justify-between">
          
          <div class="one-half">
            <div class="temperature__reading">
              &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%=bData %>° C           
            </div>
            <div class="temperature__description">
              Current           
            </div>
            <button class="button" onclick="javascrtpt:window.location.href='bedroom-detail.jsp'">Bedroom</button>
          </div>
          
          <div class="one-half">
            <div class="temperature__reading">
              &nbsp&nbsp&nbsp&nbsp<%=lData %>° C           
            </div>
            <div class="temperature__description">
              Target            
            </div>
            <button class="button" onclick="javascrtpt:window.location.href='living-room-detail.jsp'">Living Room</button>
          </div>  
          
           <div class="one-half">
            <div class="temperature__reading">
              &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%=kData %>° C           
            </div>
            <div class="temperature__description">
              Current           
            </div>
            <button class="button" onclick="javascrtpt:window.location.href='kitchen-detail.jsp'">Kitchen</button>
          </div>
          
        </div>
      </div> <!-- /.temperature -->
    </div> <!-- /.right-column -->
  </div> <!-- /.statistics -->
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/d3/3.5.5/d3.min.js'></script>
    <script  src="js/index.js"></script>

        <span class="thermostat" >
  <div class="bar" >
    <div class="inner_bar"></div>
    <div class='hold left'>
      <div class='fill fill1'></div>
    </div>
    <div class='hold right'>
      <div class='fill fill2'></div>
    </div>
    <span>Heating</span>
  </div>
  <div class="shadow">
    <div class="shadow-cube"></div>
  </div>
  <div class="number">
    <span class="ext">19</span>
  </div>
  <div class="center">
    <span class="arrow minus"><i class="material-icons">keyboard_arrow_left</i></span>
    <span class="arrow plus"><i class="material-icons">keyboard_arrow_right</i></span>
    <div class="small">
      <span class="heat">19</span>
    </div>
  </div>
</span>

        <!-- end of statistic -->
        <!-- <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br /> -->
        <div class="col-md-5 col-md-offset-1 onStep div-inline" data-animation="fadeInRight" data-time="600" style="width:500px;height:400;float:right; " >
          <div id="imghome" class="owl-carousel owl-theme">
            <div class="item">
              <div class="gal-home">
                  <div class="projects-grid">
                      <div class="hovereffect-color ">
                        <img class="img-responsive imgmain" alt="imghome" src="img/imghome1.jpg">
                          <div class="overlay start-align">
                            <div>
                              <h3>OVERVIEW <br> OF <br> ROOM</h3>
                              <p>Proin pretium consequat est, sit amet consectetur luctus vel Etiam quis...</p>
                              <a class="shin" href="projects-detail.jsp">
                              MORE DETAIL &rarr;
                              </a>
                            </div>
                          </div>
                      </div>
                  </div>
              </div>
            </div>
            <div class="item">
              <div class="gal-home">
                  <div class="projects-grid">
                      <div class="hovereffect-color ">
                        <img class="img-responsive imgmain" alt="imghome" src="img/imghome2.jpg">
                          <div class="overlay">
                            <div class="start-align">
                              <h3>REDESIGN <br> CO-WORKING <br> ROOM</h3>
                              <p>Proin pretium consequat est, sit amet consectetur luctus vel Etiam quis...</p>
                              <a class="shin" href="projects-detail.jsp">
                              MORE DETAIL &rarr;
                              </a>
                            </div>
                          </div>
                      </div>
                  </div>
              </div>
            </div>
            <div class="item">
              <div class="gal-home">
                  <div class="projects-grid">
                      <div class="hovereffect-color ">
                        <img class="img-responsive imgmain" alt="imghome" src="img/imghome3.jpg">
                          <div class="overlay">
                            <div class="start-align">
                              <h3>DESIGN <br> INTERIOR <br> BALCONY</h3>
                              <p>Proin pretium consequat est, sit amet consectetur luctus vel Etiam quis...</p>
                              <a class="shin" href="projects-detail.jsp">
                              MORE DETAIL &rarr;
                              </a>
                            </div>
                          </div>
                      </div>
                  </div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </section>
  <!-- about home end -->

 


       <!-- footer -->
       <footer class="footer">
        <div class="container-fluid m-5-hor">
          <div class="footer-widgets">
            <div class="row">
              <div class="col-md-8 col-sm-12 col-xs-12">
                <div class="widget footer-links">
                  <ul class="list-menu">
                  
                    
                  </ul>
                </div>
              </div>

              

            </div>
          </div>
        </div><!-- end container -->
          <div class="container-fluid m-5-hor">
            <div class="bottom-footer">
              <div class="row">
                <div class="col-sm-6 copyright">
                  <span>© 2019 Intelligent Home Control System, All Right Reserved</span>
                </div>
                <div class="col-sm-6 col-xs-12">
                  
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
                      <h4 class="modal-title">Welcome Back</h4>
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true" disabled="disabled">&times;</button>
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


    <!-- theromal demo start -->
    <script>
var gradi = 19;
var max = 34;
var min = 2;

function updateGr(){
  $(".heat").text("" + gradi);
  $(".ext").text("" + gradi);
  $(".number").css("transform", "translate(-50%, -50%) rotate("+ (-180 + gradi * 10)+"deg)");
  $(".shadow").css("transform", "translate(-50%, -50%) rotate("+ (-180 + gradi * 10)+"deg)");
  $(".fill").css("animation", "none");
  $(".shadow").css("animation", "none");
}


$(".minus").mousedown(function(){ 
  if(gradi > min){
    gradi--;
    updateGr();
    if(gradi >= 18){
      $(".fill1").css("transform", "rotate("+ (gradi - 18) * 10 +"deg)").css("transition-delay", "0s");
    }else if(gradi == 17){
      $(".fill2").css("transform", "rotate("+ gradi * 10 +"deg)").css("transition-delay", "0.5s");  
    }else{
      $(".fill2").css("transform", "rotate("+ gradi * 10 +"deg)").css("transition-delay", "0s");
    }
  }
});

$(".plus").mousedown(function(){
  if(gradi < max){
    gradi++;
    updateGr();
    if(gradi > 19){
      $(".fill1").css("transform", "rotate("+ (gradi - 18) * 10 +"deg)").css("transition-delay", "0s");
    }else if(gradi == 19){
      $(".fill1").css("transform", "rotate("+ (gradi - 18) * 10 +"deg)").css("transition-delay", "1s"); 
    }else{
      $(".fill2").css("transform", "rotate("+ gradi * 10 +"deg)").css("transition-delay", "0s");
    }
  }  
});

</script>
    <!-- theromal demo end -->

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