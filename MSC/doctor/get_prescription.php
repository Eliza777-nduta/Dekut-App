<?php
include('include/config.php');
if(!empty($_POST["prescription"])) 
{

 $sql=mysqli_query($con,"select prescription,id from prescription where prescription='".$_POST['prescription']."'");?>
 <option selected="selected">Select Prescription </option>
 <?php
 while($row=mysqli_fetch_array($sql))
 	{?>
  <option value="<?php echo htmlentities($row['id']); ?>"><?php echo htmlentities($row['prescription']); ?></option>
  <?php
}
}