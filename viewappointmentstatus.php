<?php
include("adformheader.php");
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
<div class="container-fluid">
	<div class="block-header">
		View Appointment records
	</div>

<div class="card">
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
		<table>
	<tr>
	 <center><a href="viewappointmentapprovedprint.php" target="_blank">Print Report</a></center>
	</tr>
	</table>
	</section>

</div>
</div> 
<?php
include("adformfooter.php");
?>