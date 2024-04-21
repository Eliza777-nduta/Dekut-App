<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
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
        <style>
            body{
                width:60%;
                height:100%;
                align:center;
                justify-content:center;
                margin-left:200px;
                margin-top:50px;
                padding:20px;
            }
            .btn-secondary,.btn-primary{
                float:right;
            }

.subnav ul li .subnav ul{
  display:block;  
}

.subnav ul li .subnav ul{
  display:none;
}

.subnav ul li .subnav ul li{
  list-style-type:none;
}
.subnav ul li:hover .subnav{
  display:block;
  position:absolute;
}
.subnav ul li:hover .subnav ul{
  display:block;
  align:left;
}
.subnav ul li:hover .subnav ul li{
  background:white;
  color:blue;
  text-align:center;
}


    </style>

</head>

<body>

<form method="post" name="submit">

<tr>
<th>Chief Complain :</th>
<td>
<textarea name="complain" placeholder="Chief Complain" rows="5" cols="5" class="form-control wd-450" required="true"></textarea></td>
</tr> 
<th>History of presenting illness :</th>
<td>
<textarea name="illness history" placeholder="history of illness" rows="5" cols="5" class="form-control wd-450" required="true"></textarea></td>
</tr> 
<tr>
<th>Physical Exam :</th>
<td>
<textarea name="physicalexam" placeholder="Physical Exam" rows="5" cols="5" class="form-control wd-450" required="true"></textarea></td>
</tr>  
<tr> 
<div class="form-group">
<th>Diagnosis</th>
<td>  
<select name="diagnosis" class="form-control"> 
<option value="please select">select a diagnosis</option>
<option value="Flu">flu</option>
<option value="Malaria">Malaria</option>
<option value="Diabetes">Diabetes</option>
<option value="TB">Tuberculosis</option>
</select>
</td>
</div>
</tr>
<tr>
<th>Investigation :</th>
<td>
<div class="subnav">
<ul style="display:flex;">
<li style="list-style-type:none;"><a href="#" style="color:grey;">LAB</a>
<div class="subnav">
<ul>
<li>Urine Test</li>
<li>Blood Test</li>
<li>Tumuor Marker</li>
</ul>
</div>
</li> &nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp&nbsp;&nbsp
<li style="list-style-type:none;"><a href="imaging.php" style="color:grey;">IMAGING</a>
<div class="subnav">
<ul>
<li>X-Ray</li>
<li> MRI</li>
<li>Ultra-Sound</li>
</ul>
</div></li>
</ul>
</tr>

<button type="button" class="btn-secondary" data-dismiss="modal">Close</button>
<button type="submit" name="submit" class="btn-primary">submit</button>

</form>
</body>
</html>