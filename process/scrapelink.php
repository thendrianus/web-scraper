<?php

include('connection.php');

$action =$_POST['action'];
	
	if ($action=="list_table") {
			global $conn;
		$requestData= $_REQUEST;

		$columns = array( 
			0 =>'scraping_link_id', 
			1 => 'web',
			2 => 'brand',
			3 => 'category',
			4 => 'link',
			5 => 'scrape_time',
			6 => 'note',
			7 => 'update_datetime'
		);

		$sql = "select t1.scraping_link_id, t2.name as 'web', t3.name as 'brand',t4.name as 'category', t1.link,t1.scrape_time, t1.note, t1.update_datetime from scraping_link t1 inner join web_source t2 on t1.web_source_id = t2.web_source_id inner join brand t3 on t1.brand_id = t3.brand_id inner join category t4 on t4.category_id = t1.category_id where t1.is_active=1 ";
		$query=mysqli_query($conn, $sql);
		$totalData = mysqli_num_rows($query);
		$totalFiltered = $totalData;  

		$sql ="select t1.scraping_link_id, t2.name as 'web', t3.name as 'brand',t4.name as 'category', t1.link,t1.scrape_time, t1.note, t1.update_datetime from scraping_link t1 inner join web_source t2 on t1.web_source_id = t2.web_source_id inner join brand t3 on t1.brand_id = t3.brand_id inner join category t4 on t4.category_id = t1.category_id where t1.is_active=1 ";

		if( !empty($requestData['search']['value']) ) {  
			$sql.="  AND ( t1.link  LIKE '%".$requestData['search']['value']."%' ";
			$sql.="  OR  t1.note  LIKE '%".$requestData['search']['value']."%') ";    
		}
		$query=mysqli_query($conn, $sql);;

		$totalFiltered = mysqli_num_rows($query); 
		$sql.=" ORDER BY ". $columns[$requestData['order'][0]['column']]."   ".$requestData['order'][0]['dir']."  LIMIT ".$requestData['start']." ,".$requestData['length']."   ";

		$query=mysqli_query($conn, $sql);;

		$data = array();
		while( $row=mysqli_fetch_array($query) ) {  
			$nestedData=array(); 

			$nestedData[] = $row["scraping_link_id"];
				$nestedData[] = $row["web"];
				$nestedData[] = $row["brand"];
				$nestedData[] = $row["category"];
				$nestedData[] = $row["link"];
				$nestedData[] = $row["scrape_time"];
				$nestedData[] = $row["note"];
				$nestedData[] = $row["update_datetime"];
			$nestedData[] = "<button class='btn btn-sm btn-default' onClick='editbutton(\"".$row["scraping_link_id"]."\")'>Edit</button> <button class='btn btn-sm btn-default' onClick='deletebutton(\"".$row["scraping_link_id"]."\")'>Delete</button> ";
			
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
		
	else if($action == 'get_web_source')
	{
		global $conn;
		
		$q = $conn->query("SELECT * from web_source where is_active = 1");
	
			$json_response = array();
			
			while($row = mysqli_fetch_array($q, MYSQL_ASSOC)) {
				
				$row_array['web_source_id'] = $row['web_source_id'];
				$row_array['name'] = $row['name'];
				array_push($json_response,$row_array);
				
			}

			echo json_encode($json_response);
		
	}

		
	else if($action == 'brand')
	{
		global $conn;
		
		$q = $conn->query("SELECT * from brand where is_active = 1");
	
			$json_response = array();
			
			while($row = mysqli_fetch_array($q, MYSQL_ASSOC)) {
				
				$row_array['brand_id'] = $row['brand_id'];
				$row_array['name'] = $row['name'];
				array_push($json_response,$row_array);
				
			}

			echo json_encode($json_response);
		
	}

		
	else if($action == 'category')
	{
		global $conn;
		
		$q = $conn->query("SELECT * from category where is_active = 1");
	
			$json_response = array();
			
			while($row = mysqli_fetch_array($q, MYSQL_ASSOC)) {
				
				$row_array['category_id'] = $row['category_id'];
				$row_array['name'] = $row['name'];
				array_push($json_response,$row_array);
				
			}

			echo json_encode($json_response);
		
	}

	else if($action == 'edit_data')
	{
		global $conn;
		$scraping_link_id =$_POST['id'];
		$q = $conn->query("SELECT * from scraping_link where is_active = 1 && scraping_link_id = '$scraping_link_id' limit 1 ");
	
			$json_response = array();
			
			while($row = mysqli_fetch_array($q, MYSQL_ASSOC)) {
				
				$row_array['scraping_link_id'] = $row['scraping_link_id'];
				$row_array['web_source_id'] = $row['web_source_id'];
				$row_array['brand_id'] = $row['brand_id'];
				$row_array['category_id'] = $row['category_id'];
				$row_array['link'] = $row['link'];
				$row_array['scrape_time'] = $row['scrape_time'];
				$row_array['set_scrape_time'] = $row['set_scrape_time'];
				$row_array['note'] = $row['Note'];
				array_push($json_response,$row_array);
				
			}

			echo json_encode($json_response);
		
	}


	else if($action == "add"){
			global $conn;
			$web_source =$_POST['web_source'];
			$brand =$_POST['brand'];
			$category =$_POST['category'];
			$web_source_link =$_POST['web_source_link'];
			$scrapetime =$_POST['scrapetime'];
			$checkedvar=$_POST['checkedvar'];
			$note =$_POST['note'];
	
			$sql = "INSERT INTO scraping_link (`web_source_id`,`brand_id`,`category_id`, `link`, `scrape_time`,`set_scrape_time`, `Note`, `is_active`, `created_datetime`, `update_datetime`)VALUES('$web_source','$brand','$category', '$web_source_link', '$scrapetime',$checkedvar,'$note',1, now(), now())";

			if ($conn->query($sql) === TRUE) {
				
				echo "Data Berhasil Dimasukkan!!!";
				
				}else {
					echo "error";
				}
		}

	else if ($action == "edit") {
		
			$web_source_id =$_POST['web_source_id'];
			$web_source =$_POST['web_source'];
			$brand =$_POST['brand'];
			$category =$_POST['category'];
			$web_source_link =$_POST['web_source_link'];
			$scrapetime =$_POST['scrapetime'];
			$checkedvar=$_POST['checkedvar'];
			$note =$_POST['note'];

			$sql = "UPDATE scraping_link SET `web_source_id`='$web_source',`brand_id`='$brand',`category_id`='$category',`link`='$web_source_link',`scrape_time`='$scrapetime',`set_scrape_time`=$checkedvar,`Note`='$note',`update_datetime`=now() WHERE scraping_link_id='$web_source_id'";

			if ($conn->query($sql) === TRUE) {
				
				echo "Data Berhasil Di Update!!!";
				
				}else {
					echo "Error: " . $sql . "<br>" . $conn->error;
				}
	}
	
	else if ($action == "delete") {
		
			global $conn;
			$id = $_POST['id'];
			
	 $sql = "UPDATE scraping_link SET is_active=0 WHERE scraping_link_id='$id'";
			
			if ($conn->query($sql) === TRUE) {
				
				echo "Data Berhasil Di Delete!!!";
				
				}else {
					echo "Error: " . $sql . "<br>" . $conn->error;
				}
	}
?>