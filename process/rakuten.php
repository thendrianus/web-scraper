<?php

	$success_scrape = 0;
	$failed_scrape = 0;
	$failed_note = "";

	function rakuten_scrape($step, $Url, $Id){

		global $success_scrape;
		global $failed_scrape;
		global $failed_note;

		
		if (!function_exists('curl_init')){
			die('Sorry cURL is not installed!');
		}
		$ch = curl_init();
		
		curl_setopt($ch, CURLOPT_URL, $Url.$step);
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

		$element = $html->find('.b-item');

		for ($x = 0; $x < count($element); $x++) {
			if(($element[$x]->find('img', 0)->getAttribute('data-frz-src'))){
				$img = trim($element[$x]->find('img', 0)->getAttribute('data-frz-src'));
			}else{
				$img = "http://localhost:7777/watches/img/No_image_available.png";
			}
			
			if($element[$x]->find('a', 0)->getAttribute('href')){
				$link= "http://www.rakuten.co.id".trim($element[$x]->find('a', 0)->getAttribute('href'));
			}else{
				$link= "www.rakuten.co.id";
			}

			if($element[$x]->find('img', 0)->getAttribute('alt')){
				$name = trim($element[$x]->find('img', 0)->getAttribute('alt'));
			}else{
				$name = "Rakuten";
			}		

			if($element[$x]->find('.product-price',0)->find('.b-text-prime',0)){
				$pricenew1= "Rp.".trim($element[$x]->find('.product-price',0)->find('.b-text-prime',0)->innertext);
				$pricenew = ereg_replace("[^0-9]", "", $pricenew1);
			}else{
				$pricenew= "Rp. 0";
			}
			
			

			$sql = "INSERT INTO product (`product_id`,`name`, `scraping_link_id`, `link`, `image`, `price`, `old_price`, 
			`discount`, `description`,`is_active`, `created_datetime`, `update_datetime`)VALUES(uuid(),\"".$name."\",'$Id','$link','$img','$pricenew','','','description',1,now(),now())";
			global $conn;
			
			if ($conn->query($sql) === true) {
				$success_scrape = $success_scrape + 1;
			}
			else{
				$failed_scrape =$failed_scrape + 1;
				$failed_note =$failed_note."\n- - - - ".$Id."Scraping data fail inserted into database".$name . $conn->error . " \n";
			}

		}
		$pagetotal =0;

		if($step == 1)
		{
			$producttitle = $html->find('.b-tabs-utility',0)->innertext; 
			
			$producttotal = intval(preg_replace('/[^0-9]+/', '',  substr("$producttitle",-14)), 10);
			$pagetotal = (int)($producttotal/60) + 2;
			
			if($pagetotal > 3)
			{
				pageloop4($pagetotal, $Url,$Id);
			}
			else{

				echo "- - - - Scraping dengan ID ".$Id." Finished ".$failed_note."\n- - - - Success Scraping = ".$success_scrape." And Failed Scraping = ".$failed_scrape."";
				update_set();
			}

		}
		
	}


	function pageloop4($pageloop,$url,$Id){
		global $success_scrape;
		global $failed_scrape;
		global $failed_note;

		for ($x = 2; $x < $pageloop; $x++) {
			rakuten_scrape($x,$url,$Id);
		}
		echo "- - - - Scraping dengan ID ".$Id." Finished".$failed_note."\n- - - - Result Scraping = ".$success_scrape." And Failed Scraping = ".$failed_scrape."";
		update_set();

	}

?>