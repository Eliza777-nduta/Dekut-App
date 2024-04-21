<?php
include('include/config.php');
if(!empty($_POST["routeid"])) 
{

 $sql=mysqli_query($con,"select route,id from pharmacy where route='".$_POST['routeid']."'");?>
 <option selected="selected">Select Doctor </option>
 <?php
 while($row=mysqli_fetch_array($sql))
 	{?>
  <option value="<?php echo htmlentities($row['id']); ?>"><?php echo htmlentities($row['route']); ?></option>
  <?php
}
}



?>

