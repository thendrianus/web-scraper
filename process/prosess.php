<?php
$action =$_POST['action'];

include('html_dom.php');

include('radatime.php');

if ($action=='starter') {
	
	$item = radatime_item("http://www.radatime.co.id/jam-tangan-pria/koleksi-terbaru-jam-tangan-pria?stock=1&limit=100");
	echo json_encode($item);
	
	}
?>