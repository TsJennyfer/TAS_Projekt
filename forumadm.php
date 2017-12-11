<?php
session_start();

if(($_SESSION['zalogowany']=true) && ($_SESSION['uprawnienia'] != 0))
{
	header('Location: forum.php');
}
?>
<!DOCTYPE HTML>
<html lang = "pl">
<head>
	<meta charset = "utf-8" />
</head>
<body>
<?php
echo "<p>Twoja nazwa: ".$_SESSION['nazwa'];
?>
<p> Uprawnienia: Administrator</p>
<p> [<a href="logout.php">Wyloguj się!</a> ]
<p> Ostrzeżenie: <br>
<form method="post" action="forumadm.php">
 <textarea name="komunikat" rows="5" cols="30">
 </textarea> <br>
 <input type="submit" name="dodaj" value="Dodaj"/>
</form>
 <?php
	$komunikat="";
	if(isset($_POST['dodaj'])) {
		$komunikat = $_POST['komunikat'];
	echo '<br><br>'.$komunikat;
	$fp = fopen("plik.txt", "w");
	fputs($fp, $komunikat);
	fclose($fp);
	}
	
	



?>


</body>
</html>