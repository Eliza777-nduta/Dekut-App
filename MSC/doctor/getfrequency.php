<?php
include('include/config.php');
if(!empty($_POST["frequencyid"])) 
{

 $sql=mysqli_query($con,"select frequency,id from pharmacy where frequency='".$_POST['frequencyid']."'");?>
 <option selected="selected">Select Doctor </option>
 <?php
 while($row=mysqli_fetch_array($sql))
 	{?>
  <option value="<?php echo htmlentities($row['id']); ?>"><?php echo htmlentities($row['frequency']); ?></option>
  <?php
}
}



?>

