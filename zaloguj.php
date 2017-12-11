

<?php

session_start();

if((!isset($_POST['login'])) || (!isset($_POST['haslo'])))
{
	header('Location: new.php');
	exit();
}

require_once "connect.php";

$polaczenie = @new mysqli($host,$db_user,$db_password,$db_name);

if($polaczenie -> connect_errno!=0)
{
	echo "ERROR:".$polaczenie->connect_errno ;
}
else{
	
$login = $_POST['login'];
$haslo = $_POST['haslo'];

$login = htmlentities($login, ENT_QUOTES, "UTF-8");



if($polaczono = @$polaczenie -> query(sprintf("SELECT * FROM uzytkownicy WHERE nazwa='%s'",
mysqli_real_escape_string($polaczenie,$login))))
{
  $ilu = $polaczono -> num_rows;
	if($ilu >0)
	{
		$wiersz = $polaczono->fetch_assoc();
		
		if(password_verify($haslo,$wiersz['haslo'])) 
		{
		$_SESSION['zalogowany']=true;
		
		
		$_SESSION['nazwa'] = $wiersz['nazwa'];
		$_SESSION['uprawnienia'] = $wiersz['uprawnienia'];
		
		unset($_SESSION['blad']);
		$polaczono->free_result();
		 header('Location: forum.php');
		}
		else
		{
			$_SESSION['blad']='<span style="color:red">Nieprawidłowa nazwa użytkownika lub hasło!</span>';
		header('Location: new.php');
		}
	}
	else
	{
		$_SESSION['blad']='<span style="color:red">Nieprawidłowa nazwa użytkownika lub hasło!</span>';
		header('Location: new.php');
		
	}
}

$polaczenie->close();
}


?>
