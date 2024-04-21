<?php
require_once "include/config.php";

// get officer type
$user_type = isset($_GET['user_type']) ? $_GET['user_type'] :  "doctor";

$response = array();

if($user_type == 'doctor'){
    $sql = "SELECT id, doctorName as username FROM doctors";
} else {
    $sql = "SELECT id, nurseName as username FROM nurses";   
}

$result = $con->query($sql);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $response[] = $row;
    }
    echo json_encode($response);
} else {
    echo json_encode(array('message' => 'No records found'));
}

$con->close();
?>
