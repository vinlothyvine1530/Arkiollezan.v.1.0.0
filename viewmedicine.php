<?php
include("adformheader.php");
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
<div class="container-fluid">
  <div class="block-header">
    <h2>View  medicine list</h2>

  </div>
</div>
<div class="card">

  <section class="container">
    <table class="table table-bordered table-striped table-hover js-basic-example dataTable">

          <thead>
            <tr>
              <th>Medicine Name</th>
              <th>Quantity Left</th>
              <th>Expiry</th>
              <th>Description</th>
              <th>Status</th>
              <th>Action</th>
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
              <td>&nbsp;
              <a href='medicine.php?editid=$rs[medicineid]' class='btn btn-raised g-bg-cyan'>Update</a> 
              <a href='viewmedicine.php?delid=$rs[medicineid]' class='btn btn-raised g-bg-blush2'>Delete</a></td>
              </tr>";
            }
            ?>
          </tbody>
        </table>
        <table>
	<tr>
	 <center><a href="viewmedicineprint.php" target="_blank">Print Report</a></center>
	</tr>
	</table>
      </section>
     
    </div>
  </div>
</div>

</div>
</div>
<?php
include("adformfooter.php");
?>