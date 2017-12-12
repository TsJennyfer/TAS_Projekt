<?php

session_start();
if(isset($_POST['email']))
{
	$uprawnienia = 1;
	$rejestracjapoprawna = true;
	$nick = $_POST['nick'];
	if((strlen($nick)<4) || (strlen($nick)>15))
	{
		$rejestracjapoprawna=false;
		$_SESSION['e_nick'] = "Login musi posiadać od 4 do 15 znaków!";
	}
	
	if(ctype_alnum($nick)==false)
	{
		$rejestracjapoprawna=false;
		$_SESSION['e_nick'] = "Login może składać się tylko z liter i znaków!";
	}
	
	
	$email = $_POST['email'];
	$emailB = filter_var($email, FILTER_SANITIZE_EMAIL);
	if((filter_var($emailB,FILTER_VALIDATE_EMAIL)==false) || ($emailB!=$email))
	{
		$rejestracjapoprawna = false;
		$_SESSION['e_email']="Podaj poprawny e-mail!";
	}
	
	
	$passwd = $_POST['passwd'];
	$passwd2 = $_POST['passwd2'];
	
	if((strlen($passwd)<5) || (strlen($passwd)>20))
	{
		$rejestracjapoprawna=false;
		$_SESSION['e_passwd'] = "Hasło musi posiadać od 5 do 20 znaków!";
	}
	if($passwd != $passwd2)
	{
		$rejestracjapoprawna=false;
		$_SESSION['e_passwd2'] = "Podane hasło jest nieprawidłowe";
	}
	
	$haslo_hash = password_hash($passwd, PASSWORD_DEFAULT);
	
	$_SESSION['remember_nick'] = $nick;
	$_SESSION['remember_passwd'] = $passwd;
	$_SESSION['remember_passwd2'] = $passwd2;
	$_SESSION['remember_email'] = $email;
	
	require_once "connect.php";
	mysqli_report(MYSQLI_REPORT_STRICT);
	try
	{
		$polaczenie = new mysqli($host,$db_user,$db_password,$db_name);
		if($polaczenie->connect_errno!=0)
		{
			throw new Exception(mysqli_connect_errno());
		}
		else
		{
			$polaczono = $polaczenie -> query("SELECT ID FROM uzytkownicy WHERE mail='$email'");
			if(!$polaczono) throw new Exception($polaczenie->error);
			$email_istnieje = $polaczono -> num_rows;
			if($email_istnieje>0)
			{
				$rejestracjapoprawna=false;
				$_SESSION['e_email'] = "Podany email już istnieje!";
			}
			$polaczono = $polaczenie -> query("SELECT ID FROM uzytkownicy WHERE nazwa='$nick'");
			if(!$polaczono) throw new Exception($polaczenie->error);
			$nick_istnieje = $polaczono -> num_rows;
			if($nick_istnieje>0)
			{
				$rejestracjapoprawna=false;
				$_SESSION['e_nick'] = "Podany login już istnieje!";
			}
			if($rejestracjapoprawna == true)
			{
				if($polaczenie->query("INSERT INTO uzytkownicy VALUES (NULL, '$nick', '$email', '$uprawnienia', '$haslo_hash')" ))
				{
					$_SESSION['udana'] =true;
					echo "Rejestracja przebiegła pomyślnie!";
				}
				else{
					throw new Exception($polaczenie->error);
				}
			}
			
			$polaczenie -> close();
		}
	}
	catch(Exception $e)
	{
		echo 'Błąd serwera';
		echo '<br/> Info: '.$e;
	}
	
}
	

?>
<!DOCTYPE HTML>
<html lang = "pl">
<head>
	<meta charset = "utf-8" />
	 <title>LOGIN</title>
			<link rel="stylesheet" href="style.css">
            <script src="http://code.jquery.com/jquery-latest.js"></script>
            <meta name="viewport" content="width=device-width, initial-scale=1">
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
	.error{
		color:red;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	</style>
</head>
<body>
       <script src="myapp.js"></script>
        <div class="bg">
                <div class="container" style="background-color:#E0E0E0"> 
                        <table width="100%">
                                <tr>
                                <td>
                                    <button class="bMainPage" onclick="location='main.html'"> BOOKshelf </font><br><br>

                                </td>
                                <td >
                                        <p align="right">
                                                <font color="red"> 
                                                        +48 85 674 36 19 (pon-pt: 8:00-18:00)  
                                                        <br>      
                                                        sklep@bookshelf.pl   
                                                        <br>
                                                        <a href="url">KONTAKT</a>
                                                </font>
                                        </p>
                                </td>
                            </tr>
                             <tr> 
                                <td>                           
                                        <p class="p1" > Twoja księgarnia internetowa </p>
                                </td>
                            </tr>
                        </table>
                </div>
                
                <div class="container" style="background-color:#f1f1f1">
	        <center>
	                <form method="post" >
	                Login: <br /> <input type="text" value="<?php 
	                if(isset($_SESSION['remember_nick'])){ echo $_SESSION['remember_nick']; unset($_SESSION['remember_nick']);}?>" 
	                name="nick" /> <br />
	                <?php 
	                if(isset($_SESSION['e_nick']))
	                {
		                echo '<div class = "error">'.$_SESSION['e_nick'].'</div>';
		                unset($_SESSION['e_nick']);
	                }
	                ?>
	                E-mail: <br /> <input type="text" value="<?php 
	                if(isset($_SESSION['remember_email'])){ echo $_SESSION['remember_email']; unset($_SESSION['remember_email']);}?>" name="email" /> <br />
	                <?php 
	                if(isset($_SESSION['e_email']))
	                {
		                echo '<div class = "error">'.$_SESSION['e_email'].'</div>';
		                unset($_SESSION['e_email']);
	                }
	                ?>
	                Hasło: <br /> <input type="password" value="<?php 
	                if(isset($_SESSION['remember_passwd'])){ echo $_SESSION['remember_passwd']; unset($_SESSION['remember_passwd']);}?>" name="passwd" /> <br />
	                <?php 
	                if(isset($_SESSION['e_passwd']))
	                {
		                echo '<div class = "error">'.$_SESSION['e_passwd'].'</div>';
		                unset($_SESSION['e_passwd']);
	                }
	                ?>
	                Powtórz hasło: <br /> <input type="password" value="<?php 
	                if(isset($_SESSION['remember_passwd2'])){ echo $_SESSION['remember_passwd2']; unset($_SESSION['remember_passwd2']);}?>" name="passwd2" /> <br />
	                <?php 
	                if(isset($_SESSION['e_passwd2']))
	                {
		                echo '<div class = "error">'.$_SESSION['e_passwd2'].'</div>';
		                unset($_SESSION['e_passwd2']);
	                }
	                ?></br>
	                <input type="submit" value="Zarejestruj" />
	                </form>
	        </center>
        </div>
        <div class="container" style="background-color:#E0E0E0"> </div>
        </div>
</body>
</html>
