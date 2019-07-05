<?php

include('connection.php');

$action =$_POST['action'];
	
	if ($action=="list_table") {
			global $conn;
		$requestData= $_REQUEST;

		$columns = array( 
			0 =>'account_id', 
			1 => 'username'
		);

		$sql = "select account_id, username from account where is_active=1";
		$query=mysqli_query($conn, $sql);
		$totalData = mysqli_num_rows($query);
		$totalFiltered = $totalData;  

		$sql ="select account_id, username from account where is_active=1";

		if( !empty($requestData['search']['value']) ) {  
			$sql.="  AND ( account_id  LIKE '%".$requestData['search']['value']."%' ";
			$sql.="  OR  username  LIKE '%".$requestData['search']['value']."%')";    
		}
		$query=mysqli_query($conn, $sql);;

		$totalFiltered = mysqli_num_rows($query); 
		$sql.=" ORDER BY ". $columns[$requestData['order'][0]['column']]."   ".$requestData['order'][0]['dir']."  LIMIT ".$requestData['start']." ,".$requestData['length']."   ";

		$query=mysqli_query($conn, $sql);;

		$data = array();
		while( $row=mysqli_fetch_array($query) ) {  
			$nestedData=array(); 

			$nestedData[] = $row["account_id"];
			$nestedData[] = $row["username"];
			$nestedData[] = "<button class='btn btn-sm btn-default' onClick='editbutton(\"".$row["account_id"]."-".$row["username"]."\")'>Edit</button> <button class='btn btn-sm btn-default' onClick='deletebutton(\"".$row["account_id"]."\")'>Delete</button> ";
			
			$data[] = $nestedData;
		}

		$json_data = array(
					"draw"            => intval( $requestData['draw'] ),
					"recordsTotal"    => intval( $totalData ),  
					"recordsFiltered" => intval( $totalFiltered ), 
					"data"            => $data   
					);

		echo json_encode($json_data); 

		}
		


	else if($action == "add"){
			global $conn;
			$username =mysql_real_escape_string($_POST['username']);
			$password =mysql_real_escape_string($_POST['password']);
			$encrypt_password=md5($password);

	
			$sql = "INSERT INTO account ( username, password, created_datetime, update_datetime, is_active)VALUES('$username', '$encrypt_password', now(), now(), 1)";

			if ($conn->query($sql) === TRUE) {
				
				echo "Data Berhasil Dimasukkan!!!";
				
				}else {
					echo "error";
				}
		}

	else if ($action == "edit") {
		
			$id = $_POST['id'];
			$username =mysql_real_escape_string($_POST['username']);
			$password =mysql_real_escape_string($_POST['password']);
			$encrypt_password=md5($password);

			$sql = "UPDATE account SET username='$username', password='$encrypt_password', update_datetime = now() WHERE account_id='$id'";

			if ($conn->query($sql) === TRUE) {
				
				echo "Data Berhasil Di Update!!!";
				
				}else {
					echo "Error: " . $sql . "<br>" . $conn->error;
				}
	}
	
	else if ($action == "delete") {
		
			global $conn;
			$id = $_POST['id'];
			
	 $sql = "UPDATE account SET is_active=0 WHERE account_id='$id'";
			
			if ($conn->query($sql) === TRUE) {
				
				echo "Data Berhasil Di Delete!!!";
				
				}else {
					echo "Error: " . $sql . "<br>" . $conn->error;
				}
	}
?>