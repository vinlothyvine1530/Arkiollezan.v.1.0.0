
<?php

include("adheader.php");
include 'dbconnection.php';

if(!isset($_SESSION[nurseid]))
{
	echo "<script>window.location='nurselogin.php';</script>";
}

?>
<div class="container-fluid">
  <div class="block-header">
    <h2>Nurses' Dashboard</h2>
    <h1>Welcome <?php  $sql="SELECT * FROM `nurse` WHERE nurseid='$_SESSION[nurseid]' ";
    $nursetable = mysqli_query($con,$sql);
    $doc = mysqli_fetch_array($nursetable);

    echo 'Nurse '. $doc[nursename]; ?>

  </h1>
</div>
</div>





<div class="card">
  <section class="container">
    <div class="row clearfix" style="margin-top: 10px">
      <div class="col-lg-3 col-md-3 col-sm-6">
        <div class="info-box-4 hover-zoom-effect">
          <div class="icon"> <i class="zmdi zmdi-account col-blue"></i> </div>
          <div class="content">
            <div class="text">Approved Appointments</div>
            <div class="number"><?php
            $sql = "SELECT * FROM appointment WHERE status='Approved'";
            $qsql = mysqli_query($con,$sql);
            echo mysqli_num_rows($qsql);
            ?></div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-6">
        <div class="info-box-4 hover-zoom-effect">
          <div class="icon"> <i class="zmdi zmdi-account col-green"></i> </div>
          <div class="content">
            <div class="text">Number of Patient</div>
            <div class="number"><?php
            $sql = "SELECT * FROM patient WHERE status='Active'";
            $qsql = mysqli_query($con,$sql);
            echo mysqli_num_rows($qsql);
            ?></div>
          </div>
        </div>
      </div>

      
      <div class="col-lg-3 col-md-3 col-sm-6">
        <div class="info-box-4 hover-zoom-effect">
          <div class="icon"> <i class="zmdi zmdi-bug col-blush"></i> </div>
          <div class="content">
            <div class="text">Pending Appoinments</div>
            <div class="number">
              <?php
              $sql = "SELECT * FROM appointment WHERE status='Pending'";
            $qsql = mysqli_query($con,$sql);
            echo mysqli_num_rows($qsql);
            ?>
            </div>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-3 col-sm-6">
        <div class="info-box-4 hover-zoom-effect">
          <div class="icon"> <i class="zmdi zmdi-bug col-blush"></i> </div>
          <div class="content">
            <div class="text">Active Appoinments</div>
            <div class="number">
              <?php
              $sql = "SELECT * FROM appointment WHERE status='Active'";
            $qsql = mysqli_query($con,$sql);
            echo mysqli_num_rows($qsql);
            ?>
            </div>
          </div>
        </div>
      </div>
      
     
    </div>

  </section>
</div>



<?php
include("adfooter.php");
?>