<table class="table table-bordered table-striped">
      <tbody>
        <tr>
		  <th>Nurse</th>
          <th>Patient</th>
          <th>Prescription Date</th>
          <th>Add</th> 
		  <th>Print</th>             
        </tr>
<?php
$sql ="SELECT * FROM prescription WHERE patientid='$_GET[patientid]' AND appointmentid='$_GET[appointmentid]'";
$qsql = mysqli_query($con,$sql);
while($rs = mysqli_fetch_array($qsql))
{
	$sqlpatient = "SELECT * FROM patient WHERE patientid='$rs[patientid]'";
	$qsqlpatient = mysqli_query($con,$sqlpatient);
	$rspatient = mysqli_fetch_array($qsqlpatient);
	
	$sqldoc= "SELECT * FROM nurse WHERE nurseid='$rs[nurseid]'";
	$qsqldoc = mysqli_query($con,$sqldoc);
	$rsdoc = mysqli_fetch_array($qsqldoc);

            echo "<tr>
					<td>&nbsp;$rsnurse[nursename]</td>
              		<td>&nbsp;$rspatient[patientname]</td>
               		<td>&nbsp;$rs[prescriptiondate]</td>
					<td><a href='prescriptionrecord.php?prescriptionid=$rs[0]&patientid=$rs[patientid]' >Add</td>
					<td><a href='prescriptionrecordprint.php?prescriptionid=$rs[0]&patientid=$rs[patientid]' >Print</td>
            </tr>";
}
?>    
  </tbody>
</table>
<?php
if(isset($_SESSION[nurseid]))
{
?>  
<hr>
	<table>
		<tr>
			<td>
			<div align="center"><a href="prescription.php?patientid=<?php echo $_GET[patientid]; ?>&appid=<?php echo $rsappointment[appointmentid]; ?>">Add Prescription records</a></div>
			</td>
		</tr>
	</table>
<?php
}
?>