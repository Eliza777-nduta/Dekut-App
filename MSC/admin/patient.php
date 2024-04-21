<?php
error_reporting(0);
require_once('include/config.php');
if($_SERVER['REQUEST_METHOD'] == 'POST'){

  $patient_id=$_POST['patient_id'];
  $medical_officer_id = $_POST['user_id']; // id of the medical officer to forward the notification to
  $name=$_POST['name'];
  $regno=$_POST['regno'];
  $from = $_POST['from'];
   
   $message = "You have a new patient: ".$name;
   $from= ""; // use session to know who is logged in the system

   $sql= "insert into pusher(patient_id, name,regno) values('$patient_id','$name','$regno')";
   // insert into notiffiactions table
   $notificationsSql = "INSERT INTO notifications(`user_id`,	`patient_id`,	`message`, `from`) VALUES('$medical_officer_id', '$patient_id','$message', '$from')";
   die($notificationsSql);

   if($con->query($sql) && $con->query($notificationsSql)){
    echo "notification sent successfully";
   }
   else{
    echo "error:" .$sql . "<br>" . $con->error;
   }
   $con->close();
}
?>