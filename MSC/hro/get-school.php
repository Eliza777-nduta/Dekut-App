<?php
// Database connection
include 'include/config.php';

// Query to fetch schools from the database
$query = "SELECT * FROM schools";
$result = mysqli_query($con, $query);

// Populate the first dropdown with school options
while ($row = mysqli_fetch_assoc($result)) {
    echo "<option value='" . $row['id'] . "'>" . $row['school'] . "</option>";
}
?>
