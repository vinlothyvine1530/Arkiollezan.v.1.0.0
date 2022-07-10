<?php
include("adheader.php");
include("dbconnection.php");
ini_set('display_errors', FALSE);
if(isset($_GET[delid]))
{
	 $sql ="DELETE FROM prescription_records WHERE prescription_record_id='$_GET[delid]'";
	$qsql=mysqli_query($con,$sql);
	if(mysqli_affected_rows($con) == 1)
	{
			echo "<script>window.location='prescriptionrecord.php?prescriptionid=$_GET[prescriptionid]';</script>";
		echo "<script>alert('prescription deleted successfully..');</script>";
	}
}
if(isset($_POST[submit]))
{
	
	if(isset($_GET[editid]))
	{
			$sql ="UPDATE prescription_records SET prescription_id='$_POST[prescriptionid]',medicine_name='$_POST[medicine]',cost='$_POST[cost]',unit='$_POST[unit]',dosage='$_POST[select2]',status=' $_POST[select]' WHERE prescription_record_id='$_GET[editid]'";
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
		$sql ="INSERT INTO prescription_records(prescription_id,medicine_name,cost,unit,dosage,status) values('$_POST[prescriptionid]','$_POST[medicineid]','$_POST[cost]','$_POST[unit]','$_POST[select2]','Active')";
		if($qsql = mysqli_query($con,$sql))
		{	
			$presamt=$_POST[cost]*$_POST[unit];
			$billtype = "Prescription update";
			$prescriptionid= $_POST[prescriptionid];
			include("insertbillingrecord.php");
			echo "<script>alert('prescription record inserted successfully...');</script>";
			echo "<script>window.location='prescriptionrecord.php?prescriptionid=$_GET[prescriptionid]&patientid=$_GET[patientid]&appid=$_GET[appid]';</script>";
		}
		else
		{
			echo mysqli_error($con);
		}
	}
}
if(isset($_GET[editid]))
{
	$sql="SELECT * FROM prescription_records WHERE prescription_record_id='$_GET[editid]' ";
	$qsql = mysqli_query($con,$sql);
	$rsedit = mysqli_fetch_array($qsql);
	
}
?>


<div class="container-fluid">
	<div class="block-header"><h2>Add New Prescription Record</h2></div>
  <div class="card" style="padding:10px">
 <table class="table table-bordered table-striped">
      <tbody>
        <tr>
          <td><strong>Patient</strong></td>
          <td><strong>Prescription Date</strong></td>
          <td><strong>Status</strong></td>
        </tr>

     <?php
		$sql ="SELECT * FROM prescription WHERE prescriptionid='$_GET[prescriptionid]'";
		$qsql = mysqli_query($con,$sql);
		while($rs = mysqli_fetch_array($qsql))
		{
			$sqlpatient = "SELECT * FROM patient WHERE patientid='$rs[patientid]'";
			$qsqlpatient = mysqli_query($con,$sqlpatient);
			$rspatient = mysqli_fetch_array($qsqlpatient);
			
			
		$sqldoc = "SELECT * FROM nurse WHERE nurseid='$rs[nurseid]'";
			$qsqldoc = mysqli_query($con,$sqldoc);
			$rsnurse = mysqli_fetch_array($qsqldoc);
			
        echo "<tr>
          <td>&nbsp;$rspatient[patientname]</td>
		   <td>&nbsp;$rs[prescriptiondate]</td>
		<td>&nbsp;$rs[status]</td>
		
        </tr>";
		}
		?>
      </tbody>
    </table>
	</div>
	
	<div class="card" style="padding:10px">
  
           <?php
			if(!isset($_SESSION[patientid]))
			{
		  ?>  
<form method="post" action="" name="frmpresrecord" onSubmit="return validateform()"> 
  <input type="hidden" name="prescriptionid" value="<?php echo $_GET[prescriptionid]; ?>"  />
    <table class="table table-striped">
      <tbody>
      
        <tr>
          <td width="34%">Medicine</td>
          <td width="66%">
		  <select class="form-control show-tick" name="medicineid" id="medicineid" onchange="loadmedicine(this.value)">
		  <option value="">Select Medicine</option>
		  <?php
		$sqlmedicine ="SELECT * FROM medicine WHERE status='Active'";
		$qsqlmedicine = mysqli_query($con,$sqlmedicine);
		while($rsmedicine = mysqli_fetch_array($qsqlmedicine))
		{
			echo "<option value='$rsmedicine[medicineid]'>$rsmedicine[medicinename] </option>";
		}
		?>
		  </select>
		  </td>
        </tr>
        <tr>
          <td>Number of Medicine to give</td>
          <td><input class="form-control" type="number" min="1" name="unit" id="unit" value="<?php echo $rsedit[unit]; ?>" onkeyup="calctotalcost(cost.value,this.value)" onchange="" /></td>
        </tr>


        <tr>
          <td>Prescription</td>
          <td><input class="form-control" name="select2" id="select2">
           
          </input></td>
        </tr>
        <tr>
          <td colspan="2" align="center"><input class="btn btn-default" type="submit" name="submit" id="submit" value="Add" /> </td>
        </tr>
      </tbody>
    </table>
    </form>
    <?php
			}
		?>
	</div>
	<div class="block-header"><h2>View Prescription record</h2></div>
    
  	<div class="card" style="padding:10px">
    <table class="table table-hover table-striped">
      <tbody>
        <tr>
          <td><strong>Medicine</strong></td>
          <td><strong>Prescription</strong></td>
          <td><strong>Medicine received</strong></td>
			<?php
			if(!isset($_SESSION[patientid]))
			{ ?>  
          <td><strong>Action</strong></td>
          <?php
			}
			?>
			
         <?php
		$sql ="SELECT * FROM prescription_records LEFT JOIN medicine on prescription_records.medicine_name=medicine.medicineid WHERE prescription_id='$_GET[prescriptionid]'";
		$qsql = mysqli_query($con,$sql);
		while($rs = mysqli_fetch_array($qsql))
		{
        echo "<tr>
          <td>&nbsp;$rs[medicinename]</td>
		  <td>&nbsp;$rs[dosage]</td>
		   <td>&nbsp;$rs[unit]</td>
		   ";
			if(!isset($_SESSION[patientid]))
			{
			 echo " <td>&nbsp; <a href='prescriptionrecord.php?delid=$rs[prescription_record_id]&prescriptionid=$_GET[prescriptionid]'>Delete</a> </td>"; 
			}
		echo "
		</tr>";
		
		}
		?>

		<table>
	<tr>
	 <center><a href="print.php" target="_blank">Print Report</a></center>
	</tr>
	</table>



    <p>&nbsp;</p>
  </div>
</div>
</div>
 <div class="clear"></div>
  </div>
</div>
<?php
include("adfooter.php");
?>
<script type="application/javascript">
function loadmedicine(medicineid)
{
	if (window.XMLHttpRequest) 
	{
		// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {
		// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("totcost").value = this.responseText;
			document.getElementById("unit").value = 1;
		} 
	};
	xmlhttp.open("GET","ajaxmedicine.php?medicineid="+medicineid,true);
	xmlhttp.send();
}

function calctotalcost(cost,qty)
{
	 document.getElementById("totcost").value = parseFloat(cost) * parseFloat(qty);
} 

function validateform()
{
	if(document.frmpresrecord.prescriptionid.value == "")
	{
		alert("Prescription id should not be empty..");
		document.frmpresrecord.prescriptionid.focus();
		return false;
	}
	else if(document.frmpresrecord.medicine.value == "")
	{
		alert("Medicine field should not be empty..");
		document.frmpresrecord.medicine.focus();
		return false;
	}

	else if(document.frmpresrecord.unit.value == "")
	{
		alert("Unit should not be empty..");
		document.frmpresrecord.unit.focus();
		return false;
	}
	else if(document.frmpresrecord.textarea.value == "")
	{
		alert("note_patient should not be empty..");
		document.frmpresrecord.textarea.focus();
		return false;
	}
	else if(document.frmpresrecord.select2.value == "")
	{
		alert("Dosage should not be empty..");
		document.frmpresrecord.select2.focus();
		return false;
	}
	else if(document.frmpresrecord.select.value == "" )
	{
		alert("Kindly select the status..");
		document.frmpresrecord.select.focus();
		return false;
	}
	else
	{
		return true;
	}
	
}
</script>