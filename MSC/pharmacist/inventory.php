<?php
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
    <header>
        <h2 id="heading">Drug Inventory</h2>
    </header>


    <div class="container">
        <div class="box1">
            <h4> All Drugs</h4>
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">ADD Drug</button>
        </div>
        <table class="table table hover table-bordered table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Generic name</th>
                    <th> Dosage Form</th>
                    <th>Strength/Concentration</th>
                    <th> Quantity</th>
                    <th> Unit of Measure</th>
                    <th> Expiration Date</th>
                    <th> Creation Date</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>

                <?php
                $query = "select * from druginventory";
                $result = mysqli_query($con, $query);
                if (!$result) {
                } else {
                    while ($row = mysqli_fetch_assoc($result)) {
                ?>
                        <tr>
                            <td><?php echo $row['id']; ?></td>
                            <td><?php echo $row['drugname']; ?></td>
                            <td><?php echo $row['dosageform']; ?></td>
                            <td><?php echo $row['strength']; ?></td>
                            <td><?php echo $row['quantity']; ?></td>
                            <td><?php echo $row['unitOfMeasure']; ?></td>
                            <td><?php echo $row['expirydate']; ?></td>
                            <td><?php echo $row['creationdate']; ?></td>
                            <td><a href="update.php?id=<?php echo $row['id']; ?>" class="btn btn-success">Update</a></td>
                            <td><a href="delete.php?id=<?php echo $row['id']; ?>" class="btn btn-danger">Delete</a></td>


                        </tr>
                <?php
                    }
                }



                ?>

            </tbody>
        </table>

        <!-- Modal -->
        <form action="insert.php" method="POST">
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title"> Add Drugs</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="">
                                <div class="form-group">
                                    <label for="drugname" style="color:blue;">Drug Name</label>
                                    <select name="drugname" class="form-control" required="required">
                                        <option value="">Select Drug Name</option>
                                        <?php $ret = mysqli_query($con, "select * from drugname");
                                        while ($row = mysqli_fetch_array($ret)) {
                                        ?>
                                            <option value="<?php echo htmlentities($row['drugname']); ?>">
                                                <?php echo htmlentities($row['drugname']); ?>
                                            </option>
                                        <?php } ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="dosageform" style="color:blue;">Dosage Form</label>
                                    <select name="dosageform" class="form-control" required="required">
                                        <option value="">Select Dosage Form</option>
                                        <?php $ret = mysqli_query($con, "select * from dosageform");
                                        while ($row = mysqli_fetch_array($ret)) {
                                        ?>
                                            <option value="<?php echo htmlentities($row['dosageform']); ?>">
                                                <?php echo htmlentities($row['dosageform']); ?>
                                            </option>
                                        <?php } ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="strength" style="color:blue;"> Strength/concentration</label>
                                    <input type="text" class="form-control" id="strength" name="strength" placeholder=" Drugs strength/concentration">
                                </div>

                                <div class="form-group">
                                    <label for="quantity" style="color:blue;"> Quantity</label>
                                    <input type="text" class="form-control" id="quantity" name="quantity" placeholder="number of Drugs">
                                </div>
                                <div class="form-group">
                                    <label for="unitOfMeasure" style="color:blue;"> Unit of Measure</label>
                                    <select name="unitOfMeasure" class="form-control" required="required">
                                        <option value="">Select Unit of Measure</option>
                                        <?php $ret = mysqli_query($con, "select * from unitOfMeasure");
                                        while ($row = mysqli_fetch_array($ret)) {
                                        ?>
                                            <option value="<?php echo htmlentities($row['unitOfMeasure']); ?>">
                                                <?php echo htmlentities($row['unitOfMeasure']); ?>
                                            </option>
                                        <?php } ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="expirydate" style="color:blue;"> Expiry Date</label>
                                    <input type="text" class="form-control" id="expirydate" name="expirydate" placeholder="yy/mm/dd">
                                </div>
                                <div class="form-group">
                                    <label for="creationdate" style="color:blue;"> Creation Date</label>
                                    <input type="text" class="form-control" id="creationdate" name="creationdate" placeholder="yy/mm/dd">
                                </div>
                            </form>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                <input type="submit" class="btn btn-primary" name="addDrug" value="ADD">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <button type="button" class="btn btn-secondary" style="text-decoration:none; color:white;"><a href="dashboard.php">Back</a></button>

        <!-- Bootstrap JS bundle (includes Popper.js) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>


</html>