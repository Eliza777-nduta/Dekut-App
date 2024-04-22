<?php
session_start();
$patient_id = $_SESSION['patient_id'];
require_once "include/config.php";


// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $procedures = $_POST['procedures'];
    $redirect_page = $_POST['redirect_page'];

    // Prepare SQL statement to insert data into the database
    $sql = "INSERT INTO procedures (patient_id,procedures) VALUES ('$patient_id','$procedures')";

    // send the patient to docctor
    $pusherSql = "UPDATE pusher SET next_dept = 'doctor' WHERE patient_id='$patient_id'";
    $con->query($pusherSql);

    // Execute SQL statement and check if insertion was successful
    if ($con->query($sql) === TRUE) {
        // Insertion successful
        echo "procedure report inserted successfully!";
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
