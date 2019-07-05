<?php

include('connection.php');
include('html_dom.php');
include('radatime.php');
include('machtwatch.php');
include('mataharimall.php');
include('lazada.php');
include('rakuten.php');

$action =$_POST['action'];
	
	if ($action=="list_table") {
			global $conn;
			$requestData= $_REQUEST;

			$columns = array( 
				0 =>'scraping_link_id', 
				1 => 'name',
				2 => 'scrape_time',
				3 => 'update_datetime',
				4 => 'next_scraping',
				5 => 'note'
				
			);
			$sql = "select t1.scraping_link_id, t2.name, t1.note, concat(t1.scrape_time,' Hour') as 'scrape_time', t1.update_datetime, t1.update_datetime + interval t1.scrape_time HOUR as 'next_scraping' from scraping_link t1 inner join web_source t2 on t1.web_source_id = t2.web_source_id where t1.is_active=1";
			$query=mysqli_query($conn, $sql);
			$totalData = mysqli_num_rows($query);
			$totalFiltered = $totalData;  

			$sql ="select t1.scraping_link_id, t2.name, t1.note, concat(t1.scrape_time,' Hour') as 'scrape_time', t1.update_datetime, t1.update_datetime + interval t1.scrape_time HOUR as 'next_scraping' from scraping_link t1 inner join web_source t2 on t1.web_source_id = t2.web_source_id where t1.is_active=1";

			if( !empty($requestData['search']['value']) ) {  
				$sql.="  AND ( t1.note  LIKE '%".$requestData['search']['value']."%' ";
				$sql.="  OR  t2.name  LIKE '%".$requestData['search']['value']."%')";    
			}
			$query=mysqli_query($conn, $sql);;

			$totalFiltered = mysqli_num_rows($query); 
			$sql.=" ORDER BY ". $columns[$requestData['order'][0]['column']]."   ".$requestData['order'][0]['dir']."  LIMIT ".$requestData['start']." ,".$requestData['length']."   ";

			$query=mysqli_query($conn, $sql);;

			$data = array();
			while( $row=mysqli_fetch_array($query) ) {  
				$nestedData=array(); 

				$nestedData[] = $row["scraping_link_id"];
				$nestedData[] = $row["name"];
				$nestedData[] = $row["scrape_time"];
				$nestedData[] = $row["update_datetime"];
				$nestedData[] = $row["next_scraping"];
				$nestedData[] = $row["note"];
				
				$nestedData[] = "<button class='btn btn-sm btn-default' onClick='scrapebutton(\"".$row["scraping_link_id"]."\")'>Scrape</button> ";
				
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

	else if($action =="scrapebutton"){

		global $conn;
		$id = $_POST['id'];


		$q2 = $conn->query("select link, web_source_id, set_scrape_time from scraping_link where scraping_link_id = '$id' limit 1");
		$result = $q2;
		$sumcol = $result->fetch_row();
		if($sumcol[2]=='0')
			{
				$sql = "UPDATE scraping_link SET update_datetime=now() WHERE scraping_link_id='$id'";
				$sql2 = "DELETE FROM `product` WHERE scraping_link_id='$id'";

				if ($conn->query($sql2) === TRUE) {

					if ($conn->query($sql) === TRUE) {

					$json_response = array();
					
					
					
						if($sumcol[1]=='1')
						{
							radatime_scrape($sumcol[0],$id);
						}
						else if($sumcol[1]=='2')
						{
							machtwatch_scrape(1,$sumcol[0],$id);
						}
						else if($sumcol[1]=='3')
						{
							mataharimall_scrape(1,$sumcol[0],$id);
						}
						else if($sumcol[1]=='4')
						{
							lazada_scrape(1,$sumcol[0],$id);
						}
						else if($sumcol[1]=='5')
						{
							rakuten_scrape(1,$sumcol[0],$id);
						}

					}else {
						echo "Error: " . $sql . "<br>" . $conn->error;
					}

				}else {
					echo "Error: " . $sql . "<br>" . $conn->error;
				}
			}else{
				echo "Link Is Being Scraped By Other Function";
			}

	}

	else if($action =="scrape"){
		
		global $conn;
		$q = $conn->query("select scraping_link_id,is_scraping ,update_datetime + interval scrape_time HOUR as 'scrape_time' ,update_datetime + interval 1 DAY as 'scrape_time2' from scraping_link where is_active = 1");

		$json_response = array();
		
		while($row = mysqli_fetch_array($q, MYSQL_ASSOC)) {
			
			$row_array['scraping_link_id'] = $row['scraping_link_id'];
			$row_array['is_scraping'] = $row['is_scraping'];
			$row_array['scrape_time'] = $row['scrape_time'];
			$row_array['scrape_time2'] = $row['scrape_time2'];
			array_push($json_response,$row_array);
			
		}
		echo json_encode($json_response);

	}

	function update_set(){
			global $conn;
			$id = $_POST['id'];
			$sql = "UPDATE scraping_link SET set_scrape_time=0 WHERE scraping_link_id='$id'";

			if ($conn->query($sql) === TRUE) {
				
				}else {
					echo "error while set set_scrape_time";
				}
	}

?>