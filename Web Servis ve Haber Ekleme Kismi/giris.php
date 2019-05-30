<?php
   ob_start();
   session_start();
?>

<html lang = "tr">
   
   <head>
      <title>Giriş</title>
      <link href = "css/bootstrap.min.css" rel = "stylesheet">
      
      <style>
         body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #ADABAB;
         }
         
         .form-signin {
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
            color: #017572;
         }
         
         .form-signin .form-signin-heading,
         .form-signin .checkbox {
            margin-bottom: 10px;
         }
         
         .form-signin .checkbox {
            font-weight: normal;
         }
         
         .form-signin .form-control {
            position: relative;
            height: auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
         }
         
         .form-signin .form-control:focus {
            z-index: 2;
         }
         
         .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
            border-color:#017572;
         }
         
         .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
            border-color:#017572;
         }
         
         h2{
            text-align: center;
            color: #017572;
         }
      </style>
      
   </head>
	
   <body>
      
      <h2>Kullanıcı Adı ve Parolanızı Giriniz</h2> 
      <div class = "container form-signin">
         
         <?php
         include 'dbConfig.php'; //Veritabani baglanti islemleri
            $msg = '';
            
            if (isset($_POST['login']) && !empty($_POST['username']) && !empty($_POST['password'])) { // Post isteklerini yakalar
            	$connect = OpenCon();

            	$kullaniciAdi=preg_replace("#[^a-zA-Z0-9]#",'', $_POST['username']);
			   	$parola=preg_replace("#['\"/\\;]#",'', $_POST['password']);

            	$sql_check = mysqli_query($connect, "SELECT * FROM admin WHERE kullaniciAdi= '".$kullaniciAdi."' AND parola= '".$parola."' "); //Girilen degerelere gore veritabaninda karsilastirma yapar

               if (mysqli_num_rows($sql_check)) // Veritabaninda eslesme varsa giris yapilir
                {
                $_SESSION['kullaniciAdi'] = $_POST['username'];
         	    $_SESSION['parola'] = $_POST['password'];
                $msg = 'Giriş Yapıldı';
                header('Refresh: 1; URL = /haber/admin.php'); //Haberlerin eklenecegi bolume yonlendirme yapilir

               }else {
                $msg = 'Yanlış Kullanıcı Adı veya Parola';
               }
            }
         ?>
      </div> <!-- /container -->
      
      <div class = "container">
      
         <form class = "form-signin" role = "form" 
            action = "<?php echo htmlspecialchars($_SERVER['PHP_SELF']); 
            ?>" method = "POST">
            <h4 class = "form-signin-heading"><?php echo $msg; ?></h4>
            <input type = "text" class = "form-control" 
               name = "username" placeholder = "kullanici adi" 
               required autofocus></br>
            <input type = "password" class = "form-control"
               name = "password" placeholder = "parola" required>
            <button class = "btn btn-lg btn-primary btn-block" type = "submit" 
               name = "login">Giriş</button>
         </form>
			
         
      </div> 
      
   </body>
</html>