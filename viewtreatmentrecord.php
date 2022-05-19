<?php
include("adformheader.php");
include("dbconnection.php");
if(isset($_GET[delid]))
{
	$sql ="DELETE FROM treatment_records WHERE appointmentid='$_GET[delid]'";
	$qsql=mysqli_query($con,$sql);
	if(mysqli_affected_rows($con) == 1)
	{
		echo "<script>alert('appointment record deleted successfully..');</script>";
	}
}
?>

<div class="container-fluid">
  <div class="block-header">
    <h2>View Vital Records</h2>

  </div>

  <div class="card">

    <section class="container">
     <table class="table table-bordered table-striped table-hover js-basic-example dataTable">
     	<thead>
     		 <tr>
            <td width="71"	scope="col">Vital Record Type</td>
            <td width="52"	scope="col">Patient</td>
            <td width="82"	scope="col">Vital Record Description</td>
            <td width="43"	scope="col">Vital Record date</td>
            <td width="43"	scope="col">Vital Record time</td>
     
          </tr>
     	</thead>
        <tbody>
         
          <?php
		$sql ="SELECT * FROM treatment_records WHERE patientid='$_SESSION[patientid]'";
		if(isset($_SESSION[patientid]))
		{
			$sql = $sql . " AND patientid='$_SESSION[patientid]'"; 
		}
		if(isset($_SESSION[nurseid]))
		{
			$sql = $sql . " AND nurseid='$_SESSION[nurseid]'";
		}
		$qsql = mysqli_query($con,$sql);
		while($rs = mysqli_fetch_array($qsql))
		{
			$sqlpat = "SELECT * FROM patient WHERE patientid='$rs[patientid]'";
			$qsqlpat = mysqli_query($con,$sqlpat);
			$rspat = mysqli_fetch_array($qsqlpat);
			
			$sqldoc= "SELECT * FROM nurse WHERE nurseid='$rs[nurseid]'";
			$qsqldoc = mysqli_query($con,$sqldoc);
			$rsdoc = mysqli_fetch_array($qsqldoc);
			
			$sqltreatment= "SELECT * FROM treatment WHERE treatmentid='$rs[treatmentid]'";
			$qsqltreatment = mysqli_query($con,$sqltreatment);
			$rstreatment = mysqli_fetch_array($qsqltreatment);
			
        echo "<tr>
          <td>&nbsp;$rstreatment[treatmenttype]</td>
		   <td>&nbsp;$rspat[patientname]</td>
			<td>&nbsp;$rs[treatment_description]</td>
			 <td>&nbsp;$rs[treatment_date]</td>
			  <td>&nbsp;$rs[treatment_time]</td>";  
	
       echo " </tr>";
		}
		?>
        </tbody>
      </table>
</section>
</div>
</div>
<?php
include("adformfooter.php");
?>