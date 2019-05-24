<?php
#  include 'aliyun-php-sdk-core/smsDemo.php';
  header("Content-type:text/html;charset=utf-8");
  
 $account=$_POST["account"];
 $password=$_POST["password"];
  
 $dbhost = 'localhost:3306';  
 $dbuser = 'root';            
 $dbpass = 'logic';          
 $link = mysqli_connect($dbhost, $dbuser, $dbpass);
 if(! $link )
 {
     die('mysql connection failed.' . mysqli_error($conn));
 }
  mysqli_query($link , "set names utf8");

 $sql="SELECT * FROM users Where account='$account'AND password='$password'";
 mysqli_select_db($link, 'XH');
 $result=mysqli_query($link,$sql);

  if(mysqli_num_rows($result)==0)
  {
    mysqli_free_result($result);
    mysqli_close($link);
    echo "failed to generate temp key";
#    echo "account: $account password: $password";   
    return false;
#    echo "<script type='text/javascript'>";
#    echo "alert('wrong username or password, Please tye again $account $password');";
#    echo "history.back();";
#    echo "</script>";
  }

  else
  {
    $id = mysqli_fetch_object($result)->id;
    session_start();
    $_SESSION['account']=$account;
    mysqli_free_result($result);

    $rd1=rand(0,9);
    $rd2=rand(0,9);
    $rd3=rand(0,9);
    $rd4=rand(0,9);
    $rd5=rand(0,9);
    $rd6=rand(0,9);
    $currentTime=time();
    $sqlcmd2="UPDATE users SET tempKey='$rd1$rd2$rd3$rd4$rd5$rd6' WHERE account='$account'";
    $sqlcmd3="UPDATE users SET tempKeyStartTime='$currentTime' WHERE account='$account'";
    $result2=mysqli_query($link,$sqlcmd2);    
    $result3=mysqli_query($link,$sqlcmd3);
#    $passtime=time() - $result2->tempKeyStartTime;
#    echo "passtime: $passtime)\n";
    mysqli_free_result($result2);
    mysqli_free_result($result3);
    mysqli_close($link);
   # sendSms();
    echo "$rd1$rd2$rd3$rd4$rd5$rd6";
    

#  include 'aliyun-php-sdk-core/smsDemo.php';
  
 #   sendSms();
    return true;
}

?>
