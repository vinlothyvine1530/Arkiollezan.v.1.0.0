<?php
include("adheaderprint.php");
include("dbconnection.php");
ini_set('display_errors', FALSE);
if(isset($_GET[delid]))
{
	 $sql ="DELETE FROM prescription_records WHERE prescription_record_id='$_GET[delid]'";
	$qsql=mysqli_query($con,$sql);
	if(mysqli_affected_rows($con) == 1)
	{
			echo "<script>window.location='prescriptionrecordprint.php?prescriptionid=$_GET[prescriptionid]';</script>";
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
			echo "<script>window.location='prescriptionrecordprint.php?prescriptionid=$_GET[prescriptionid]&patientid=$_GET[patientid]&appid=$_GET[appid]';</script>";
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


    
	<div class="block-header" align="center">


    <div class="container">
		<div class="logo"> <img src="images/ctunewlogo.png" alt="" style="height: 67px;margin-left: 14px;"> 
		 <img src="images/IMPACTRANKINGS.jpg" alt="" style="height: 23px;margin-left: 16px;"> 
		 <img src="images/WORLDUNIVERSITYRANKINGS.jpg" alt="" style="height: 68px;margin-left: 14px;"></div>
        </div>


    <h4>PRESCRIPTION OF PATIENT</h4>
		<h5><b>Republic of the Philippines</b></h5>
		<h5><b>CEBU TECHNOLOGICAL UNIVERSITY</b></h5>
        <h5>NAGA CAMPUS</h5>
        <h17>Central Poblacion, Naga City, Cebu, Philippines<br>
Website: http://www.ctu.edu.ph <br> E-mail: thepresident@ctu.edu.ph</h17>
		<br>
        <br>
		<h7><b>OFFICE OF THE CAMPUS NURSE</b></h7>	
	</div>

	<br>

    <div class="block-header">
		<br>
		<h8>Clinical Management Inventory System</h8>
		<br>
		<h9>Presciption Record</h9>
		<br>
	</div>
  

<div class="container">

<table class="table table-bordered table-striped table-hover js-basic-example dataTable">
      <tbody>
        <tr>
        <td><b>Patient</b></td>
          <td><b>Prescription Date</b></td>
          <td><b>Status</b></td>
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
	


        
	
    
  
    <div class="container">

<table class="table table-bordered table-striped table-hover js-basic-example dataTable">
      <tbody>
        <tr>
        <td><b>Medicine</b></td>
        <td><b>Presciption</b></td>
        <td><b>Medicine Received</b></td>
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
			 echo " <td>&nbsp; <a href='prescriptionrecordprint.php?delid=$rs[prescription_record_id]&prescriptionid=$_GET[prescriptionid]'>Delete</a> </td>"; 
			}
		echo "
		</tr>";
		
		}
		?>

        <table>
        <section>
        <input type="submit" class="btn btn-lg" name="print" id="print" value="" onclick="myFunction()"/>

        <div class="block-header">
		<br>
		<h8>Prescribed By:</h8>                  <h8 style="margin-left: 197px;">Prepared By:</h8>
		<br>
        <br>
		<h9 style="margin-left: 50px;">John Doe John Doe, John</h9> <h9 style="margin-left: 121px;">Marc Anthony A. Pabico, RN</h9>
		<br>
        <h9 style="margin-left: 115px;">Physician</h9> <h9 style="margin-left: 240px;">Nurse</h9>
	
		

	</div>
	</section>
    </table>
	
	<?php
    
    ?>        <p>&nbsp;</p>
  </div>
</div>
</div>
<div class="clear"></div>
</div>
</div>
    </div>

<br>
<br>
<br>
<br>
<br>



	
    
<?php
include("adfooter.php");
?>
<script>
  function myFunction()
  {
   window.print();
 }
</script>


<!--
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
-->