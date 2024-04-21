<?php
include('include/config.php');
if(!empty($_POST["drugnameid"])) 
{

 $sql=mysqli_query($con,"select drugname,id from drugname where drugname='".$_POST['drugnameid']."'");?>
 <option selected="selected">Select Drug Name </option>
 <?php
 while($row=mysqli_fetch_array($sql))
 	{?>
  <option value="<?php echo htmlentities($row['id']); ?>"><?php echo htmlentities($row['drugname']); ?></option>
  <?php
}
}



?>

