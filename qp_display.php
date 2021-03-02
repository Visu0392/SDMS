<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['alogin'])=="")
    {   
    header("Location: index.php"); 
    }
    else{
if(isset($_POST['submit']))
{
$class=$_POST['class'];
$subject=$_POST['subject']; 
$numofquestions=$_POST['numofquestions'];
$sql="select question from questionpaper where class="+$class+" and subject="+$subject;
$query = $dbh->prepare($sql);
$query->bindParam(':class',$class,PDO::PARAM_STR);
$query->bindParam(':subject',$subject,PDO::PARAM_STR);
$query->bindParam(':numofquestions',$numofquestions,PDO::PARAM_STR);
$result=$query->execute();
// $lastInsertId = $dbh->lastInsertId();
// if($lastInsertId)
// {
// $msg="Question added successfully";
// }
// else 
// {
// $error="Something went wrong. Please try again";
// }

// if($result!=0)
// {
    
// require('fpdf/fpdf.php');
// $pdf = new FPDF();
// $pdf->AddPage();
// $pdf->SetFont('Arial','B',14);
// foreach($result as $question) {
// 		$pdf->Cell(95,12,$question,1);
// }

$resultCount=$result->rowCount();
for($i=0;$i<$resultCount;$i++)
{
    $question=$result->fetch_row();
}
for($i=0;$i<$numofquestions;$i++)
{
    // $pdf->Cell(95,12,$question[rand()%$resultCount],1);
    // $pdf->AddLine();
    echo "<div class="form-group">
            <label for="default" class="col-sm-2 control-label"></label>
        </div>
        ";
}
// $pdf->Cell(95,12,Hi,1);
// $pdf->Output();

// }

// require('fpdf/fpdf.php');
// $pdf = new FPDF();
// $pdf->AddPage();
// $pdf->SetFont('Arial','B',14);
// foreach($result as $question) {
// 		$pdf->Cell(95,12,$question,1);
// }
// //$pdf->Cell(95,12,Hi,1);
// $pdf->Output();



}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Question Paper Generation</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
        <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
        <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
        <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >
        <link rel="stylesheet" href="css/prism/prism.css" media="screen" >
        <link rel="stylesheet" href="css/select2/select2.min.css" >
        <link rel="stylesheet" href="css/main.css" media="screen" >
        <script src="js/modernizr/modernizr.min.js"></script>
    </head>
    <body class="top-navbar-fixed" style='background-color:rgb(200, 0, 0)!important;'>
        <div class="main-wrapper">

            <!-- ========== TOP NAVBAR ========== -->
  <?php include('includes/topbar.php');?> 
            <!-- ========== WRAPPER FOR BOTH SIDEBARS & MAIN CONTENT ========== -->
            <div class="content-wrapper">
                <div class="content-container">

                    <!-- ========== LEFT SIDEBAR ========== -->
                   <?php include('includes/leftbar.php');?>  
                    <!-- /.left-sidebar -->

                    <div class="main-page">

                     <div class="container-fluid">
                            <div class="row page-title-div">
                                <div class="col-md-6">
                                    <h2 class="title">Question Paper</h2>
                                
                                </div>
                                
                                <!-- /.col-md-6 text-right -->
                            </div>
                            <!-- /.row -->
                            <div class="row breadcrumb-div">
                                <div class="col-md-6">
                                    <ul class="breadcrumb">
                                        <li><a href="dashboard.php"><i class="fa fa-home"></i> Home</a></li>
                                        <li> Question Paper</li>
                                        <li class="active">Questions</li>
                                    </ul>
                                </div>
                             
                            </div>
                            <!-- /.row -->
                        </div>

                        <section class="section">
 
                        <div class="container-fluid">
                           
                        <div class="row">
                                    <div class="col-md-12">
                                        <div class="panel">
                                            <div class="panel-heading">
                                                <div class="panel-title">
                                                    <h5>Questions</h5>
                                                </div>
                                            </div>
                                            <div class="panel-body">
<?php if($msg){?>
<div class="alert alert-success left-icon-alert" role="alert">
 <strong>Well done!</strong><?php echo htmlentities($msg); ?>
 </div><?php } 
// else if($error){?>
    <!-- <div class="alert alert-danger left-icon-alert" role="alert"> -->
                                            <!-- <strong>Oh snap!</strong> <?php echo htmlentities($error); ?> -->
                                        <!-- </div> -->
                                        <?php //} ?>
                                                <form class="form-horizontal" id="qp_display" method="post">
                                                    
                                                    
                                                    <div class="form-group">
                                                        <div class="col-sm-offset-2 col-sm-10">
                                                            <button type="submit" name="submit" class="btn btn-primary"><a href="generate_qp.php">Back</a></button>
                                                            <button type="submit" name="submit" class="btn btn-primary">PDF</button>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="default" class="col-sm-2 control-label"></label>
                                                        <div class="col-sm-10">
                                                        </div>
                                                    </div>




                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.col-md-12 -->
                                </div>
                            </section>     
                    </div>
                </div>
                <!-- /.content-container -->
            </div>
            <!-- /.content-wrapper -->
        </div>
    
    </body>
</html>
<?PHP } ?>