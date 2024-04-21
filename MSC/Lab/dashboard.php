
<?php
error_reporting(0);
require_once 'include/config.php';
$sql= "select * from pusher WHERE next_dept = 'lab' ORDER BY id DESC";
$result = $con->query($sql);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
    <link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
    <link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
    <link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
    <link href="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet" media="screen">
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="screen">
    <link href="vendor/bootstrap-datepicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet" media="screen">
    <link href="vendor/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
    <title>Patient List</title>
    <style>
.eye-viewed {
  color: green; /* Change color when viewed */
}
</style>
</head>

<?php include('include/sidebar.php');?>
<?php include('include/header.php');?>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-offset-4">
            <table class="table table-bordered" style="margin-top: 100px;">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Reg Number</th>
                        <th>Created Date</th>
                        <th>View</th>


                    </tr>
                </thead>
                <tbody>
                
<?php
if($result->num_rows > 0){
    while($row = $result->fetch_assoc()){
        $date = strtotime($row['creationdate']);
        ?>
        <tr>
            <td><?php echo $row['name'];?></td>
            <td><?php echo $row['regno'];?></td>
            <td><?php echo date('d-M-Y H:i A', $date);?></td>
            <td>
            <a href="view-patient.php?uid=<?php echo $row['patient_id'];?>"><i class="fa fa-eye" ></i></a>
            </td>
        </tr>
        <?php
    }
}else{
    ?>
    <tr>
        <td colspan="4">No patient found</td>
    </tr>
    <?php
}
?>

                </tbody>
                
            </table>

            </div>
        </div>
    </div>
</body>
</html>