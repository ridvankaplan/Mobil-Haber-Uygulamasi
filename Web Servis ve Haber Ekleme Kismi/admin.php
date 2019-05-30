<?php 
	session_start(); // session kullanımı başlattık

	if(!isset($_SESSION['kullaniciAdi']) || !isset($_SESSION['parola'])) { 
		die("Öncelikle giriş yapmanız gereklidi!");
	}

 ?>

<!DOCTYPE html>
<html>
<body background="images/admin.jpg">
<form action="admin.php" method="POST" accept-charset="UTF-8"><table>

		<tr>
			<td>Resim</td>
			<td>:</td>
			<td> <input type="text" name="Resim" style="width: 200px;"/></td>
		</tr>

		<tr>
			<td>Başlık</td>
			<td>:</td>
			<td> <input type="text" name="Baslik" style="width: 200px;"/></td>
		</tr>

		<tr>
			<td>Yayınlanma Tarihi</td>
			<td>:</td>
			<td><input type="date" name="Tarih" min="2018-12-12" max= "2025-12-12" style="width: 200px;"/></td>
		</tr>

		<tr>
			<td>Haber Türü</td>
			<td>:</td>
		<td><select  style="width: 205px;" name="Tur">
		  <option value="Gundem">Gundem</option>
		  <option value="Spor">Spor</option>
		  <option value="Egitim">Egitim</option>
		  <option value="Ekonomi">Ekonomi</option>
		</select></td>

		</tr>
		<tr>
			<td>İçerik</td>
			<td>:</td>
			<td> <textarea name="Icerik" id="" cols="185" rows="20"></textarea> </td>
		</tr>
		<tr>
			<td colspan="3" style="text-align:right;"> <button type="submit" name="gonder"> Gönder</button></td>
		</tr>
		
	</table>

</form></body>
</html>


<?php 

//Backend Kodu

	include 'dbConfig.php';
	$connect = OpenCon();
	
	//Veriler POST isteği ile gönderildiğinde tutuyoruz
	if(isset($_POST['Resim']) && isset($_POST['Baslik']) && isset($_POST['Tarih']) && isset($_POST['Tur']) && isset($_POST['Icerik']))
	{
		//Gelen verileri değişkenlere atiyoruz
		$resim = $_POST['Resim'];
		$baslik = $_POST['Baslik'];
		$tarih = $_POST['Tarih'];
		$tur = $_POST['Tur'];
		$icerik = $_POST['Icerik'];
		
		if(empty($resim) || empty($baslik) || empty($tarih) || empty($tur) || empty($icerik)) { //Verilerin boş olup olmadığı kontrolü
     	 echo 'Lütfen boş bırakmayın';
   		} else {
 		
 		//Regular Expression ile bazı özel karakterler dışındaki tüm karakterleri siler
   		$resim=preg_replace("#[\'\"\;\=\#]#",'', $resim);
		$baslik=preg_replace("#[\'\"\;\=\#]#",'', $baslik);
   		$icerik=preg_replace("#[\'\"\;\=\#]#",'', $icerik);
   		$tur=preg_replace("#[\'\"\;\=\#]#",'', $tur);
   		$tarih=preg_replace("#[\'\"\;\=\#]#",'', $tarih);

 		$sql = "INSERT INTO haber (Resim, Baslik, Icerik, Tur, Tarih) VALUES ('$resim', '$baslik', '$icerik', '$tur', '$tarih')"; //Veritabanına ekliyoruz

		if (mysqli_query($connect, $sql)) {
	  	  echo "Haber Eklendi!";
		} 
		else {
	 	   echo "Haber Eklenemedi!";
		}

	   }
		CloseCon($connect);
	}


?>
