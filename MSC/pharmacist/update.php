<?php
error_reporting(0);
include('include/config.php');
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <link rel="stylesheet" href="assets/css/styles3.css">

    <title>Inventory</title>

</head>

<body>
    <?php
    include('include/sidebar.php'); ?>
    <header>
        <h2 id="heading">Drug Inventory</h2>
    </header>

    <?php
    if (isset($_GET['id'])) {
        $id = $_GET['id'];
    }
    $query = "select * from druginventory where id='$id'";
    $result = mysqli_query($con, $query);
    if (!$result) {
        die("query failed" . mysqli_error($con));
    } else {
        $row = mysqli_fetch_assoc($result);
        print_r($row);
    }

    ?>
    <div class="container" style="width:50%; padding-top:10px;">
        <h2 style="text-align:center; margin-top: 80px;">Edit Drug</h2>
        <span class="md-4">Edit Drug</span>
        <div class=" row mb-10">
            <form action="insert.php">
                <div class="form-group">
                    <label for="drugname" style="color:blue;">Drug Name</label>
                    <select name="drugname" class="form-control" required="required" value="<?php echo $row['drugname']; ?>">
                        <option value=""></option>
                        <?php $ret = mysqli_query($con, "select * from drugname");
                        while ($row = mysqli_fetch_array($ret)) {
                        ?>
                            <option value="<?php echo htmlentities($row['drugname']) ?>">
                                <?php echo htmlentities($row['drugname']); ?>
                            </option>
                        <?php } ?>
                    </select>
                </div>
                <div class="form-group">
                    <label for="dosageform" style="color:blue;">Dosage Form</label>
                    <select name="dosageform" class="form-control" required="required" value="<?php echo $row['form'] ?>">
                        <option value=""></option>
                        <?php $ret = mysqli_query($con, "select * from dosageform");
                        while ($row = mysqli_fetch_array($ret)) {
                        ?>
                            <option value="<?php echo htmlentities($row['dosageform']); ?>">
                                <?php echo htmlentities($row['dosageform']) ?>
                            </option>
                        <?php } ?>
                    </select>
                </div>
                <div class="form-group">
                    <label for="strength" style="color:blue;"> Strength/concentration</label>
                    <input type="text" class="form-control" id="strength" name="strength" required="required" value="<?php echo $row['strength'] ?>">
                </div>

                <div class="form-group">
                    <label for="quantity" style="color:blue;"> Quantity</label>
                    <input type="text" class="form-control" id="quantity" name="quantity" required="required" value="<?php echo $row['quantity'] ?>">
                </div>
                <div class="form-group">
                    <label for="unitOfMeasure" style="color:blue;"> Unit of Measure</label>
                    <select name="unitOfMeasure" class="form-control" required="required" value="<?php echo $row['unitOfMeasure'] ?>">
                        <option value=""></option>
                        <?php $ret = mysqli_query($con, "select * from unitOfMeasure");
                        while ($row = mysqli_fetch_array($ret)) {
                        ?>
                            <option value="<?php echo htmlentities($row['unitOfMeasure']) ?>">
                                <?php echo htmlentities($row['unitOfMeasure']) ?>
                            </option>
                        <?php } ?>
                    </select>
                </div>
                <div class="form-group">
                    <label for="expirydate" style="color:blue;"> Expiry Date</label>
                    <input type="text" class="form-control" id="expirydate" name="expirydate" required="required" value="<?php echo $row['expirydate'] ?>">
                </div>
                <div class="form-group">
                    <label for="creationdate" style="color:blue;"> Creation Date</label>
                    <input type="text" class="form-control" id="creationdate" name="creationdate" required="required" value="<?php echo $row['creationdate'] ?>">
                </div>
                <button type="submit" class="btn btn-success">Submit</button>
            </form>
        </div>
</body>

</html>