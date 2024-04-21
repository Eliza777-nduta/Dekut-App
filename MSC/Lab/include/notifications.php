<?php
// start sesssion if not started
if(!isset($_SESSION)){
    session_start();
}

include 'config.php';

// User ID for whom we want to retrieve notifications
$user_id = $_SESSION['id'];

// SQL query to count unread notifications for the logged in user
$count_sql = "SELECT COUNT(*) AS unread_count FROM notifications WHERE user_id = $user_id AND is_read = 0";

// SQL query to get unread notifications for the logged in user
$sql = "SELECT * FROM notifications WHERE user_id = '$user_id' AND is_read = 0";

// Execute query
$count_result = mysqli_query($con, $count_sql);
$notifications_result = mysqli_query($con, $sql);


$unread_count = mysqli_fetch_assoc($count_result)['unread_count'];
$notifications = [];
while($row = mysqli_fetch_assoc($notifications_result)){
    $notifications[] = $row;
}
?>