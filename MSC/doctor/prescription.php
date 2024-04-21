<?php
require_once('include/config.php');
session_start();

// Check if patient ID is provided
$patientId = $_SESSION['patient_id'];
if (isset($patientId)) {
    
    // Prepare and execute SQL query to fetch patient details
    $sql = "SELECT * FROM patients WHERE id = '$patientId' LIMIT 1;";

    $result = $con->query($sql);

    if ($result->num_rows == 0) {
        // redirect to home, since no patient like this was found
        header("Location: dashboard.php");
        exit();
    }
    
    $patient = $result->fetch_assoc();

} else {
    // No patient ID provided, return error
    http_response_code(400);
    echo json_encode(array("error" => "Patient ID is required"));
}
?>

<?php
include_once('include/config.php');
if(isset($_POST['submit']))
{
        $name=$_POST['name'];
        $drugName = $_POST['drugname'];
        $amount = $_POST['amount'];
        $route = $_POST['route'];
        $frequency = $_POST['frequency'];
        $howMuch = $_POST['howmuch'];
        $refill = $_POST['refill'];
        
        
        $query=mysqli_query($con,"insert into prescription(name,drugname,amount,route,frequency,howmuch,refill) values('$name','$drugName','$amount','$route','$frequency','$howMuch','$refill')");
        
        if($query)
{
            echo "Prescription added successfully !!";
            header("location:'view-patient.php");
        }
    }


if(isset($_GET['del'])) {
    $id = $_GET['del']; // Changed from $_GET['id'] to $_GET['del']
    mysqli_query($con,"delete from prescription where id = '$id'");
    $_SESSION['msg'] = "Data deleted !!";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Doctor | Prescription</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
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
    <link href="vendor/bootstrap-datepicker/bootstrap-datepicker3ubmittandalone.min.css" rel="stylesheet" media="screen">
    <link href="vendor/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
</head>
<body>
<?php include('include/sidebar.php');?>
<?php include('include/header.php');?>

<div class="container">
	<h2 style="text-align:center; margin-top: 70px;">Prescription</h2>
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <form action="" method="POST" style="margin-top: 10px;" id="myform">
                <div class="form-group">
                    <label for="name"> Name</label>
                    <input type="text" class="form-control" id="name" name="name" readonly value="<?=$patient['name'];?>">
                </div>
                <div class="col-sm">
                    <div class="form-group">
                        <label for="drugname">Drug Name</label>
                        <select name="drugname" class="form-control"  required="required">
                            <option value="">Select Drug Name</option>
                            <?php $ret=mysqli_query($con,"select * from drugname");
                            while($row=mysqli_fetch_array($ret)) {
                                ?>
                                <option value="<?php echo htmlentities($row['drugname']);?>">
                                    <?php echo htmlentities($row['drugname']);?>
                                </option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
				<div class="col-sm">
                <div class="form-group">
                    <label for="quantity"> Quantity</label>
                    <input type="text" class="form-control" id="quantity" name="quantity" placeholder="number of Drugs">
                </div>

				<div class="col-sm">
                <div class="form-group">
                    <label for="route">Route</label>
                    <select name="route" class="form-control" required="required">
                        <option value="">Select Route</option>
                        <?php $ret=mysqli_query($con,"select * from route");
                        while($row=mysqli_fetch_array($ret)) {
                            ?>
                            <option value="<?php echo htmlentities($row['route']);?>">
                                <?php echo htmlentities($row['route']);?>
                            </option>
                        <?php } ?>
                    </select>
                </div>

				<div class="col-sm">
                <div class="form-group">
                    <label for="frequency">Frequency</label>
                    <select name="frequency" class="form-control" required="required">
                        <option value="">Select Frequency</option>
                        <?php $ret=mysqli_query($con,"select * from frequency");
                        while($row=mysqli_fetch_array($ret)) {
                            ?>
                            <option value="<?php echo htmlentities($row['frequency']);?>">
                                <?php echo htmlentities($row['frequency']);?>
                            </option>
                        <?php } ?>
                    </select>
                </div>
				<div class="col-sm">
                <div class="form-group">
                    <label for="howmany"> How Much</label>
                    <input type="text" class="form-control" id="howmany" name="howmany" placeholder="How many drug to be dispensed">
                </div>
<div class="col-sm">
                <div class="form-group">
                    <label for="refill"> Refill</label>
                    <input type="text" class="form-control" id="refill" name="refill" placeholder="Number of refills">
                </div>

                
                <button type="submit">Submit</button>
            </form>
            <div id="displayData"></div>
        </div>
    </div>
</div>


<script>
   document.getElementById('myForm').addEventListener('submit', function(event) {
  // Prevent the default form submission behavior
  event.preventDefault();
  var name = document.getElementById("name").value;
  var drugname = document.getElementById("drugname").value;
  var quantity = document.getElementById("quantity").value;
  var route = document.getElementById("route").value;
  var frequency = document.getElementById("frequency").value;
  var howmany = document.getElementById("howmany").value;
  var refill = document.getElementById("refill").value;


  // Display data in preview section
  var displayDiv = document.getElementById("displayData");
  displayDiv.innerHTML = "<h2>Preview</h2>" +
                         "<p><strong>Drug name:</strong> " + drugname + "</p>" +
                         "<p><strong>Quantity:</strong> " + quantity + "</p>" +
                         "<p><strong>Route:</strong> " + route + "</p>";
                         "<p><strong>Frequency:</strong> " + frequency + "</p>";
                         "<p><strong>How many:</strong> " + howmany + "</p>";
                         "<p><strong>Refill:</strong> " + refill + "</p>";

   });

</script>
</body>
</html>
