<?php

include('connection.php');

$action =$_POST['action'];
	
	if($action == "add"){
			global $conn;
			$rimage= $_POST['rimage'];
            $rlink= $_POST['rlink'];
            $rproduct= $_POST['rproduct'];
            $rbrand= $_POST['rbrand'];
            $rsource= $_POST['rsource'];
            $rprice= $_POST['rprice'];
            $due_date= $_POST['due_date'];
            $note= $_POST['note'];
	
			$sql = "INSERT INTO rproduct ( rimage, rlink, rproduct, rbrand, rsource, rprice, due_date, note, created_datetime, update_datetime, is_active) VALUES('$rimage', '$rlink', '$rproduct', '$rbrand', '$rsource', '$rprice', '$due_date','$note',  now(), now(), 1)";

			if ($conn->query($sql) === TRUE) {
				
				echo "Data Berhasil Diproses!!!";
				
				}else {
					echo "Error: " . $sql . "<br>" . $conn->error;
				}


		}

	else if($action == "edit"){
			global $conn;
			$id= $_POST['id'];
            $due_date= $_POST['due_date'];
            $note= $_POST['note'];
	
			$sql = "update rproduct set due_date='$due_date', note='$note', update_datetime=now() where rproduct_id = '$id'";

			if ($conn->query($sql) === TRUE) {
				
				echo "Data Berhasil Diproses!!!";
				
				}else {
					echo "Error: " . $sql . "<br>" . $conn->error;
				}


		}

	else if($action == "delete"){
			global $conn;
			$id= $_POST['id'];
	
			$sql = "update rproduct set is_active = 0 where rproduct_id = '$id'";

			if ($conn->query($sql) === TRUE) {
				
				echo "Data berhasil dihapus!!!";
				
				}else {
					echo "Error: " . $sql . "<br>" . $conn->error;
				}


		}
 
		else if ($action=="list_table") {
			global $conn;
		$requestData= $_REQUEST;

		$columns = array( 
			0 =>'rproduct_id', 
			1 => 'rimage',
			2 => 'rproduct',
			3 => 'rbrand',
			4 => 'rsource',
			5 => 'rprice',
			6 => 'due_date',
			7 => 'note',
		);

		$sql = "select * from rproduct where is_active=1";
		$query=mysqli_query($conn, $sql);
		$totalData = mysqli_num_rows($query);
		$totalFiltered = $totalData;  

		$sql ="select * from rproduct where is_active=1 ";

		if( !empty($requestData['search']['value']) ) {  
			$sql.="  AND ( rproduct  LIKE '%".$requestData['search']['value']."%' ";
			$sql.="  OR  rbrand  LIKE '%".$requestData['search']['value']."%') ";    
		}
		$query=mysqli_query($conn, $sql);;

		$totalFiltered = mysqli_num_rows($query); 
		$sql.=" ORDER BY ". $columns[$requestData['order'][0]['column']]."   ".$requestData['order'][0]['dir']."  LIMIT ".$requestData['start']." ,".$requestData['length']."   ";

		$query=mysqli_query($conn, $sql);;

		$data = array();
		while( $row=mysqli_fetch_array($query) ) {  
			$nestedData=array(); 
				$nestedData[] = $row["rproduct_id"];
				$nestedData[] = "<img  src=\"" . $row["rimage"] . "\" style=\"height: 40px;\" >";
				$nestedData[] = $row["rproduct"];
				$nestedData[] = $row["rbrand"];
				$nestedData[] = $row["rsource"];
				$nestedData[] = $row["rprice"];
				$nestedData[] = $row["due_date"];
				$nestedData[] = $row["note"];
			$nestedData[] = "<button class='btn btn-sm btn-default' onClick=\"modal_show('". $row["rproduct_id"]."','".$row["rimage"]."','".$row["rlink"]."','".$row["rproduct"]."','".$row["rbrand"]."','".$row["rsource"]."','".$row["rprice"]."','".$row["due_date"]."','".$row["note"]."')\">Edit</button> <button class='btn btn-sm btn-default' onClick='deletebutton(\"".$row["rproduct_id"]."\")'>Delete</button> ";
			
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
		

?>


