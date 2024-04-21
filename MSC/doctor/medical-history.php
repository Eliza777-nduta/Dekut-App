<?php
session_start();
$patient_id = $_SESSION['patient_id'];
require_once "include/config.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
      // Retrieve the submitted data
      $complain = $_POST['complain'];
      $illnesshistory = $_POST['illnesshistory'];
      $physicalexam = $_POST['physicalexam'];
      $diagnosis = $_POST['diagnosis'];
      $investigation = explode( ":",$_POST['redirect_page']);
      $next_dept = $investigation[0];
      $redirect_page = $investigation[1];

      // insert into medical history
       // Insert data into tblmedicalhistory
       $sql = "INSERT INTO tblmedicalhistory (patient_id, complain, illnesshistory, physicalexam, diagnosis,next_dept) VALUES ('$patient_id', '$complain', '$illnesshistory', '$physicalexam', '$diagnosis', '$next_dept')";

       // update the pusher to push records to next departpement
        $sqlPusher = "UPDATE pusher SET next_dept = '$next_dept' WHERE patient_id = '$patient_id';";
        $con->query($sqlPusher);
       // Execute query
       if ($con->query($sql) === TRUE) {
           // Data inserted successfully
           echo "Data inserted successfully.";
       } else {
           // Error inserting data
           echo "Error: " . $sql . "<br>" . $conn->error;
       }
      // Perform any necessary processing
      
      // Redirect the user to the selected page
      header("Location: $redirect_page");
      exit();
}