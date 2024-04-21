
<?php
include('include/config.php');
if(isset($_POST['addDrug'])){
    
    
     $drugname=$_POST['drugname'];
     $dosageform=$_POST['dosageform'];
     $strength=$_POST['strength'];
     $quantity=$_POST['quantity'];
     $unitOfMeasure=$_POST['unitOfMeasure'];
     $expirydate=$_POST['expirydate'];
     $creationdate=$_POST['creationdate'];

    $query=mysqli_query($con,"insert into druginventory (drugname,dosageform,strength,quantity,unitOfMeasure,expirydate,creationdate) values('$drugname','$dosageform','$strength','$quantity','$unitOfMeasure','$expirydate','$creationdate')");
if($query){
     echo "drug inserted";
     header('location:inventory.php');
               
    }
}
?>
