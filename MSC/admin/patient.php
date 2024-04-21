<?php
error_reporting(0);
require_once('include/config.php');
if($_SERVER['REQUEST_METHOD'] == 'POST'){

  $patient_id=$_POST['patient_id'];
   $name=$_POST['name'];
   $regno=$_POST['regno'];
   
   
   $message = "You have a new patient: ".$name;
   $from= ""; // use session to know who is logged in the system

   $sql= "insert into pusher(patient_id, name,regno) values('$patient_id','$name','$regno')";
   if($con->query($sql) === TRUE){
    echo "notification sent successfully";
   }
   else{
    echo "error:" .$sql . "<br>" . $con->error;
   }
   $con->close();
}
?>