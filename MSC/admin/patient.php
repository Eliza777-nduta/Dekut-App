<?php
error_reporting(0);
require_once('include/config.php');
if($_SERVER['REQUEST_METHOD'] == 'POST'){

  $patient_id=$_POST['patient_id'];
  $medical_officer_id = $_POST['medical_officer_id']; // id of the medical officer to forward the notification to
  $name=$_POST['name'];
  $regno=$_POST['regno'];
  $from = $_POST['from'];
   
   $message = "You have a new patient: ".$name;

   $sql= "insert into pusher(patient_id, name,regno) values('$patient_id','$name','$regno')";
   // insert into notiffiactions table
   $notificationsSql = "INSERT INTO notifications(`user_id`,	`patient_id`,	`message`, `from`) VALUES('$medical_officer_id', '$patient_id','$message', '$from')";

   $pusherInsert = $con->query($sql);
   $notificationInsert = $con->query($notificationsSql);
   
   $response = array();

  if ($pusherInsert && $notificationInsert) {
      $response['success'] = true;
      $response['message'] = 'Notification sent successfully';
  } else {
      $response['success'] = false;
      $response['message'] = 'Error: ' . $sql . '<br>' . $con->error;
  }

  echo json_encode($response);
   $con->close();
} else{
  echo json_encode([
    "success"=>false,
    "message" => "Method not allowed"
  ]);
}
?>