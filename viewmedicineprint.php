<?php
include("adformheaderprint.php");
include("dbconnection.php");
if(isset($_GET[delid]))
{

	$sql ="DELETE FROM medicine WHERE medicineid='$_GET[delid]'";
	$qsql=mysqli_query($con,$sql );
	if(mysqli_affected_rows($con) == 1)
	{
		echo "<script>alert('Medicine redcord deleted successfully..');</script>";
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
        
        <h4>INVENTORY</h4>
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
		<h8>Inventory</h8>
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
              <td><b>Medicine Name</b></td>
              <td><b>Quantity Left</b></td>
              <td><b>Expiry</b></td>
              <td><b>Description</b></td>
              <td><b>Status</b></td>
            </tr>
          </thead> 
          <tbody>

            <?php
            $sql ="SELECT * FROM medicine";
            $qsql = mysqli_query($con,$sql);
            while($rs = mysqli_fetch_array($qsql))
            {
              echo "<tr>
              <td>&nbsp;$rs[medicinename]</td>
              <td>&nbsp;$rs[medicinequantity]</td>
              <td>&nbsp;$rs[medicineexpiry]</td>
              <td>&nbsp;$rs[description]</td>
              <td>&nbsp;$rs[status]</td>
              </tr>";
            }
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