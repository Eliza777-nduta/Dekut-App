<?php
require_once "include/config.php";
// Receive JSON data from the fetch request
$json_data = file_get_contents('php://input');
$data = json_decode($json_data, true);

// Check if data is an array of prescriptions
if (!is_array($data)) {
    // If data is not an array, return error response
    $response = array('success' => false, 'message' => 'Invalid data format');
    echo json_encode($response);
    exit;
}

// Iterate over each prescription in the array and insert into the database
foreach ($data as $prescription) {
    // Sanitize data if necessary
    $patient_id = isset($prescription['patient_id']) ? intval($prescription['patient_id']) : null;
    $drugname = isset($prescription['drugname']) ? mysqli_real_escape_string($con, $prescription['drugname']) : null;
    $quantity = isset($prescription['quantity']) ? intval($prescription['quantity']) : null;
    $route = isset($prescription['route']) ? mysqli_real_escape_string($con, $prescription['route']) : null;
    $frequency = isset($prescription['frequency']) ? mysqli_real_escape_string($con, $prescription['frequency']) : null;
    $howmany = isset($prescription['howmany']) ? intval($prescription['howmany']) : null;
    $refill = isset($prescription['refill']) ? intval($prescription['refill']) : null;

    // Construct the SQL query
    $query = "INSERT INTO prescriptions (patient_id, drugname, quantity, route, frequency, howmany, refill) 
              VALUES ('$patient_id', '$drugname', '$quantity', '$route', '$frequency', '$howmany', '$refill')";

    // Execute the query
    $result = $con->query($query);

    // Check if insertion was successful
    if (!$result) {
        // If insertion failed, return error response
        $response = array('success' => false, 'message' => 'Failed to add prescription');
        echo json_encode($response);
        exit;
    }
}

// If all insertions were successful, return success response
$response = array('success' => true, 'message' => 'Prescriptions added successfully');
echo json_encode($response);

// Close database connection
$con->close();
