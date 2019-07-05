<?php
    
    echo "Welcome To Watch Scraping System";
    scrape();

    function scrape(){

    $ch = curl_init();                
    $url = "localhost:7777/watches/process/scraping.php"; 
    curl_setopt($ch, CURLOPT_URL,$url);
    curl_setopt($ch, CURLOPT_POST, true); 
    curl_setopt($ch, CURLOPT_POSTFIELDS, "action=scrape"); 
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $output = curl_exec ($ch); 

    curl_close ($ch); 

    $jsondata = json_decode($output);
    $dt = new DateTime();
    $now = $dt->format('Y-m-d H:i:s');
    
    for ($i=0; $i < count($jsondata); $i++) { 
        if(($jsondata[$i]->is_scraping)==0)
        {
            $dt_db =new DateTime($jsondata[$i]->scrape_time);
            $timer = $dt_db->format('Y-m-d H:i:s');
        }
        else{
            $dt_db =new DateTime($jsondata[$i]->scrape_time2);
            $timer = $dt_db->format('Y-m-d 00:00:00');
        }
        
       
        if($now >= $timer) {

            echo"\nScraping dengan ID ".$jsondata[$i]->scraping_link_id." sedang di proses .....\n";
       
            $ch1 = curl_init();                   
            $url1 = "localhost:7777/watches/process/scraping.php"; 
            curl_setopt($ch1, CURLOPT_URL,$url1);
            curl_setopt($ch1, CURLOPT_POST, true);  
            curl_setopt($ch1, CURLOPT_POSTFIELDS, "action=scrapebutton&id=".$jsondata[$i]->scraping_link_id); 
            curl_setopt($ch1, CURLOPT_RETURNTRANSFER, true); 
            $output1 = curl_exec ($ch1); 

            curl_close ($ch1); 

            echo $output1."\n";
        }
    }    

        sleep(20); // wait 20 seconds
        scrape(); 
    }

?>