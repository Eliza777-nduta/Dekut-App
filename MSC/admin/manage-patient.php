<?php
session_start();
error_reporting(0);
include('include/config.php');
if(strlen($_SESSION['id']==0)) {
 header('location:logout.php');
  } else{
	if(isset($_GET['del']))
		  {
		  	$patient_id=$_GET['id'];
		          mysqli_query($con,"delete from patients where id ='$uid'");
                  $_SESSION['msg']="data deleted !!";
		  }

?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>H.R.O | View Patients</title>
		
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
		<!-- Datatables CSS -->
		<link href="https://cdn.datatables.net/v/bs/dt-2.0.0/datatables.min.css" rel="stylesheet">
		<link href="https://cdn.datatables.net/select/1.3.4/css/select.dataTables.min.css"  rel="stylesheet" type="text/css" >
		<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.5/dist/sweetalert2.min.css" rel="stylesheet">
	</head>
	<body>
		<div id="app">	
				
<?php include('include/sidebar.php');?>
<div class="app-content">
<?php include('include/header.php');?>
<div class="main-content" >

<!-- Confirm send to doctor modal -->
<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Confirm Send to Doctor</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	  	Send notification to Doctor?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="confirmSend" type="button" class="btn btn-danger">Send</button>
      </div>
    </div>
  </div>
</div>
<!-- /Modal -->
<div class="wrap-content container" id="container">
						<!-- start: PAGE TITLE -->
<section id="page-title">
<div class="row">
<div class="col-sm-8">
<h1 class="mainTitle">H.R.O | View Patients</h1>
</div>
<ol class="breadcrumb">
<li>
<span>H.R.O</span>
</li>
<li class="active">
<span>View Patients</span>
</li>
</ol>
</div>
</section>
<div class="container-fluid container-fullw bg-white">
<div class="row">
<div class="col-md-11">
<h5 class="over-title margin-bottom-15">View <span class="text-bold">Patients</span></h5>
	
<table class="table table-hover" id="allPatients">
<thead>
<tr>
												<th class="center">#</th>
												<th style="display: none">UserId</th>
												<th>Name</th>
												<th class="hidden-xs">Reg Number</th>
												<th>Email</th>
												<th>School </th>
												<th>Course </th>
												<th>Address </th>
												<th>Phone Number </th>
												<th>DOB </th>
												<th>Gender </th>
												<th>Creation Date </th>
												
											</tr>
</thead>
<tbody>
<?php

$sql=mysqli_query($con,"select * from patients");
$cnt=1;
while($row=mysqli_fetch_array($sql))
{
?>
<tr>
<td class="center"><?php echo $cnt;?>.</td>

												<td style="display: none"><?php echo $row['id'];?></td>
												<td class="hidden-xs"><?php echo $row['name'];?></td>
												<td><?php echo $row['registrationno'];?></td>
												<td><?php echo $row['email'];?>
												</td>
												<td><?php echo $row['school'];?></td>
												<td><?php echo $row['course'];?></td>
												<td><?php echo $row['address'];?></td>
												<td><?php echo $row['phoneNo'];?></td>
												<td><?php echo $row['dob'];?></td>
												<td><?php echo $row['gender'];?></td>
												<td><?php echo $row['regDate'];?></td>
												
												



							
													
										
</tr>
<?php 
$cnt=$cnt+1;
 }?></tbody>
</table>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

<!-- Choose Doctor/nurse etc -->
<div id="medicalOfficers" style="display: none;">
    <select id="medicalOfficer" style="width: 200px;">
	<option value="">Select Doctor/nurse</option>
                            <?php $ret=mysqli_query($con,"select * from doctorslog");
                            while($row=mysqli_fetch_array($ret)) {
                                ?>
                                <option value="<?php echo htmlentities($row['uid']);?>">
                                    <?php echo htmlentities($row['username']);?>
                                </option>
                            <?php } ?>
	</select>
</div>

<!-- / Choose Doctor/nurse etc -->

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
		<!-- Datatables js -->
		<script src="https://cdn.datatables.net/v/bs/dt-2.0.0/datatables.min.js"></script>
		<script src="https://cdn.datatables.net/select/1.3.4/js/dataTables.select.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.5/dist/sweetalert2.all.min.js"></script>
		<script>

			jQuery(document).ready(function() {
				Main.init();
				FormElements.init();
			});
			
			// selected patient data
			let data;


			// initialize datatables
			let table = $("#allPatients").DataTable({
				select: true,
			});
			// click event to table row
			$('#allPatients tbody').on('click', 'tr', function () {
				data = table.row(this).data();
				console.log(Object.values(data))
				// Add your logic here to handle the click event
				showConfirmAlert();
			});

			function showConfirmAlert(){
				Swal.fire({
				title: "Select Medical Officer",
				text: "This will send a notification to the doctor",
				icon: "",
				html: document.getElementById('medicalOfficers').innerHTML,
				showCancelButton: true,
				confirmButtonColor: "#3085d6",
				cancelButtonColor: "#d33",
				confirmButtonText: "Yes, Send"
				}).then(async (result) => {
				if (result.isConfirmed) {
					if(data == undefined) {
					console.error("No patient has been selected. Please select a patient first.")
					return;
					}
					let userInfo = Object.values(data);

					
					
					let formData = new FormData();
					formData.append("patient_id", userInfo[1])
					formData.append("name", userInfo[2]);
					formData.append("regno", userInfo[3]);
					
					
					fetch("patient.php",{
						method: "POST",
						body: formData
					}).then(res => res.text()).then(res => {
						Swal.fire({
							title: "Sent!",
							text: "Doctor has been notified about this patient.",
							icon: "success"
						});
					}).catch(error => {
						console.error("Error posting patient to doctor: ", error);
						Swal.fire({
							title: "Error!",
							text: "Unable to send notification to doctor. Please try again.",
							icon: "error"
						});
					});
				}
				});
			}
		</script>
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
	</body>
</html>
<?php } ?>
