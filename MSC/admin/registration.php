<?php
error_reporting(0);
include_once('include/config.php');
if (isset($_POST['submit'])) {
	$fname = $_POST['name'];
	$regNumber = $_POST['registrationno'];
	$email = $_POST['email'];
	$school = $_POST['school'];
	$course = $_POST['course'];
	$address = $_POST['address'];
	$phoneNumber = $_POST['phoneNo'];
	$dob = $_POST['dob'];
	$gender = $_POST['gender'];
	$password = md5($_POST['password']);
	$query = mysqli_query($con, "insert into patients(name,registrationno,email,school,course,address,phoneNo,dob,gender,password) values('$fname','$regNumber','$email','$school','$course','$address','$phoneNumber','$dob','$gender','$password')");
	if ($query) {
		echo "<script>alert('Successfully Registered. You can login now');</script>";
		header("location:manage-patient.php");
	}
}
?>


<!DOCTYPE html>
<html lang="en">

<head>
	<title>User Registration</title>

	<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
	<link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
	<link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
	<link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" href="assets/css/styles.css">
	<link rel="stylesheet" href="assets/css/plugins.css">
	<link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />




</head>

<body class="login">
	<!-- start: REGISTRATION -->
	<div class="row">
		<div class="main-login col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<!--<div class="logo margin-top-30">
					<img src="assets/images/logo.PNG" alt="DEKUT"/>
				</div>
				 start: REGISTER BOX -->
			<div class="box-register">
				<form name="registration" id="registration" method="post">
					<fieldset>
						<legend>
							Sign Up
						</legend>
						<p>
							Enter your personal details below:
						</p>
						<div class="form-group">
							<input type="text" class="form-control" name="name" placeholder="Name" required="true">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="registrationno" placeholder="Registration Number" required="true">
						</div>
						<div class="form-group">
							<span class="input-icon">
								<input type="email" class="form-control" name="email" id="email" onBlur="userAvailability()" placeholder="Email" required>
								<i class="fa fa-envelope"></i> </span>
							<span id="user-availability-status1" style="font-size:12px;"></span>
						</div>
						<div class="form-group">
							<label for="school">School</label>
							<select name="school" class="form-control" required="required">
								<option value="">Select School</option>
								<?php $ret = mysqli_query($con, "select * from school");
								while ($row = mysqli_fetch_array($ret)) {
								?>
									<option value="<?php echo htmlentities($row['school']); ?>">
										<?php echo htmlentities($row['school']); ?>
									</option>
								<?php } ?>
							</select>
						</div>
						<div class="form-group">
							<label for="course">Course</label>
							<select name="course" class="form-control" required="required">
								<option value="">Select Course</option>
								<?php $ret = mysqli_query($con, "select * from course");
								while ($row = mysqli_fetch_array($ret)) {
								?>
									<option value="<?php echo htmlentities($row['course']); ?>">
										<?php echo htmlentities($row['course']); ?>
									</option>
								<?php } ?>
							</select>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="address" placeholder="Address" required="true">
						</div>
						<div class="form-group">
							<input type="tel" class="form-control" name="phoneNo" placeholder="Phone Number" required="true">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="dob" placeholder="0000-00-00" required="true">
						</div>

						<div class="form-group">
							<label class="block">
								Gender
							</label>
							<div class="clip-radio radio-primary">
								<input type="radio" id="rg-female" name="gender" value="female">
								<label for="rg-female">
									Female
								</label>
								<input type="radio" id="rg-male" name="gender" value="male">
								<label for="rg-male">
									Male
								</label>
							</div>

						</div>

						<p>
							Enter your account details below:
						</p>

						<div class="form-group">
							<span class="input-icon">
								<input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
								<i class="fa fa-lock"></i> </span>
						</div>
						<div class="form-group">
							<span class="input-icon">
								<input type="password" class="form-control" id="password_again" name="password_again" placeholder="Password Again" required>
								<i class="fa fa-lock"></i> </span>
						</div>
						<div class="form-group">
							<div class="checkbox clip-check check-primary">
								<input type="checkbox" id="agree" value="agree" checked="true" readonly=" true">
								<label for="agree">
									I agree
								</label>
							</div>
						</div>
						<div class="form-actions">
							<p>
								Already have an account?
								<a href="login.php">
									Login
								</a>
							</p>
							<button type="submit" class="btn btn-primary pull-right" id="submit" name="submit">
								Submit <i class="fa fa-arrow-circle-right"></i>
							</button>
						</div>
					</fieldset>
				</form>

				<div class="copyright">
					&copy; <span class="current-year"></span><span class="text-bold text-uppercase">DEKUT</span>. <span>All rights reserved</span>
				</div>

			</div>

		</div>
	</div>
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/modernizr/modernizr.js"></script>
	<script src="vendor/jquery-cookie/jquery.cookie.js"></script>
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="vendor/switchery/switchery.min.js"></script>
	<script src="vendor/jquery-validation/jquery.validate.min.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="assets/js/login.js"></script>
	<script>
		jQuery(document).ready(function() {
			Main.init();
			Login.init();
		});
	</script>

	<script>
		function userAvailability() {
			$("#loaderIcon").show();
			jQuery.ajax({
				url: "check_availability.php",
				data: 'email=' + $("#email").val(),
				type: "POST",
				success: function(data) {
					$("#user-availability-status1").html(data);
					$("#loaderIcon").hide();
				},
				error: function() {}
			});
		}
	</script>

</body>
<!-- end: BODY -->

</html>