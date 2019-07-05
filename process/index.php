<?php

include('connection.php');

$action= $_POST['action'];

	if($action == 'top_watches')
	{
		global $conn;
		
		$q = $conn->query("SELECT * FROM `rproduct` WHERE `due_date` >= now() && is_active =1");
	
			$json_response = array();
			
			while($row = mysqli_fetch_array($q, MYSQL_ASSOC)) {
				
				$row_array['product_id'] = $row['rproduct_id'];
				$row_array['product'] = $row['rproduct'];
				$row_array['source'] = $row['rsource'];
				$row_array['brand'] = $row['rbrand'];
				$row_array['link'] = $row['rlink'];
				$row_array['image'] = $row['rimage'];
				$row_array['price'] = $row['rprice'];
				array_push($json_response,$row_array);
				
			}

			echo json_encode($json_response);
		
		
	}

	else if($action == 'search_watches')
	{
		global $conn;
		$category= $_POST['category'];
		$brand= $_POST['brand'];
		$search= $_POST['search'];
		$search_price= $_POST['search_price'];
		$checked = $_POST['checked2'];
		$query="";
		$searched = "";
		if ($search == "") {
			$searched = "";
		}else{

			$searched = "&& concat(t1.name,' ', t1.link) like '%".$search."%'";
		}

		if ($search_price =='2') {
			$search_price ="ORDER BY t1.price DESC ";
		}
		else{
			$search_price ="ORDER BY t1.price ASC";
		}

		if ($category == '3') {
			$query ="SELECT t1.product_id as 'product_id', left(t1.name,25) as 'product', t5.name as 'source', t3.name as 'brand', t4.name as 'category', t1.link, t1.image, t1.price from product t1 inner join scraping_link t2 on t1.scraping_link_id = t2.scraping_link_id inner join brand t3 on t2.brand_id = t3.brand_id inner join category t4 on t2.category_id = t4.category_id  inner join web_source t5 on t2.web_source_id = t5.web_source_id WHERE t1.is_active = 1 && t2.brand_id = ".$brand." ".$searched." ".$checked."  ".$search_price." limit 1000";
		}
		else{

			$query ="SELECT t1.product_id as 'product_id', left(t1.name,25) as 'product', t5.name as 'source', t3.name as 'brand', t4.name as 'category', t1.link, t1.image, t1.price from product t1 inner join scraping_link t2 on t1.scraping_link_id = t2.scraping_link_id inner join brand t3 on t2.brand_id = t3.brand_id inner join category t4 on t2.category_id = t4.category_id  inner join web_source t5 on t2.web_source_id = t5.web_source_id WHERE t1.is_active = 1  && t2.category_id=".$category." && t2.brand_id =".$brand." ".$searched." ".$checked."  ".$search_price." limit 1000";
		}
		$q = $conn->query($query);

			$json_response = array();
			// echo "".$query."";
			while($row = mysqli_fetch_array($q, MYSQL_ASSOC)) {
				
				$row_array['product_id'] = $row['product_id'];
				$row_array['product'] = $row['product'];
				$row_array['source'] = $row['source'];
				$row_array['brand'] = $row['brand'];
				$row_array['category'] = $row['category'];
				// $row_array['link'] = "".$query."";
				$row_array['link'] = $row['link'];
				$row_array['image'] = $row['image'];
				$row_array['price'] ="Rp ".number_format($row['price'], 0, '.', '.');
				array_push($json_response,$row_array);
				
			}

			echo json_encode($json_response);
		
		
	}

	else if($action == 'logout')
	{

	}

	else if($action == 'get_brand')
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
?>	