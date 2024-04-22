<?php
session_start();

if(isset($_POST['action']) && $_POST['action'] == 'show_notification') {
    $_SESSION['notification'] = "This is a notification message.";
    echo json_encode(array('status'=>'success'));
    exit;
}
?>