<?php
session_start();
error_reporting(0);
include("dbconnection.php");
$dt = date("Y-m-d");
$tim = date("H:i:s");
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>CMIS by Arkiollezan</title>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">
<!-- JQuery DataTable Css -->
<link href="assets/plugins/jquery-datatable/dataTables.bootstrap4.min.css" rel="stylesheet">

<!-- Custom Css -->

<!-- Swift Themes. You can choose a theme from css/themes instead of get all themes -->
<link href="assets/css/themes/all-themes.css" rel="stylesheet" />
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
</head>

<body class="theme-blue">
    <!-- Page Loader -->
    <div class="page-loader-wrapper">
        <div class="loader">
            <div class="preloader">
                <div class="spinner-layer pl-cyan">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
            </div>
            <p>Please wait...</p>
        </div>
    </div>
    <!-- #END# Page Loader -->
    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->

    <!-- Morphing Search  -->

    <!-- Top Bar -->

    <link rel="icon" href="images/ctunewlogo.png" type="image/x-icon"> 
<link rel="shortcut icon" href="images/ctunewlogo.png" type="image/x-icon"> 

    <nav class="navbar clearHeader">
        <div class="col-12">
            <div class="navbar-header"> <a href="javascript:void(0);" class="bars"></a> <a class="navbar-brand"
                    href="nurseaccount.php"></a> </div>
            <ul class="nav navbar-nav navbar-right">
                <!-- Notifications -->
                <li>
                    <a data-placement="bottom" title="Exit" href="logout.php"><i
                            class="zmdi zmdi-sign-in"></i></a>
                </li>               

            </ul>
        </div>
    </nav>
    <!-- #Top Bar -->
    <section>
        <!-- Left Sidebar -->
        <aside id="leftsidebar" class="sidebar">
            <?php
                if(isset($_SESSION[adminid]))
                {
            ?>
            <!--Admin Menu -->
            <div class="menu">
                <ul class="list">
                    <li class="header">ADMIN MAIN NAVIGATION</li>
                    <li class="active open"><a href="adminaccount.php"><i
                                class="zmdi zmdi-home"></i><span>Dashboard</span></a></li>


                    <li><a href="javascript:void(0);" class="menu-toggle"><i
                                class="zmdi zmdi-calendar-check"></i><span>Profile</span> </a>
                        <ul class="ml-menu">
                            <li><a href="adminprofile.php">Admin Profile</a></li>
                            <li><a href="adminchangepassword.php">Change Password</a></li>
                            <li><a href="admin.php">Add Admin</a></li>
                            <li><a href="viewadmin.php">View Admin</a></li>
                        </ul>
                    </li>

                   

                    <li><a href="javascript:void(0);" class="menu-toggle"><i
                                class="zmdi zmdi-account-add"></i><span>Nurse</span> </a>
                        <ul class="ml-menu">
                            <li><a href="nurse.php">Add Nurse</a>
                            </li>
                            <li><a href="nurse.php">View Nurse</a></li>
                           
                        </ul>
                    </li>
                    <li><a href="javascript:void(0);" class="menu-toggle"><i
                                class="zmdi zmdi-account-o"></i><span>Patients</span> </a>
                        <ul class="ml-menu">
                            
                            <li><a href="viewpatient.php">View Patient Records</a></li>
                        </ul>
                    </li>


                    <li> <a href="javascript:void(0);" class="menu-toggle"><i
                                class="zmdi zmdi-settings-square"></i><span>Service</span> </a>
                        <ul class="ml-menu">
                             <li><a href="department.php">Add Department</a></li>
                             <li><a href="viewdepartment.php">View Department</a></li>
                             <li><a href="viewtreatment.php">View Vital Record Type</a></li>
                        </ul>
                        
                    </li>

                </ul>
            </div>
            <!-- Admin Menu -->
            <?php }?>


           



            <!-- patient Menu -->
            <?php
            if(isset($_SESSION[patientid]))
            {
            ?>
            <div class="menu">
                <ul class="list">
                    <li class="header">PATIENT MAIN NAVIGATION</li>
                    <li class="active open"><a href="patientaccount.php"><i
                                class="zmdi zmdi-home"></i><span>Dashboard</span></a></li>


                    <li><a href="javascript:void(0);" class="menu-toggle"><i
                                class="zmdi zmdi-calendar-check"></i><span>Profile</span> </a>
                        <ul class="ml-menu">
                            <li><a href="patientprofile.php">View Profile</a></li>
                            <li><a href="patientchangepassword.php">Change Password</a></li>
                        </ul>
                    </li>

                    <li><a href="javascript:void(0);" class="menu-toggle"><i
                                class="zmdi zmdi-calendar-check"></i><span>Appointment</span> </a>
                        <ul class="ml-menu">
                            <li><a href="studentaddnewappointment.php" >Add Appointment</a></li>
                            <li><a href="viewappointment.php" >View Appointments</a></li>
                        </ul>
                    </li>
                    <li><a href="javascript:void(0);" class="menu-toggle"><i
                                class="zmdi zmdi-account-add"></i><span>Prescription</span> </a>
                        <ul class="ml-menu">
                            <li><a  href="patviewprescription.php">View Prescription Records</a>
                            </li>
                        </ul>
                    </li>
                    <li><a href="javascript:void(0);" class="menu-toggle"><i
                                class="zmdi zmdi-account-o"></i><span>Vital Record</span> </a>
                        <ul class="ml-menu">
                            <li><a href="viewtreatmentrecord.php">View Vital Records</a></li>
                    </li>
                </ul>
                </li>


                </ul>
            </div>

            <?php }; ?>
            <!-- patient Menu -->
        </aside>
        <!-- #END# Left Sidebar -->
     
    </section>
     <section class="content home">
