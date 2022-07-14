
<?php
include("adformheaderprint.php");
include("dbconnection.php");
if(isset($_GET[delid]))
{
	$sql ="DELETE FROM appointment WHERE appointmentid='$_GET[delid]'";
	$qsql=mysqli_query($con,$sql);
	if(mysqli_affected_rows($con) == 1)
	{
		echo "<script>alert('appointment record deleted successfully..');</script>";
	}
}
if(isset($_GET[approveid]))
{
	$sql ="UPDATE appointment SET status='Approved' WHERE appointmentid='$_GET[approveid]'";
	$qsql=mysqli_query($con,$sql);
	if(mysqli_affected_rows($con) == 1)
	{
		echo "<script>alert('Appointment record Approved successfully..');</script>";
	}
}
?>

<header class="header-style-2">
    <div class="container">
		<div class="logo"> <img src="images/ctunewlogo.png" alt="" style="margin-bottom: -302px;height: 152px;margin-left: 159px;">
		<div class="logo"> <img src="images/IMPACTRANKINGS.jpg" alt="" style="height: 64px;margin-bottom: -475px;margin-left: 141px;">
		<div class="logo"> <img src="images/WORLDUNIVERSITYRANKINGS.jpg" alt="" style="height: 185px;margin-bottom: -264px;margin-left: 785px;">
        </div>
</header>

<div class="container-fluid">


    
	<div class="block-header" align="center">
        
        <h4>SUMMARY LIST OF APPOINTMENTS</h4>
		<h5><b>Republic of the Philippines</b></h5>
		<h5><b>CEBU TECHNOLOGICAL UNIVERSITY</b></h5>
        <h5>NAGA CAMPUS</h5>
        <h17>Central Poblacion, Naga City, Cebu, Philippines<br>
Website: http://www.ctu.edu.ph  E-mail: thepresident@ctu.edu.ph</h17>
		<br>
		<h7><b>OFFICE OF THE CAMPUS NURSE</b></h7>	
	</div>

	<br>
	<br>

    <div class="block-header">
		<h7>Clinical Management Inventory System</h7>
		<br>
		<h8>Appointments</h8>
		<br>
		<h8>Monthy Report</h8>
		<br>
		<br>
	</div>

<div class="card">

<br>
<br>


	<section class="container">
		<table class="table table-bordered table-striped table-hover js-basic-example dataTable">

			<thead>
				<tr>

					<td><b>Patient detail</b></td>
					<td><b>Registration Date &  Time</b></td>
					<td><b>Program</b></td>
					<td><b>Nurse</b></td>
					<td><b>Appointment Reason</b></td>
					<td><b>Status</b></td>
					
				</tr>
			</thead>
			<tbody>
				<?php
				$sql ="SELECT * FROM appointment WHERE (status='Approved' OR status='Active')";
				if(isset($_SESSION[patientid]))
				{
					$sql  = $sql . " AND patientid='$_SESSION[patientid]'";
				}
				if(isset($_SESSION[nurseid]))
				{
					$sql  = $sql . " AND nurseid='$_SESSION[nurseid]'";			
				}
				$qsql = mysqli_query($con,$sql);
				while($rs = mysqli_fetch_array($qsql))
				{
					$sqlpat = "SELECT * FROM patient WHERE patientid='$rs[patientid]'";
					$qsqlpat = mysqli_query($con,$sqlpat);
					$rspat = mysqli_fetch_array($qsqlpat);


					$sqldept = "SELECT * FROM department WHERE departmentid='$rs[departmentid]'";
					$qsqldept = mysqli_query($con,$sqldept);
					$rsdept = mysqli_fetch_array($qsqldept);

					$sqldoc= "SELECT * FROM nurse WHERE nurseid='$rs[nurseid]'";
					$qsqldoc = mysqli_query($con,$sqldoc);
					$rsdoc = mysqli_fetch_array($qsqldoc);
					echo "<tr>

					<td>&nbsp;$rspat[patientname]<br>&nbsp;$rspat[mobileno]</td>		 
					<td>&nbsp;$rs[appointmentdate]&nbsp;$rs[appointmenttime]</td> 
					<td>&nbsp;$rsdept[departmentname]</td>
					<td>&nbsp;$rsdoc[nursename]</td>
					<td>&nbsp;$rs[app_reason]</td>
					<td>&nbsp;$rs[status]</td>
					";
				}
				/*
					if($rs[status] != "Approved")
					{
						if(!(isset($_SESSION[patientid])))
						{
							echo "<a href='appointmentapproval.php?editid=$rs[appointmentid]' class='btn btn-raised g-bg-cyan>Approve</a><hr>";
						}
						echo "  <a href='viewappointment.php?delid=$rs[appointmentid]' class='btn btn-raised g-bg-blush2'>Update</a>";
					}
					else
					{
						echo "<a href='patientreport.php?patientid=$rs[patientid]&appointmentid=$rs[appointmentid]' class='btn btn-raised'>View Report</a>";
					}
					echo "</center></td></tr>";
				
				}
				*/
				?>
			</tbody>
		</table>
		<input type="submit" class="btn btn-lg" name="print" id="print" value="" onclick="myFunction()"/>


        <div class="block-header">
		<br>
		<h8>Prepared By:</h8>              
		<br>
        <br>
		<h9 style="margin-left: 50px;">Marc Anthony A. Pabico, RN</h9> 
		<br>
        <h9 style="margin-left: 115px;">Nurse</h9> 
	</section>

	<?php
    
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
<script>
  function myFunction()
  {
   window.print();
 }
</script>