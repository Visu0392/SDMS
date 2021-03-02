<?php
session_start();
error_reporting(0);
include('includes/config.php');
if($_SESSION['alogin']!=''){
$_SESSION['alogin']='';
}

if(isset($_POST['Ausername']))
{
    
    $uname=$_POST['Ausername'];
$password=$_POST['Apassword'];
$sql ="SELECT UserName,Password FROM admin WHERE UserName=:Auname and Password=:Apassword";
$query= $dbh -> prepare($sql);
$query-> bindParam(':Auname', $uname, PDO::PARAM_STR);
$query-> bindParam(':Apassword', $password, PDO::PARAM_STR);
$query-> execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
if($query->rowCount() > 0)
{

$_SESSION['alogin']=$_POST['Ausername'];
echo "<script type='text/javascript'> document.location = 'dashboard.php'; </script>";
} else{
    
    echo "<script>alert('Invalid Details');</script>";

}
}


if(isset($_POST['Susername']))
{
    
    $uname=$_POST['Susername'];
$password=$_POST['Spassword'];
$sql ="SELECT UserName,Password FROM student WHERE UserName=:Suname and Password=:Spassword";
$query= $dbh -> prepare($sql);
$query-> bindParam(':Suname', $uname, PDO::PARAM_STR);
$query-> bindParam(':Spassword', $password, PDO::PARAM_STR);
$query-> execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
if($query->rowCount() > 0)
{

$_SESSION['alogin']=$_POST['Susername'];
echo "<script type='text/javascript'> document.location = 'student_dashboard.php'; </script>";
} else{
    
    echo "<script>alert('Invalid Details');</script>";

}


}

?>



<html>
<head>
<title>Student Results</title>

<link rel="stylesheet" type="text/css" href="style1.css">
</head>
<body style='background-color:rgba(223, 52, 52)!important;'>

<br>
    
    <h1 style="font-size: 200% "> SMS Student Management System </h1>
<div class="loginbox">
    <img src="images/loginimg.png" class="avatar">
    <h1>Admin Login</h1>
    <form method='POST'>
        <p>Admin ID:</p>
        <input type="text" name="Ausername" placeholder="Enter admin id">
        <p>Password:</p>
        <input type="password" name="Apassword" placeholder="Enter Password">
        <input type="submit" name="Alogin" value="Login">
        
    </form>
</div>

<div class="loginbox1">
        <img src="images/loginimg.png" class="avatar1">
        <h1>Student Login</h1>
    <form method='POST'>
        <p>Student ID:</p>
        <input type="text" name="Susername" placeholder="Enter student id">
        <p>Password:</p>
        <input type="password" name="Spassword" placeholder="Enter Password">
        <input type="submit" name="Slogin" value="Login">
        
    </form>
        <!-- <a href="find-result2.php">Click here for your Results</a> -->
        
    </div>
    
</body>
</html>