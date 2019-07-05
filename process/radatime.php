<?php
	
	$success_scrape = 0;
	$failed_scrape = 0;
	$failed_note = "";
	
	function radatime_scrape($Url,$Id){

		global $success_scrape;
		global $failed_scrape;
		global $failed_note;

		if (!function_exists('curl_init')){
			die('Sorry cURL is not installed!');
		}
		$ch = curl_init();
		
		curl_setopt($ch, CURLOPT_URL, $Url);
		curl_setopt($ch, CURLOPT_USERAGENT, "MozillaXYZ/1.0");
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_TIMEOUT, 400);
		$output = curl_exec($ch);
		if ( $output  === false)
		{
			print_r('Curl error: ' . curl_error($ch));
		}
		curl_close($ch);
			
		$html = new simple_html_dom();
		$html->load($output);  
		
		$element = $html->find('.product'); 
		//echo $element[0]->innertext;

		for ($x = 0; $x < count($element); $x++) {

			$img = trim($element[$x]->find('img', 0)->getAttribute('data-src'));
			$link= trim($element[$x]->find('a', 1)->getAttribute('href'));
			$name = preg_replace(array('/\s{2,}/', '/[\t\n]/'), ' ', strip_tags($element[$x]->find('a', 1)->innertext));
			$priceold= trim(strip_tags($element[$x]->find('.price-old',0)->innertext));
			$priceoff = trim(strip_tags($element[$x]->find('.price-off',0)->innertext));
			$pricenew1 = trim(strip_tags($element[$x]->find('.price-new',0)->innertext));
			$pricenew = ereg_replace("[^0-9]", "", $pricenew1);
		
			$sql = "INSERT INTO product (`product_id`,`name`, `scraping_link_id`, `link`, `image`, `price`, `old_price`, 
			`discount`, `description`,`is_active`, `created_datetime`, `update_datetime`)VALUES(uuid(),\"".$name."\",'$Id','$link','$img','$pricenew','$priceold','$priceoff','description',1,now(),now())";
			global $conn;
			if ($conn->query($sql) === true) {
				$success_scrape = $success_scrape + 1;
			}
			else{
				$failed_scrape =$failed_scrape + 1;
				$failed_note =$failed_note."\n- - - - ".$Id."Scraping data fail inserted into database".$name . $conn->error . " \n";
			}
		} 
				echo "- - - - Scraping dengan ID ".$Id." Finished ".$failed_note."\n- - - - Success Scraping = ".$success_scrape." And Failed Scraping = ".$failed_scrape."";
				update_set();
	}

?>