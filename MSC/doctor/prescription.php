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
if (isset($_POST['submit'])) {
    $name = $_POST['name'];
    $drugName = $_POST['drugname'];
    $amount = $_POST['amount'];
    $route = $_POST['route'];
    $frequency = $_POST['frequency'];
    $howMuch = $_POST['howmuch'];
    $refill = $_POST['refill'];


    $query = mysqli_query($con, "insert into prescription(name,drugname,amount,route,frequency,howmuch,refill) values('$name','$drugName','$amount','$route','$frequency','$howMuch','$refill')");

    if ($query) {
        echo "Prescription added successfully !!";
        header("location:'view-patient.php");
    }
}


if (isset($_GET['del'])) {
    $id = $_GET['del']; // Changed from $_GET['id'] to $_GET['del']
    mysqli_query($con, "delete from prescription where id = '$id'");
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
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
    <?php include('include/sidebar.php'); ?>
    <?php include('include/header.php'); ?>

    <div class="container">
        <h2 style="text-align:center; margin-top: 180px;">Prescription</h2>
        <span class="ml-4">Prescriptions</span>
        <div class="row" id="displayData"></div>
        <div class=" row mb-4">
            <div class="col-md-6 col-md-offset-3">
                <form action="" method="POST" style="margin-top: 10px;" id="myForm">
                    <div class="form-group">
                        <label for="name"> Name</label>
                        <input type="text" class="form-control" id="name" name="name" readonly value="<?= $patient['name']; ?>">
                    </div>
                    <div class="form-group">
                        <label for="drugname">Drug Name</label>
                        <select name="drugname" class="form-control">
                            <option value="">Select Drug Name</option>
                            <?php $ret = mysqli_query($con, "select * from drugname");
                            while ($row = mysqli_fetch_array($ret)) {
                            ?>
                                <option value="<?php echo htmlentities($row['drugname']); ?>">
                                    <?php echo htmlentities($row['drugname']); ?>
                                </option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="quantity"> Quantity</label>
                        <input type="text" class="form-control" id="quantity" name="quantity" placeholder="number of Drugs">
                    </div>
                    <div class="form-group">
                        <label for="route">Route</label>
                        <select name="route" class="form-control">
                            <option value="">Select Route</option>
                            <?php $ret = mysqli_query($con, "select * from route");
                            while ($row = mysqli_fetch_array($ret)) {
                            ?>
                                <option value="<?php echo htmlentities($row['route']); ?>">
                                    <?php echo htmlentities($row['route']); ?>
                                </option>
                            <?php } ?>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="frequency">Frequency</label>
                        <select name="frequency" class="form-control">
                            <option value="">Select Frequency</option>
                            <?php $ret = mysqli_query($con, "select * from frequency");
                            while ($row = mysqli_fetch_array($ret)) {
                            ?>
                                <option value="<?php echo htmlentities($row['frequency']); ?>">
                                    <?php echo htmlentities($row['frequency']); ?>
                                </option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="howmany"> How Much</label>
                        <input type="text" class="form-control" id="howmany" name="howmany" placeholder="How many drug to be dispensed">
                    </div>
                    <div class="form-group">
                        <label for="refill"> Refill</label>
                        <input type="text" class="form-control" id="refill" name="refill" placeholder="Number of refills">
                    </div>
                    <div class="row d-flex align-items-center justify-content-around w-100">
                        <button class="btn btn-secondary" id="btnAdd">Add New</button>
                        <button type="submit" class="btn btn-success">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('myForm');
            const displayData = document.getElementById('displayData');

            document.getElementById('btnAdd').addEventListener('click', function(event) {
                event.preventDefault(); // Prevent form submission

                // Get form data
                const formData = new FormData(form);
                const prescription = {};
                formData.forEach((value, key) => {
                    prescription[key] = value;
                });

                // Save to session storage
                let prescriptions = JSON.parse(sessionStorage.getItem('prescriptions')) || [];
                prescriptions.push(prescription);
                sessionStorage.setItem('prescriptions', JSON.stringify(prescriptions));

                // Update UI with list of prescriptions
                displayPrescriptions(prescriptions);
                // reset fom
                form.reset();
            });

            function displayPrescriptions(prescriptions) {
                let html = `<ul class="list-inline overflow-scroll pb-3" style="display: inline-flex; overflow-x: scroll; overflow-y: hidden;">`;
                prescriptions.forEach(prescription => {
                    html += `
                    <li>
                        <div class="container" style="font-size: 12px; width: 350px; height: 250px;">
                            <div class="card">
                                <div class="card-body">
                                    <h6 class="card-subtitle mb-2 text-muted">Prescription Details</h6>
                                    <dl class="row text-nowrap">
                                        <dt class="col-sm-3">Name:</dt>
                                        <dd class="col-sm-9">${prescription.name}</dd>

                                        <dt class="col-sm-3">Drug Name:</dt>
                                        <dd class="col-sm-9">${prescription.drugname}</dd>

                                        <dt class="col-sm-3">Quantity:</dt>
                                        <dd class="col-sm-9">${prescription.quantity}</dd>

                                        <dt class="col-sm-3">Route:</dt>
                                        <dd class="col-sm-9">${prescription.route}</dd>

                                        <dt class="col-sm-3">Frequency:</dt>
                                        <dd class="col-sm-9">${prescription.frequency}</dd>

                                        <dt class="col-sm-3">How Much:</dt>
                                        <dd class="col-sm-9">${prescription.howmany}</dd>

                                        <dt class="col-sm-3">Refill:</dt>
                                        <dd class="col-sm-9">${prescription.refill}</dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                    </li>`;
                });

                html += `</ul>`;
                displayData.innerHTML = html;
            }


            // Initial display of prescriptions from session storage
            const initialPrescriptions = JSON.parse(sessionStorage.getItem('prescriptions')) || [];
            displayPrescriptions(initialPrescriptions);
        });


        // submitting the data
        document.getElementById('myForm').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent default form submission

            // Get JSON data from sessionStorage
            const jsonData = sessionStorage.getItem('prescriptions');

            if (!jsonData) {
                console.error('No prescription data found in sessionStorage');
                return;
            }

            // Send data to backend
            fetch('process-add-prescription.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: jsonData
                })
                .then(response => response.json())
                .then(data => {
                    console.log('Response from server:', data);
                    if (data.success) {
                        // clear data from session_storage
                        sessionStorage.removeItem("prescriptions");
                        displayPrescriptions([]);
                        alert("Prescription saved successfully");
                    }
                    // Handle response as needed
                })
                .catch(error => {
                    console.error('Error:', error);
                    // Handle error
                    alert("Could not save prescription, please try again.");
                });
        });
    </script>
</body>

</html>