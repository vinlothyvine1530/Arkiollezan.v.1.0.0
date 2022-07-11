<?php include("adheader.php");


include("dbconnection.php");
if(isset($_GET[delid]))
{
	$sql ="DELETE FROM prescription WHERE prescriptionid='$_GET[delid]'";
	$qsql=mysqli_query($con,$sql);
	if(mysqli_affected_rows($con) == 1)
	{
		echo "<script>alert('Prescription Deleted Successfully..');</script>";
	}
}
?>

<div class="container-fluid">
  <div class="block-header">
    <h2>View prescription record</h2>

  </div>


    <?php
          $sql ="SELECT * FROM prescription WHERE (status !='')";
          if(isset($_SESSION[patientid]))
	      	{
		        	$sql  = $sql . " AND patientid='$_SESSION[patientid]'";
	      	}
          $qsql = mysqli_query($con,$sql);
          while($rs = mysqli_fetch_array($qsql))
          {
            $sqlpatient = "SELECT * FROM patient WHERE patientid='$rs[patientid]'";
            $qsqlpatient = mysqli_query($con,$sqlpatient);
            $rspatient = mysqli_fetch_array($qsqlpatient);

            $sqldoc= "SELECT * FROM nurse WHERE nurseid='$rs[nurseid]'";
            $qsqldoc = mysqli_query($con,$sqldoc);
            $rsdoc = mysqli_fetch_array($qsqldoc);
            ?>
    <div class="card" style="padding: 10px">

  <section class="container">
    <table class="table table-bordered table-striped table-hover ">

        <thead>
           <tr>
              <td><strong>Patient</strong></td>
              <td><strong>Prescription Date</strong></td>
              <td><strong>Status</strong></td>
            </tr>
        </thead>
        <tbody>
          

            <?php
            echo "<tr>
            <td>&nbsp;$rspatient[patientname]</td>
            <td>&nbsp;$rs[prescriptiondate]</td>
            <td>&nbsp;$rs[status]</td>
            
            </tr>";

            ?>
          </tbody>
        </table>
        
        
        <table class="table table-hover table-bordered table-striped">
          <thead>
             <tr>
              <td>Medicine</td>
              <td>Medicine Received</td>
              <td>Prescription</td>
            </tr>
          </thead>
          <tbody>
           
            <?php
            $sqlprescription_records ="SELECT * FROM prescription_records LEFT JOIN medicine ON prescription_records.medicine_name=medicine.medicineid WHERE prescription_records.prescription_id='$rs[0]'";
            $qsqlprescription_records = mysqli_query($con,$sqlprescription_records);
            while($rsprescription_records = mysqli_fetch_array($qsqlprescription_records))
            {
              echo "<tr>
              <td>&nbsp;$rsprescription_records[medicinename]</td>
              <td>&nbsp;$rsprescription_records[unit]</td>
              <td>&nbsp;$rsprescription_records[dosage]</td>

              </tr>";
            }
            ?>

      <table>       
              <tr>
   <center><a href="print_all.php" target="_blank">PRINT  <i class="fa fa-print"></i></a></center>
  </tr>
      </table>
            
          </tbody>
      


</script>
      </div>    
      
      <?php
    }
    ?>        <p>&nbsp;</p>
  </div>
</div>
</div>
<div class="clear"></div>
</div>
</div>
<?php
include("adfooter.php");
?>
