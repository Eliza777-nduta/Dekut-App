<?php
session_start();
error_reporting(0);
include("include/config.php");

$_SESSION["user"] = "";
$_SESSION["usertype"] = "";
$error = '';

if(isset($_POST['submit'])) {
    $email = $_POST['useremail'];
    $password = $_POST['userpassword'];

    $result = $database->query("SELECT * FROM webuser WHERE Email='$email'");
    if($result->num_rows == 1) {
        $utype = $result->fetch_assoc()['usertype'];
        if ($utype == 'p') {
            // Patient login
            $checker = $database->query("SELECT * FROM users WHERE email='$email' AND password='$password'");
            if ($checker->num_rows == 1) {
                $_SESSION['user'] = $email;
                $_SESSION['usertype'] = 'p';
                header('location:dashboard.php');
                exit();
            } else {
                $error = '<label for="promter" class="form-label" style="color:rgb(255, 62, 62);text-align:center;">Wrong credentials: Invalid email or password</label>';
            }
        } elseif ($utype == 'a') {
            // Admin login
            $checker = $database->query("SELECT * FROM admin WHERE aemail='$email' AND apassword='$password'");
            if ($checker->num_rows == 1) {
                $_SESSION['user'] = $email;
                $_SESSION['usertype'] = 'a';
                header("location: admin/dashboard.php");
                exit();
            } else {
                $error = '<label for="promter" class="form-label" style="color:rgb(255, 62, 62);text-align:center;">Wrong credentials: Invalid email or password</label>';
            }
        } elseif ($utype == 'd') {
            // Doctor login
            $checker = $database->query("SELECT * FROM doctors WHERE docEmail='$email' AND password='$password'");
            if ($checker->num_rows == 1) {
                $_SESSION['user'] = $email;
                $_SESSION['usertype'] = 'd';
                header('location: doctor/dashboard.php');
                exit();
            } else {
                $error = '<label for="promter" class="form-label" style="color:rgb(255, 62, 62);text-align:center;">Wrong credentials: Invalid email or password</label>';
            }
        }
    } else {
        $error = '<label for="promter" class="form-label" style="color:rgb(255, 62, 62);text-align:center;">We can\'t find any account for this email.</label>';
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
    <link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
    <link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
    <link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css"/>
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
</head>
<body class="login">
    <div class="row">
        <div class="main-login col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
            <div class="logo margin-top-30">
            <a href="../index.php"><h2> Login</h2></a>
            </div>

            <div class="box-login">
                <form class="form-login" method="post">
                    <fieldset>
                        <legend>
                            Sign in to your account
                        </legend>
                        <p>
                            Please enter your name and password to log in.<br />
                            <span style="color:red;"><?php echo $error; ?></span>
                        </p>
                        <div class="form-group">
                            <span class="input-icon">
                                <input type="text" class="form-control" name="useremail" placeholder="Username">
                                <i class="fa fa-user"></i> </span>
                        </div>
                        <div class="form-group form-actions">
                            <span class="input-icon">
                                <input type="password" class="form-control password" name="userpassword" placeholder="Password">
                                <i class="fa fa-lock"></i>
                                 </span><a href="forgot-password.php">
                                Forgot Password ?
                            </a>
                        </div>
                        <div class="form-actions">
                            
                            <button type="submit" class="btn btn-primary pull-right" name="submit">
                                Login <i class="fa fa-arrow-circle-right"></i>
                            </button>
                        </div>
                        <div class="new-account">
                            Don't have an account yet?
                            <a href="registration.php">
                                Create an account
                            </a>
                        </div>
                    </fieldset>
                </form>

                <div class="copyright">
                    </span><span class="text-bold text-uppercase"> Dekut Medical Center</span>.
                </div>
        
            </div>

        </div>
    </div>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/modernizr/modernizr.js"></script>
    <script src="vendor/jquery-cookie/jquery.cookie.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="vendor/switchery/switchery.min.js"></script>
    <script src="vendor/jquery-validation/jquery.validate.min.js"></script>

    <script src="assets/js/main.js"></script>

    <script src="assets/js/login.js"></script>
    <script>
        jQuery(document).ready(function() {
            Main.init();
            Login.init();
        });
    </script>

</body>
<!-- end: BODY -->
</html>
