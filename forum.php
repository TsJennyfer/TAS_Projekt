<?php
session_start();
?>
<!DOCTYPE HTML>
<html lang = "pl">
<head>
	<meta charset = "utf-8" />
</head>
<body>

<?php



if($_SESSION['uprawnienia'] == 0)
{
	
	header('Location: paneladminstratoraindex.html');
	
}
else 
{
	/*echo "<p>Twoja nazwa: ".$_SESSION['nazwa'];
	echo "<p> Uprawnienia: Użytkownik";
	echo "<p>".'[<a href="logout.php">Wyloguj się!</a> ]';
	echo '<br>';
	$komunikat = fread(fopen("plik.txt", "r"), filesize("plik.txt"));
	//echo "<script type='text/javascript'>alert('$komunikat');</script>";
	echo  '<span style="color:red">'.$komunikat.'</span>';
	*/
	header('Location: main.php');
	
}
 
	
?>




</body>
</html>