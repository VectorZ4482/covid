<?php include ('authentication.php');
include ("config/dbcon.php"); ?>


<!DOCTYPE html>
<html lang="en">

<head>
    <?php include ("includes/header.php") ?>
</head>

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <?php include ("includes/topbar.php") ?>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <?php include ("includes/sidebar.php"); ?>
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Dashboard</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
                    <div class="card mb-4">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <div>
                                <i class="fas fa-table me-1"></i>
                                Patients
                            </div>
                            <button type="button" class="btn btn-sm btn-primary">Add Patient</button>
                        </div>
                        <div class="card-body">

                            <?php

                            $sql = "SELECT * FROM patients";
                            $result = mysqli_query($conn, $sql);

                            if (mysqli_num_rows($result) > 0) {


                                ?>
                                <table id="datatablesSimple" class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Date of Birth</th>
                                            <th>Contact Info</th>
                                            <th>Address</th>
                                            <th>COVID Status</th>
                                            <th>Created At</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>




                                        <?php
                                        while ($row = mysqli_fetch_assoc($result)) {

                                            ?>

                                            <tr>
                                                <td> <?php echo $row['patient_id'] ?> </td>
                                                <td> <?php echo $row['first_name'] ?> </td>
                                                <td> <?php echo $row['last_name'] ?> </td>
                                                <td> <?php echo $row['date_of_birth'] ?> </td>
                                                <td> <?php echo $row['contact_info'] ?> </td>
                                                <td> <?php echo $row['address'] ?> </td>
                                                <td> <?php echo $row['covid_status'] ?> </td>
                                                <td> <?php echo $row['created_at'] ?> </td>
                                                <td>
    <a href="edit_patient.php?patient_id=<?php echo $row['patient_id'] ?>" class="btn btn-warning btn-sm">
        <i class="fas fa-edit"></i>
    </a>
    <input type="hidden" class="delete_id_value" value="<?php echo $row['patient_id'] ?>">
    <a href="javascript:void(0)" class="deletebtn btn btn-danger btn-sm">
        <i class="fas fa-trash"></i>
    </a>
</td>


                                            </tr>
                                        <?php } ?>

                                    </tbody>
                                </table>


                            <?php } ?>
                        </div>
                    </div>
                </div>
            </main>
            <footer class="py-4 bg-light mt-auto">
                <?php include "includes/footer.php"; ?>
            </footer>
        </div>
    </div>
    <?php include "includes/script.php"; ?>
    <?php include ('includes/alert.php'); ?>   
</body>

</html>


<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- jQuery UI 1.11.4 -->
<script src="assets/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->

<script>




  $(document).ready(function () {
    $('.deletebtn').click(function (e) {
      e.preventDefault();

      var deleteid = $(this).closest("tr").find('.delete_id_value').val();

      swal({
        title: "Are you sure?",
        text: "Once deleted, you will not be able to recover this data!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
      }).then((willDelete) => {
        if (willDelete) {
          $.ajax({
            type: "POST",
            url: "del.php",
            data: {
              "delete_btn_set": 1,
              "delete_id": deleteid
            }, // Comma was missing here
            success: function (response) {
              swal("DATA DELETED SUCCESSFULLY", {
                icon: "success",
              }).then((result) => {
                location.reload();
              });
            }
          });
        }
      });
    });
  });

</script>






