<?php
session_start();
$patient_id=$_SESSION['patient_id'];

// Include database connection
include('include/config.php');

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data

    $sampletest = $_POST['sampletest'];
    $labtest = $_POST['labtest'];

    // Prepare SQL statement to insert data into the database
    $sql = "INSERT INTO labform (patient_id, sampletest, labtest) VALUES ('$patient_id','$sampletest', '$labtest')";

    // Execute SQL statement and check if insertion was successful
    if ($con->query($sql) === TRUE) {
        // Insertion successful
        echo "Form data inserted successfully!";
        header("Location:dashboard.php");
    } else {
        // Insertion failed
        echo "Error: " . $sql . "<br>" . $con->error;
        header("Location:lab.php");
    }

    // Close database connection
    $con->close();
}
?>

?>