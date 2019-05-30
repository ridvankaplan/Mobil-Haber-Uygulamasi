<?php  

	include 'dbConfig.php';
	$connect = OpenCon();

	// Eger gelen index parametresinin degeri 1 ise json verileri isteniyor
	if(isset($_GET['json']))
	{
		$sql="SELECT * FROM haber"; //Tüm haberlerin dönmesi için gerekli sql kodu
		$result = mysqli_query($connect, $sql);
		$json_array = array();//Json verilerinin barınacağı dizi

		while ( $satir = mysqli_fetch_assoc($result))  { //Her satiri diziye atiyoruz
			$json_array[] = $satir;
		  }

		echo json_encode($json_array,JSON_UNESCAPED_UNICODE); //Verileri Json ile encode ediyoruz
	}

	else if(isset($_GET['view']) && isset($_GET['id']))
	{
		$id = preg_replace("#[^0-9]#", '', $_GET['id']);
		$sql="SELECT * FROM haber WHERE id=".$id;
		$result = mysqli_query($connect, $sql);
		
		while ( $satir = mysqli_fetch_assoc($result))  { 
			$view = $satir['Goruntulenme'];
		  }
		
		$view++;
		$sql = "UPDATE haber SET Goruntulenme=".$view." WHERE id=".$id;
		mysqli_query($connect, $sql);

	}

	else if(isset($_GET['like']) && isset($_GET['id']))
	{
		$id = preg_replace("#[^0-9]#", '', $_GET['id']);
		$sql="SELECT * FROM haber WHERE id=".$id;
		$result = mysqli_query($connect, $sql);
		
		while ( $satir = mysqli_fetch_assoc($result))  { 
			$like = $satir['Begenme'];
		  }
		
		$like++;
		$sql = "UPDATE haber SET Begenme=".$like." WHERE id=".$id;
		mysqli_query($connect, $sql);
		$sql = "UPDATE haber SET ButonKontrol= 1 WHERE id=".$id;
		mysqli_query($connect, $sql);

	}

	else if(isset($_GET['dislike']) && isset($_GET['id']))
	{
		$id = preg_replace("#[^0-9]#", '', $_GET['id']);
		$sql="SELECT * FROM haber WHERE id=".$id; //Tüm haberlerin dönmesi için gerekli sql kodu
		$result = mysqli_query($connect, $sql);
		
		while ( $satir = mysqli_fetch_assoc($result))  { 
			$dislike = $satir['Begenmeme'];
		  }
		
		$dislike++;
		$sql = "UPDATE haber SET Begenmeme=".$dislike." WHERE id=".$id;
		mysqli_query($connect, $sql);
		$sql = "UPDATE haber SET ButonKontrol= 1 WHERE id=".$id;
		mysqli_query($connect, $sql);

	}

	else if(isset($_GET['notification']))
	{	
		$id;
		$sql="SELECT * FROM haber WHERE BildirimKontrol=0"; //Tüm haberlerin dönmesi için gerekli sql kodu
		$result = mysqli_query($connect, $sql);
		
		while ( $satir = mysqli_fetch_assoc($result))  { 
			$id = $satir['id'];
		  }
		
		$sql = "UPDATE haber SET BildirimKontrol=1 WHERE id=".$id;
		echo "{\n\"bildirim\": \"true\"\n}";

		mysqli_query($connect, $sql);
	}


	CloseCon($connect);

?>
