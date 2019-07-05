<?php

include('connection.php');

$action= $_POST['action'];

	if($action == 'session')
	{
		
		 session_start();

		 if (isset($_SESSION['id'])) {
			
			$json_response = array();
			$row_array['session'] = $_SESSION['id'];
			$row_array['session1'] = $_SESSION['username'];
			array_push($json_response,$row_array);
			echo json_encode($json_response);

		 } else {
			
			$json_response = array();
		   	$row_array['session'] = "index";
		   	array_push($json_response,$row_array);
			echo json_encode($json_response);
			
		 }
		
		
	}
	else if($action == 'logout')
	{
		session_start();
		session_destroy();
		echo"";
	}
?>	