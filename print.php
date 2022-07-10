<?php
    
ob_end_clean();
require('fpdf184/fpdf.php');
$mysqli = new mysqli('localhost', 'root', '', 'cmis') or die (mysqli_error($mysqli));
  
// Instantiate and use the FPDF class 
$pdf = new FPDF();
  
//Add a new page
$pdf->AddPage();
$pdf->Image('images/ctunewlogo.png',5,10,20,24,'PNG');
$pdf->SetFont('Arial','',12);
$pdf->Cell(50,80,'Date:'.date('d-m-Y').'',0,"R");
$pdf->Multicell(80,5,"Republic of the Philippines\nCEBU TECHNOLOGICAL UNIVERSITY\nNaga Extension Campus\nMEDICAL CLINIC",0,"C");


$pdf->Output();
?>