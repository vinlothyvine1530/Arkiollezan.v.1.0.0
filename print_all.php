<?php
require('fpdf/fpdf.php');

$mysqli = new mysqli('localhost', 'root', '', 'cmis') or die (mysqli_error($mysqli));

$pdf = new FPDF();
///var_dump(get_class_methods($pdf));

$pdf->AddPage();
$pdf->Image('pictures/logo.jpg',5,8,40,24,'JPG');
$pdf->Image('pictures/asean.jpg',165,8,30,25,'JPG');
$pdf->SetFont('Arial','',12);
$pdf->Cell(50,80,'Date:'.date('d-m-Y').'',0,"R");
$pdf->Multicell(80,5,"Republic of the Philippines\nCEBU TECHNOLOGICAL UNIVERSITY\nNaga Extension Campus\nMEDICAL CLINIC",0,"C");
$pdf->Ln(25);
$pdf->SetFont('Arial','B',10);
$pdf->Cell(190,10,'Medicines Inventory',1,1,"C");
$pdf->SetFont('Arial','B',10);
$pdf->Cell(10,8,'No.',1);

$pdf->Cell(30,8,'patientname',1);
$pdf->Cell(20,8,'Dispense',1);

function headerTable()
	$this->SetFont('Times','B',12);
	$this->Cell(30,8,'Patient name',1,0,'C');
	$this->Ln();


function viewTable($db)
$pdf->SetFont('Times','',12);
	$stmt = $db->query('SELECT * FROM `patient` ORDER BY `patient`.`patientname` ASC');
	while($data = $stmt->fetch(PDO::FETCH_OB))
		$pdf->Cell(20,10,$data->patientname,1,0,'C');
		$pdf->Ln();
    



$pdf->headerTable();
$pdf->viewTable($db);
$pdf->Output();
