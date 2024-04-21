<?php
include 'config.php';

// User ID for whom we want to retrieve notifications
$user_id = 1;

// SQL query to count unread notifications for user_id 1
$count_sql = "SELECT COUNT(*) AS unread_count FROM notifications WHERE user_id = $user_id AND is_read = 0";

// SQL query to select unread notifications for user_id 1
$sql = "SELECT * FROM notifications WHERE id = $user_id AND is_read = 0";

// Execute query
$count_result = mysqli_query($con, $count_sql);
$notifications_result = mysqli_query($con, $sql);


$unread_count = mysqli_fetch_assoc($count_result)['unread_count'];
$notifications = [];
while($row = mysqli_fetch_assoc($notifications_result)){
    $notifications[] = $row;
}

?>