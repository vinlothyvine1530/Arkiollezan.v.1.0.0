
<?php
session_start();
include("dbconnection.php");
$sql ="select * from nurse where departmentid='$_GET[deptid]'";
$qsql = mysqli_query($con,$sql);
echo "<select class='selectpicker' name='doct' id='doct'  >";
while($qsql1=mysqli_fetch_array($qsql))
{	
	echo "<option value=''>Select nurse</option>";
	echo "<option value='$qsql1[nurseid]'>$qsql1[nursename]</option>";		
}
echo "</select>"
?>	          
