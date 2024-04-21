<?php
session_start();
error_reporting(0);
include('include/config.php');
if(strlen($_SESSION['id']==0)) {
 header('location:logout.php');
  } else{
if(isset($_POST['submit']))
  {
    
    $id=$_GET['patientID'];
    $chiefc=$_POST['complain'];
    $illnesshist=$_POST['illnesshistory'];
    $phyexam=$_POST['physicalexam'];
    $diagnosis=$_POST['diagnosis'];
    $investigation=$_POST['investigation'];
  
   
   
 
      $query.=mysqli_query($con, "insert   tblmedicalhistory(PatientID,ChiefComplain,IlnessHistory,PhyscalExam,Diagnosis,Investigation)value('$uid','$chiefc','$illnesshist','$phyexam','$diagnosis','$investigation')");
    if ($query) {
    echo '<script>alert("Medicle history has been added.")</script>';
    
  }
  else
    {
      echo '<script>alert("Something Went Wrong. Please try again")</script>';
    }

  
}

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
  $id=$_GET['patientID'];
  $ret=mysqli_query($con,"select * from patients where patientID='$id' LIMIT 1;");
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

$ret=mysqli_query($con,"select * from tblmedicalhistory  where PatientID='$patientID'");



 ?>
<table id="datatable" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
  <tr align="center">
   <th colspan="10" >Medical History</th> 
  </tr>
  <tr>
    <th>#</th>
    <th>PatientID</th>
<th> Chief complain</th>
<th> Illness History</th>
<th> Physical Exam</th>
<th> Diagnosis</th>
<th> Investigation</th>
<th>Visit Date</th>
</tr>
<?php  
while ($row=mysqli_fetch_array($ret)) { 
  ?>
<tr>
  <td><?php echo $cnt;?></td>
  <td><?php  echo $row['patientID'];?></td>
 <td><?php  echo $row['complain'];?></td>
 <td><?php  echo $row['illnesshistory'];?></td>
 <td><?php  echo $row['physicalexam'];?></td> 
  <td><?php  echo $row['diagnosis'];?></td>
  <td><?php  echo $row['investigation'];?></td>
  <td><?php  echo $row['CreationDate'];?></td> 
</tr>
<?php $cnt=$cnt+1;} ?>
</table>

<p align="center">                            
 <button class="btn btn-primary waves-effect waves-light w-lg" data-toggle="modal" data-target="#myModal">Add Medical History</button></p>  

<?php  ?>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document" style="width:70%; height:100%;">
     <div class="modal-content">
      <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Medical History</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            <table class="table table-bordered table-hover data-tables">

    <form method="post" name="submit">

    <tr>
    <th>Chief Complain :</th>
    <td>
    <textarea name="complain" placeholder="Chief Complain" rows="3" cols="5" class="form-control wd-450" required="true"></textarea></td>
  </tr> 
    <th>History of presenting illness :</th>
    <td>
    <textarea name="illnesshistory" placeholder="history of illness" rows="3" cols="5" class="form-control wd-450" required="true"></textarea></td>
  </tr> 
  <tr>
    <th>Physical Exam :</th>
    <td>
    <textarea name="physicalexam" placeholder="Physical Exam" rows="3" cols="5" class="form-control wd-450" required="true"></textarea></td>
  </tr>  
  <tr> 
    <th> Diagnosis</th>
    <td>
  <div class="form-group">
                    <select name="diagnosis" class="form-control" required="required">
                        <option value="">Select Diagnosis</option>
                        <?php $ret=mysqli_query($con,"select * from diagnosis");
                        while($row=mysqli_fetch_array($ret)) {
                            ?>
                            <option value="<?php echo htmlentities($row['diagnosis']);?>">
                                <?php echo htmlentities($row['diagnosis']);?>
                            </option>
                        <?php } ?>
                    </select>
                </div>
                        </td>
</tr>
<tr>
    <div class="form-group">
    <th>Investigation</th>
    <td>  
  <select id="dropdown" class="form-control">
    <option value="select"> Please select</option> 
    <option value="lab.php"> Lab</option>
    <option value="imaging.php">Imaging</option>
    <option value="nursing.php">Nursing</option>
    <option value="prescription.php"> Pharmacy</option>
</select>
  </td>
</div>
</tr>
</table>


</div>
<div class="modal-footer">
 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
 <button type="submit" name="submit" class="btn btn-primary">submit</button>
  
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
<script>
  document.addEventListener("DOMContentLoaded", function() {
  var dropdown = document.getElementById("dropdown");

  dropdown.addEventListener("change", function() {
    var selectedPage = dropdown.value;
    // Redirect to the selected page
    window.location.href = selectedPage;
  });
});

</script>
	</body>
</html>
<?php }  ?>
