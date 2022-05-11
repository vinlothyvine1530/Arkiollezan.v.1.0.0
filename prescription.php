<?php
include("adheader.php");
include("dbconnection.php");
if(isset($_POST[submit]))
{
	if(isset($_GET[editid]))
	{
		$sql ="UPDATE prescription SET treatment_records_id='$_POST[treatmentid]',nurseid='$_POST[select2]',patientid='$_POST[patientid]',prescriptiondate='$_POST[date]',status='$_POST[select]' WHERE prescription_id='$_GET[editid]'";
		if($qsql = mysqli_query($con,$sql))
		{
			echo "<script>alert('prescription record updated successfully...');</script>";
		}
		else
		{
			echo mysqli_error($con);
		}	
	}
	else
	{
		$sql ="INSERT INTO prescription(treatment_records_id,nurseid,patientid,prescriptiondate,status,appointmentid) values('$_POST[treatmentid]','$_POST[select2]','$_POST[patientid]','$_POST[date]','Active','$_GET[appid]')";
		if($qsql = mysqli_query($con,$sql))
		{
			$insid= mysqli_insert_id($con);
			$prescriptionid= $insid;
			$prescriptiondate= $_POST[date];
			$billtype="Prescription charge";
			$billamt=0;
			include("insertbillingrecord.php");	
			echo "<script>alert('prescription record inserted successfully...');</script>";
			echo "<script>window.location='prescriptionrecord.php?prescriptionid=" . $insid . "&patientid=$_GET[patientid]&appid=$_GET[appid]';</script>";
		}
		else
		{
			echo mysqli_error($con);
		}
	}
}
if(isset($_GET[editid]))
{
	$sql="SELECT * FROM prescription WHERE prescriptionid='$_GET[editid]' ";
	$qsql = mysqli_query($con,$sql);
	$rsedit = mysqli_fetch_array($qsql);
	
}
?>
<div class="container-fluid">
        <div class="block-header">
            <h2>Add New Prescription</h2>
            
        </div>
        <div class="row clearfix">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="card" style="padding: 10px">

     <form method="post" action="" name="frmpres" onSubmit="return validateform()">
     <input type="hidden" name="patientid" value="<?php echo $_GET[patientid]; ?>"  />
     <input type="hidden" name="treatmentid" value="<?php echo $_GET[treatmentid]; ?>"  />
     <input type="hidden" name="appid" value="<?php echo $_GET[appid]; ?>"  />
    <table class="table table-bordered table-striped">
      <tbody>
        <tr>
          <td>Patient</td>
          <td>
            <?php
		  	$sqlpatient= "SELECT * FROM patient WHERE status='Active' AND patientid='$_GET[patientid]'";
			$qsqlpatient = mysqli_query($con,$sqlpatient);
			while($rspatient=mysqli_fetch_array($qsqlpatient))
			{
				echo "$rspatient[patientid]- $rspatient[patientname]";
			}
		  ?></td>
        </tr>
        
  <?php
		if(isset($_SESSION[nurseid]))
		{
		?>
        <tr>
          <td>Nurse</td>
          <td>
    		<?php
				$sqlnurse= "SELECT * FROM nurse INNER JOIN department ON department.departmentid=nurse.departmentid WHERE nurse.status='Active' AND nurse.nurseid='$_SESSION[nurseid]'";
				$qsqlnurse = mysqli_query($con,$sqlnurse);
				while($rsnurse = mysqli_fetch_array($qsqlnurse))
				{
					echo "$rsnurse[nursename] ( $rsnurse[departmentname] )";
				}
				?>
                <input type="hidden" name="select2" value="<?php echo $_SESSION[nurseid]; ?>"  />
          </td>
        <?php
		}
		else
		{
		?>        
        <tr>
          <td width="34%">Nurse</td>
          <td width="66%"><select class="form-control show-tick" name="select2" id="select2">
          <option value="">Select</option>
            <?php
          	$sqlnurse= "SELECT * FROM nurse WHERE status='Active'";
			$qsqlv = mysqli_query($con,$sqlnurse);
			while($rsnurse = mysqli_fetch_array($qsqlnurse))
			{
				if($rsnurse[nurseid] == $rsedit[nurseid])
				{
				echo "<option value='$rsnurse[nurseid]' selected>$rsnurse[nurseid]-$rsnurse[nursename]</option>";
				}
				else
				{
				echo "<option value='$rsnurse[nurseid]'>$rsnurse[nurseid]-$rsnurse[nursename]</option>";				
				}
			}
		  ?>
          </select></td>
        </tr>
        <?php
		}
		?>
        <tr>
          <td>Prescription Date</td>
          <td><input class="form-control" type="date" name="date" id="date" value="<?php echo $rsedit[prescriptiondate]; ?>" /></td>
        </tr>
       
        <tr>
          <td colspan="2" align="center"><input class="btn btn-default" type="submit" name="submit" id="submit" value="Submit" /></td>
        </tr>
      </tbody>
    </table>
    <p>&nbsp;</p>
</div>
 <div class="clear"></div>
  </div>
</div>
<?php
include("adfooter.php");
?>
<script type="application/javascript">
function validateform()
{
	if(document.frmpres.select2.value == "")
	{
		alert("Nurse name should not be empty..");
		document.frmpres.select2.focus();
		return false;
	}
	
	else if(document.frmpres.select3.value == "")
	{
		alert("Patient name should not be empty..");
		document.frmpres.select3.focus();
		return false;
	}
	else if(document.frmpres.date.value == "")
	{
		alert("Prescription date should not be empty..");
		document.frmpres.date.focus();
		return false;
	}
	else if(document.frmpres.select.value == "" )
	{
		alert("Kindly select the status..");
		document.frmpres.select.focus();
		return false;
	}
	else
	{
		return true;
	}
}
</script>