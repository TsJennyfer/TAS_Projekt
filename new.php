
<?php
session_start();
if($_SERVER["HTTPS"] != "on")
{
    header("Location: https://" . $_SERVER["HTTP_HOST"] . $_SERVER["REQUEST_URI"]);
    exit();
}
if ((isset($_SESSION['zalogowany']))&&($_SESSION['zalogowany']==true))
{
	header('Location: forum.php');
	exit();
}
?>
<!DOCTYPE HTML>
<html lang = "pl">
<head>
	<meta charset = "utf-8" />
</head>
<body>
	
	

	<form action = "zaloguj.php" method="post">
	Login: <br/> <input type="text" name="login" /> <br/>
	Hasło: <br/> <input type="password" name="haslo" /> <br/> <br/>
	<input type = "submit" value ="Zaloguj"/>
	</form>

	<?php
	if(isset($_SESSION['blad']))
		echo $_SESSION['blad'];
	?>


</body>
</html>