<?php
session_start();
$patient_id = $_SESSION['patient_id'];
require_once "include/config.php";


// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $lab_results = $_POST['lab_results'];
    $redirect_page = $_POST['redirect_page'];

    // Prepare SQL statement to insert data into the database
    $sql = "INSERT INTO labresults (patient_id,lab_results) VALUES ('$patient_id','$lab_results')";

    // send the patient to docctor
    $pusherSql = "UPDATE pusher SET next_dept = 'doctor' WHERE patient_id='$patient_id'";
    $con->query($pusherSql);

    // Execute SQL statement and check if insertion was successful
    if ($con->query($sql) === TRUE) {
        // Insertion successful
        echo "Lab results inserted successfully!";
        // unset patient session 
        header("Location: dashboard.php");
    } else {
        // Insertion failed
        echo "Error: " . $sql . "<br>" . $con->error;
        header("Location: " . $_SERVER['HTTP_REFERER']);
    }

    // Close database connection
    $con->close();
}