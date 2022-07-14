<?php
include("adformheaderprint.php");
include("dbconnection.php");
if(isset($_GET[delid]))
{
	$sql ="DELETE FROM patient WHERE patientid='$_GET[delid]'";
	$qsql=mysqli_query($con,$sql);
	if(mysqli_affected_rows($con) == 1)
	{
		echo "<script>alert('patient record deleted successfully..');</script>";
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
        
        <h5>SUMMARY LIST OF  REGISTERED PATIENTS</h5>
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
      <br>
		<h7>Clinical Management Inventory System</h7>
		<br>
		<h8>Patient Records</h8>
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
          <!--
          <th width="15%" height="36"><div align="center">Patient Name</div></th>
          <th width="20%"><div align="center">Admission details</div></th>
          <th width="28%"><div align="center">Address</div></th>    
          <th width="20%"><div align="center">Patient Profile</div></th>
          <th width="17%"><div align="center">Action</div></th>
          -->
          
          <td><b>Patient Name</b></td>
					<td><b>Admission details</b></td>
					<td><b>Address</b></td>
					<td><b>Patient Profile</b></td>
					<td><b>Action</b></td>

        </tr>
      </thead>
      <tbody>
       <?php
       $sql ="SELECT * FROM patient";
       $qsql = mysqli_query($con,$sql);
       while($rs = mysqli_fetch_array($qsql))
       {
        echo "<tr>
        <td>$rs[patientname]<br>
        <strong>ID Number :</strong> $rs[loginid] </td>
        <td>
        <strong>Date</strong>: &nbsp;$rs[admissiondate]<br>
        <strong>Time</strong>: &nbsp;$rs[admissiontime]</td>
        <td>$rs[address]<br>$rs[city] -  &nbsp;$rs[pincode]<br>
        Mob No. - $rs[mobileno]</td>
        <td><strong>Blood group</strong> - $rs[bloodgroup]<br>
        <strong>Sex</strong> - &nbsp;$rs[gender]<br>
        <strong>DOB</strong> - &nbsp;$rs[dob]</td>
        <td align='center'>Status - $rs[status] <br>";
       }
       /*
        
        if(isset($_SESSION[nurseid]))
        {
          echo "<a href='patient.php?editid=$rs[patientid]' class='btn btn-sm btn-raised g-bg-cyan'>Update</a><a href='viewpatient.php?delid=$rs[patientid]' class='btn btn-sm btn-raised g-bg-blush2'>Delete</a> <hr>
          ";
        }
        echo "</td></tr>";
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