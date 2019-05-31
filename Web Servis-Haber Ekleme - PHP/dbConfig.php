<?php 

	function OpenCon()
 	{
	  	//Veritabani bilgileri
		$servername = "localhost";
		$username = "root";
		$password = "";
		$dbname = "admin paneli";

		$connect = new mysqli($servername, $username, $password, $dbname) or die("Bağlanti Başarısız! %s\n". $conn -> error);	// Baglanti oluşturulur
		mysqli_query($connect,'SET NAMES utf8');

	return $connect;
	}
	
	function CloseCon($connect)
	{
		$connect -> close();
	}

 ?>