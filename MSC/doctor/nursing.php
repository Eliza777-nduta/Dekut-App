<?php
include_once('include/config.php');


// Check if patient ID is provided
if (isset($_GET['id'])) {
    $patientId = $_GET['id'];
    
    // Prepare and execute SQL query to fetch patient details
    $sql = "SELECT * FROM patient WHERE id = $patientId";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Patient found, return JSON response
        $row = $result->fetch_assoc();
        echo json_encode($row);
    } else {
        // Patient not found, return error
        http_response_code(404);
        echo json_encode(array("error" => "Patient not found"));
    }
} else {
    // No patient ID provided, return error
    http_response_code(400);
    echo json_encode(array("error" => "Patient ID is required"));
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>lab</title>
</head>
<body>
<?php include('include/sidebar.php');?>
<?php include('include/header.php');?>
<div class="container">
	<h2 style="text-align:center; margin-top: 50px;"> Nursing Room</h2>
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <form id="labTestForm" action="" method="POST" style="margin-top: 50px;">

            <div class="form-group">
                    <label for="user_id"> PatientID</label>
                    <input type="text" class="form-control" id="patientId" name="patientId" >
                </div>

                <div class="form-group">
                    <label for="name"> Name</label>
                    <input type="text" class="form-control" id="name" name="name" readonly>
                </div>
                <div class="col-sm">
                <div class="form-group">
                    <label for="regno"> Registration No.</label>
                    <input type="text" class="form-control" id="regno" name="regno" readonly>
                </div>
                <div class="col-sm">
                <div class="form-group">
                    <label for="phoneno"> Phone Number</label>
                    <input type="text" class="form-control" id="phoneno" name="phoneno" readonly>
                </div>
                <!--
                <div class="form-group">
                        <label for="sample"> Sample</label>
                        <select name="sample" class="form-control"  required="required">
                            <option value="">Select sample</option>
                            <?php $ret=mysqli_query($con,"select * from sample");
                            while($row=mysqli_fetch_array($ret)) {
                                ?>
                                <option value="<?php echo htmlentities($row['sample']);?>">
                                    <?php echo htmlentities($row['sample']);?>
                                </option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                            -->
                <div class="form-group">
                        <label for="procedure"> Procedures</label>
                        <select name="services" class="form-control"  required="required">
                            <option value="">Select procedure</option>
                            <?php $ret=mysqli_query($con,"select * from nursing");
                            while($row=mysqli_fetch_array($ret)) {
                                ?>
                                <option value="<?php echo htmlentities($row['services']);?>">
                                    <?php echo htmlentities($row['services']);?>
                                </option>
                            <?php } ?>
                        </select>
                    </div>
                
                <button type="submit">Submit</button>
                </div>
                            </div>
                            </div>



                            <script>
                                document.getElementById('labTestForm').addEventListener('submit', function(event) {
  event.preventDefault(); // Prevent form submission
  
  // Get patient ID entered by the doctor
  const patientId = document.getElementById('patientId').value;
  
  // Fetch patient details from backend API
  fetch(`/api/patients/${patientId}`)
    .then(response => response.json())
    .then(patient => {
      // Populate patient details in the form
      document.getElementById('name').value = patient.name;
      document.getElementById('regno').value = patient.regno;
      document.getElementById('phoneno').value = patient.phoneno;

      // Handle other form fields if needed
    })
    .catch(error => console.error('Error fetching patient data:', error));
});

                            </script>
</body>
</html>