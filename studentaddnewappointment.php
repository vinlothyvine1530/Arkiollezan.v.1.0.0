<?php

include("adheader.php");
include("dbconnection.php");
if(isset($_POST[submit]))
{
	if(isset($_SESSION[patientid]))
	{
		$lastinsid =$_SESSION[patientid];
	}
	else
	{
		$dt = date("Y-m-d");
		$tim = date("H:i:s");
		$sql ="INSERT INTO patient(patientname,admissiondate,admissiontime,address,city,mobileno,loginid,password,gender,dob,status) values('$_POST[patiente]','$dt','$tim','$_POST[textarea]','$_POST[city]','$_POST[mobileno]','$_POST[loginid]','$_POST[password]','$_POST[select6]','$_POST[dob]','Active')";
		if($qsql = mysqli_query($con,$sql))
		{
			/* echo "<script>alert('Patient record inserted successfully.');</script>"; */
		}
		else
		{
			echo mysqli_error($con);
		}
		$lastinsid = mysqli_insert_id($con);
	}
	
	$sqlappointment="SELECT * FROM appointment WHERE appointmentdate='$_POST[appointmentdate]' AND appointmenttime='$_POST[appointmenttime]' AND nurseid='$_POST[doct]' AND status='Approved'";
	$qsqlappointment = mysqli_query($con,$sqlappointment);
	if(mysqli_num_rows($qsqlappointment) >= 1)
	{
		echo "<script>alert('Appointment Already Scheduled for This Time.');</script>";
	}
	else
	{
		$sql ="INSERT INTO appointment(appointmenttype,patientid,appointmentdate,appointmenttime,app_reason,status,departmentid,nurseid) values('ONLINE','$lastinsid','$_POST[appointmentdate]','$_POST[appointmenttime]','$_POST[app_reason]','Pending','$_POST[department]','$_POST[doct]')";
		if($qsql = mysqli_query($con,$sql))
		{
			echo "<script>alert('Appointment Record Inserted Successfully.');</script>";
		}
		else
		{
			echo mysqli_error($con);
		}
	}
}
if(isset($_GET[editid]))
{
	$sql="SELECT * FROM appointment WHERE appointmentid='$_GET[editid]' ";
	$qsql = mysqli_query($con,$sql);
	$rsedit = mysqli_fetch_array($qsql);
	
}
if(isset($_SESSION[patientid]))
{
    $sqlpatient = "SELECT * FROM patient WHERE patientid='$_SESSION[patientid]' ";
    $qsqlpatient = mysqli_query($con,$sqlpatient);
    $rspatient = mysqli_fetch_array($qsqlpatient);
    $readonly = " readonly";
}
?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<div class="wrapper col4">
    <div id="container">

        <?php
        if(isset($_POST[submit]))
        {
           if(mysqli_num_rows($qsqlappointment) >= 1)
           {		
             echo "<h2>Appointment already scheduled for ". date("d-M-Y", strtotime($_POST[appointmentdate])) . " " . date("H:i A", strtotime($_POST[appointmenttime])) . " .. </h2>";
         }
         else
         {
          if(isset($_SESSION[patientid]))
          {
             echo '<section class="p-t-b-150">
             <div class="container">
             <div class="intro-main">
                <div class="row">
                    <div class="col-md-7">
                        <div class="text-sec padding-right-0">
                            <div class="heading-block head-left margin-bottom-50">
                                <h4> Your New Appointment has been sent successfully</h4>
                            </div>
                            <p>Appointment record is in pending process. Kinldy check the appointment status.</p>
                            <p> <a href="viewappointment.php">View Appointment record</a>. </p>
                        </div>
                    </div>
                </div>
            </div></div></section>
                ';		
         }
         else
         {
             echo '<section class="p-t-b-150">
             <div class="container">
             <div class="intro-main">
                <div class="row">
                    <div class="col-md-7">
                        <div class="text-sec padding-right-0">
                            <div class="heading-block head-left margin-bottom-50">
                                <h4>Appointment taken successfully.</h4>
                            </div>
                           <h17>Appointment record is in pending process. Please wait for confirmation message.</h17>
                            <p> <a href="patientlogin.php">Click here to <b>Login</b></a>. </p>
                        </div>
                    </div>
                </div>
            </div></div></section>
                ';
         }
     }
 }
 else
 {
   ?>
        <!-- Content -->
        <div id="content">



            <!-- Make an Appointment -->
            <section class="main-oppoiment ">
                <div class="container-fluid">
                    <div class="row">

                        <!-- Make an Appointment -->
                        <div class="col-lg-7">
                            <div class="appointment">

                                <!-- Heading -->
                                <div class="block-header">
                                    <h4>Make a New Appointment</h4>
                                    <hr>
                                </div>
                                <form method="post" action="" name="frmpatapp" onSubmit="return validateform()"
                                    class="form-group">
                                    <ul class="row">

                                        <li class="col-sm-6">
                                            <label>
                                            <div class="form-group"><label>Patient Name</label> 
                                                <input 
                                                    value="<?php echo $rspatient[patientname];  ?>"
                                                    <?php echo $readonly; ?>>
                                            </label>

                                        </li>

                                        <li class="col-sm-6">
                                            <label>
                                            <div class="form-group"><label>Address</label>    
                                            <input 
                                                    value="<?php echo $rspatient[address];  ?>"
                                                    <?php echo $readonly; ?>>
                                            </label>

                                        </li>

                                        <li class="col-sm-6">
                                            <label>
                                            <div class="form-group"><label>City Name</label>    
                                            <input value="<?php echo $rspatient[city];  ?>"
                                                    <?php echo $readonly; ?>>
                                            </label>

                                        </li>

                                        <li class="col-sm-6">
                                            <label>
                                            <div class="form-group"><label>Mobile Number</label>
                                                <input 
                                                
                                                    value="<?php echo $rspatient[mobileno];  ?>"
                                                    <?php echo $readonly; ?>>
                                            </label>
                                        </li>

                                        <?php
                            if(!isset($_SESSION[patientid]))
                            {        
                                ?>
                                        <li class="col-sm-6">
                                            <label>
                                                <input placeholder="Login ID" type="text" class="form-control"
                                                    name="loginid" id="loginid"
                                                    value="<?php echo $rspatient[loginid];  ?>"
                                                    <?php echo $readonly; ?>><i class="icon-login"></i>
                                            </label>

                                        </li>
                                        <li class="col-sm-6">
                                            <label>

                                                <input placeholder="Password" type="password" class="form-control"
                                                    name="password" id="password"
                                                    value="<?php echo $rspatient[password];  ?>"
                                                    <?php echo $readonly; ?>><i class="icon-lock"></i>
                                            </label>

                                        </li>
                                        <?php
                            }
                            ?>
                                        <li class="col-sm-6">
                                            <label>
                                            <div class="form-group"><label>Sex</label>
                                                      <input 
                                                      value="<?php echo $rspatient[gender];  ?>"
                                                    <?php echo $readonly; ?>>
                                            </label>
                                        </li>
                                        

                                        <li class="col-sm-6">
                                            
                                            <label>
                                            <div class="form-group"><label>Birthdate</label>
                                                <input 
                                                    value="<?php echo $rspatient[dob]; ?>" 
                                                    <?php echo $readonly; ?>>
                                            </label>

                                        </li>
                                        
                                        <li class="col-sm-6">
                                            <label>
                                            <div class="form-group"><label>Date</label>
                                                <input placeholder="Appointment date" type="text" 
                                                    min="<?php echo date("Y-m-d"); ?>" name="appointmentdate"
                                                    onfocus="(this.type='date')" id="appointmentdate"><i
                                                    class="ion-calendar"></i>
                                            </label>

                                        </li>

                                        <li class="col-sm-6">
                                            <label>
                                            <div class="form-group"><label>Time</label>
                                                <input placeholder="Appointment time" type="text"
                                                    onfocus="(this.type='time')" 
                                                    name="appointmenttime" id="appointmenttime"><i
                                                    class="ion-ios-clock"></i>
                                            </label>

                                        </li>

                                        <li class="col-sm-6">
                                            <label>
                                            <div class="form-group"><label>Department</label>
                                                <select name="department" class="selectpicker" id="department"
                                                    >
                                                    <option value="">Select</option>
                                                    <?php
                                $sqldept = "SELECT * FROM department WHERE status='Active'";
                                $qsqldept = mysqli_query($con,$sqldept);
                                while($rsdept = mysqli_fetch_array($qsqldept))
                                {
                                 echo "<option value='$rsdept[departmentid]'>$rsdept[departmentname]</option>";
                             }
                             ?>
                                                </select>
                                                <i class="ion-university"></i>
                                            </label>

                                        </li>
                                        <li class="col-sm-6">
                                            <label>
                                            <div class="form-group"><label>Nurse</label>
                                                <select name="doct" class="selectpicker" id="department"
                                                    >
                                                    <option value="">Select</option>
                                                    <?php
                        $sqldept = "SELECT * FROM nurse WHERE status='Active'";
                        $qsqldept = mysqli_query($con,$sqldept);
                        while($rsdept = mysqli_fetch_array($qsqldept))
                        {
                            echo "<option value='$rsdept[nurseid]'>$rsdept[nursename] ";
                            echo $rsdept[departmentname];
                            echo "</option>";
                        }
                        ?>
                                                </select>
                                                <i class="ion-medkit"></i>

                                            </label>

                                        </li>
                                        <li class="col-sm-12">
                                            <label>
                                            <div class="form-group"><label>Appointment Reason</label>
                                                <textarea  name="app_reason"
                                                    ></textarea>
                                            </label>
                                        </li>
                                        <li class="col-sm-12">
                                            <button type="submit" class="btn" name="submit" id="submit">SUBMIT</button>
                                        </li>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <?php
}
?>

        </div>
    </div>
</div>
</section>
</div>



<?php
include("adfooter.php");
?>
<script type="application/javascript">
var alphaExp = /^[a-zA-Z]+$/; //Variable to validate only alphabets
var alphaspaceExp = /^[a-zA-Z\s]+$/; //Variable to validate only alphabets and space
var numericExpression = /^[0-9]+$/; //Variable to validate only numbers
var alphanumericExp = /^[0-9a-zA-Z]+$/; //Variable to validate numbers and alphabets
var emailExp = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/; //Variable to validate Email ID 

function validateform() {
    if (document.frmpatapp.patiente.value == "") {
        alert("Patient name should not be empty..");
        document.frmpatapp.patiente.focus();
        return false;
    } else if (!document.frmpatapp.patiente.value.match(alphaspaceExp)) {
        alert("Patient name not valid..");
        document.frmpatapp.patiente.focus();
        return false;
    } else if (document.frmpatapp.textarea.value == "") {
        alert("Address should not be empty..");
        document.frmpatapp.textarea.focus();
        return false;
    } else if (document.frmpatapp.city.value == "") {
        alert("City should not be empty..");
        document.frmpatapp.city.focus();
        return false;
    } else if (!document.frmpatapp.city.value.match(alphaspaceExp)) {
        alert("City name not valid..");
        document.frmpatapp.city.focus();
        return false;
    } else if (document.frmpatapp.mobileno.value == "") {
        alert("Mobile number should not be empty..");
        document.frmpatapp.mobileno.focus();
        return false;
    } else if (!document.frmpatapp.mobileno.value.match(numericExpression)) {
        alert("Mobile number not valid..");
        document.frmpatapp.mobileno.focus();
        return false;
    } else if (document.frmpatapp.loginid.value == "") {
        alert("Login ID should not be empty..");
        document.frmpatapp.loginid.focus();
        return false;
    } else if (!document.frmpatapp.loginid.value.match(alphanumericExp)) {
        alert("Login ID not valid..");
        document.frmpatapp.loginid.focus();
        return false;
    } else if (document.frmpatapp.password.value == "") {
        alert("Password should not be empty..");
        document.frmpatapp.password.focus();
        return false;
    } else if (document.frmpatapp.password.value.length < 8) {
        alert("Password length should be more than 8 characters...");
        document.frmpatapp.password.focus();
        return false;
    } else if (document.frmpatapp.select6.value == "") {
        alert("Gender should not be empty..");
        document.frmpatapp.select6.focus();
        return false;
    } else if (document.frmpatapp.dob.value == "") {
        alert("Date Of Birth should not be empty..");
        document.frmpatapp.dob.focus();
        return false;
    } else if (document.frmpatapp.appointmentdate.value == "") {
        alert("Appointment date should not be empty..");
        document.frmpatapp.appointmentdate.focus();
        return false;
    } else if (document.frmpatapp.appointmenttime.value == "") {
        alert("Appointment time should not be empty..");
        document.frmpatapp.appointmenttime.focus();
        return false;
    } else {
        return true;
    }
}

function loadnurse(deptid) {
    if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("divdoc").innerHTML = this.responseText;
        }
    };
    xmlhttp.open("GET", "departmentnurse.php?deptid=" + deptid, true);
    xmlhttp.send();
}
</script>