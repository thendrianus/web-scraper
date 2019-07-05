<?php
session_start(); 
include('connection.php');
$action =$_POST['action'];

	if ($action=='login') {
		
		$username =mysql_real_escape_string($_POST['username']);
		$password =mysql_real_escape_string($_POST['password']);
		$encrypt_password=md5($password);
		global $conn;
		
		$sql=  "select * from account where username='$username' AND password='$encrypt_password'";
		
		$result =  mysqli_query($conn, $sql);
		$check_result = mysqli_num_rows($result);
		$fetchrow = $result->fetch_row();
		
		
		if($check_result>0){
			
							echo "Welcome, Login Berhasil";
							$_SESSION['id'] = $fetchrow[0];
							$_SESSION['username'] = $fetchrow[1];
			}

			else {
			
			echo "Silahkan cek lagi Username dan Password";

		}
			
	}


?>