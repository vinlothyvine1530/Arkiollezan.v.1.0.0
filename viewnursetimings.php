<?php
include("adformheader.php");
include("dbconnection.php");
if(isset($_GET[delid]))
{
	$sql ="DELETE FROM nurse_timings WHERE nurse_timings_id='$_GET[delid]'";
	$qsql=mysqli_query($con,$sql);
	if(mysqli_affected_rows($con) == 1)
	{
		echo "<script>alert('nursetimings record deleted successfully..');</script>";
	}
}
?>
<div class="container-fluid">
  <div class="block-header">
    <h2>View Nurse Timings</h2>

  </div>

<div class="card">

  <section class="container">
    <table class="table table-bordered table-striped table-hover js-exportable dataTable" >
      <thead>
        <tr>
          <td>Nurse</td>
          <td>Timings available</td>
          <td>Status</td>
          <td>Action</td>
        </tr>
      </thead>
      <tbody>
        
          <?php
		$sql ="SELECT * FROM nurse_timings where nurseid='$_SESSION[nurseid]'";
		$qsql = mysqli_query($con,$sql);
		while($rs = mysqli_fetch_array($qsql))
		{
			$sqldoc = "SELECT * FROM nurse WHERE nurseid='$rs[nurseid]'";
			$qsqldoc = mysqli_query($con,$sqldoc);
			$rsnurse = mysqli_fetch_array($qsqldoc);
			
			$sqldoct = "SELECT * FROM nurse_timings WHERE nurse_timings_id='$rs[nurse_timings_id]'";
			$qsqldoct = mysqli_query($con,$sqldoct);
			$rsdoct = mysqli_fetch_array($qsqldoct);
			
        echo "<tr>
          <td>&nbsp;$rsnurse[nursename]</td>
          <td>&nbsp;$rsdoct[start_time] - $rsdoct[end_time]</td>
          <td>&nbsp;$rs[status]</td>
          <td width='250'>&nbsp;<a href='nursetimings.php?editid=$rs[nurse_timings_id]' class='btn btn-raised btn-sm g-bg-cyan'>Update</a>  <a href='viewnursetimings.php?delid=$rs[nurse_timings_id]' class='btn btn-raised btn-sm g-bg-blush2'>Delete</a> </td>
        </tr>";
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