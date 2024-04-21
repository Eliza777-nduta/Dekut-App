<?php
// Database connection
include 'include/config.php';

// Get the selected school ID
$selectedSchoolId = $_POST['school'];

// Query to fetch courses based on the selected school
$query = "SELECT * FROM courses WHERE school_id = '$selectedSchoolId'";
$result = mysqli_query($con, $query);

// Populate the courses dropdown with options
while ($row = mysqli_fetch_assoc($result)) {
    echo "<option value='" . $row['id'] . "'>" . $row['course'] . "</option>";
}
?>
