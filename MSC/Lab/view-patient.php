<?php
session_start();
error_reporting(0);
include('include/config.php');

$uid=$_GET['uid'];
if(isset($uid)){
  $_SESSION['patient_id'] = $uid;
}

if(strlen($_SESSION['id']==0)) {
 header('location:logout.php');
  }

/// set current notification as read
$sql = "UPDATE notifications SET is_read = 1 WHERE patient_id = '$uid'";
$con->query($sql);
?>





<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Doctor | Patient Info</title>
		
		<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
		<link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
		<link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
		<link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet" media="screen">
		<link href="vendor/select2/select2.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-datepicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" media="screen">
		<link rel="stylesheet" href="assets/css/styles.css">
		<link rel="stylesheet" href="assets/css/plugins.css">
		<link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />

    <style>

.subnav ul li .subnav ul{
  display:block;  
}

.subnav ul li .subnav ul{
  display:none;
}

.subnav ul li .subnav ul li{
  list-style-type:none;
}
.subnav ul li:hover .subnav{
  display:block;
  position:absolute;
}
.subnav ul li:hover .subnav ul{
  display:block;
  align:left;
}
.subnav ul li:hover .subnav ul li{
  background:white;
  color:blue;
  text-align:center;
}
.btn-p{
  margin: 40px;
}



    </style>
	</head>
	<body>
		<div id="app">	
    <?php include('include/header.php');?>	
<?php include('include/sidebar.php');?>
<div class="app-content">
<?php include('include/header.php');?>
<div class="main-content" >
<div class="wrap-content container" id="container">
						<!-- start: PAGE TITLE -->
<section id="page-title">
<div class="row">
<div class="col-sm-8">
<h1 class="mainTitle">Doctor | Patient Info</h1>
</div>
<ol class="breadcrumb">
<li>
<span>Doctor</span>
</li>
<li class="active">
<span>Manage Patients</span>
</li>
</ol>
</div>
</section>
<div class="container-fluid container-fullw bg-white">
<div class="row">
<div class="col-md-12">
<h5 class="over-title margin-bottom-15">Manage <span class="text-bold">Patients</span></h5>
<?php
  $id=$_GET['uid'];
  $ret=mysqli_query($con,"select * from patients where id='$id' LIMIT 1;");
  $cnt=1;
while ($row=mysqli_fetch_array($ret)) {
  ?>

<table border="1" class="table table-bordered">
 <tr align="center">
<td colspan="4" style="font-size:20px;color:blue">
 Patient Details</td></tr>

    <tr>
    <th scope>Patient Name</th>
    <td><?php  echo $row['name'];?></td>
    <th scope>Patient Reg Number</th>
    <td><?php  echo $row['registrationno'];?></td>
  </tr>
  <tr>
    <th scope>Patient Mobile Number</th>
    <td><?php  echo $row['phoneNo'];?></td>
    <th>Patient Address</th>
    <td><?php  echo $row['address'];?></td>
  </tr>
    <tr>
    <th>Patient Gender</th>
    <td><?php  echo $row['gender'];?></td>
    <th>Patient DOB</th>
    <td><?php  echo $row['dob'];?></td>
  </tr>
  <tr>
  
     <th>Patient Reg Date</th>
    <td><?php  echo $row['regDate'];?></td>
  </tr>
 
<?php }?>
</table>
<?php  

$ret=mysqli_query($con,"select * from labform  where patient_id='$uid'");



 ?>
<table id="datatable" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
  <tr align="center">
   <th colspan="10" >Lab Test</th> 
  </tr>
  <tr>
    <th>#</th>
<th> Sample </th>
<th> Lab Test</th>
</tr>
<?php  
while ($row=mysqli_fetch_array($ret)) { 
  ?>
<tr>
  <td><?php echo $cnt;?></td>
 <td><?php  echo $row['sampletest'];?></td>
 <td><?php  echo $row['labtest'];?></td> 
</tr>
<?php $cnt=$cnt+1;} ?>
</table>

<?php  

// $ret=mysqli_query($con,"select * from tblmedicalhistory  where patient_id='$patientID'");



 ?>


<p align="center">                            
 <button class="btn btn-primary waves-effect waves-light w-lg" data-toggle="modal" data-target="#myModal">Add Lab Results</button></p>  

 <p>Here is some content</p>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document" style="width:70%; height:100%;">
     <div class="modal-content">
      <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add lab results</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            <table class="table table-bordered table-hover data-tables">

    <form action="send-lab-results.php" id="myForm" method="POST">

    <tr>
    <th>Lab Results Description :</th>
    <td>
    <textarea name="lab_results" rows="7" cols="30" class="form-control wd-450" required="true" placeholder="Enter lab results here...."></textarea></td>
  </tr> 
  
<tr>
    <div class="form-group">
    <th>Send Results to:</th>
    <td> 
  <label for="cars">Please select:</label> 
  <select id="dropdown" name="redirect_page" class="form-control"> 
    <option value="doctor:dashboard.php"> Doctor</option>
</select>
  </td>
</div>
</tr>
</table>


</div>
<div class="modal-footer">
 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
 <button type="submit" name="submit" class="btn btn-primary">Send</button>
  
  </form>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
			<!-- start: FOOTER -->
	<?php include('include/footer.php');?>
			<!-- end: FOOTER -->
		
			<!-- start: SETTINGS -->
	<?php include('include/setting.php');?>
			
			<!-- end: SETTINGS -->
		</div>
		<!-- start: MAIN JAVASCRIPTS -->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="vendor/modernizr/modernizr.js"></script>
		<script src="vendor/jquery-cookie/jquery.cookie.js"></script>
		<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
		<script src="vendor/switchery/switchery.min.js"></script>
		<!-- end: MAIN JAVASCRIPTS -->
		<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script src="vendor/maskedinput/jquery.maskedinput.min.js"></script>
		<script src="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
		<script src="vendor/autosize/autosize.min.js"></script>
		<script src="vendor/selectFx/classie.js"></script>
		<script src="vendor/selectFx/selectFx.js"></script>
		<script src="vendor/select2/select2.min.js"></script>
		<script src="vendor/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
		<script src="vendor/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>
		<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<!-- start: CLIP-TWO JAVASCRIPTS -->
		<script src="assets/js/main.js"></script>
		<!-- start: JavaScript Event Handlers for this page -->
		<script src="assets/js/form-elements.js"></script>
		<script>
			jQuery(document).ready(function() {
				Main.init();
				FormElements.init();
			});

</script>
	</body>
</html>
