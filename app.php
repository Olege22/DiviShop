<?php
	session_start();

	require_once('../config/config.php');
	require_once('../engine/functions.php');
	require_once('../engine/db.php');
	require_once('../engine/autorize.php');
	require_once('../engine/basket.php');

	include '../engine/ChromePhp.php';

	$isAuth = auth($_POST['login'], $_POST['pass'], $_POST['rememberme']);


//echo "SERVER[] = <br>"; echo "<pre>" . var_dump($_SERVER) . "</pre><br>";
//echo "GET[] = <br>"; echo "<pre>" . var_dump($_GET) . "</pre><br>";

	$url_array = explode("/", $_SERVER['REQUEST_URI']);
//echo "url_array[] = <br>"; echo "<pre>" . var_dump($url_array) . "</pre><br>";
	if ($url_array[1] == "" || $url_array[1] == 'php-7')
	{
		$page_name = "index";
	}
	else
	{
		$page_name = $url_array[1];
	}

//echo "page_name = <br>"; echo "<pre>" . var_dump($page_name) . "</pre><br>";

	$getpage=$_GET['page'];
//echo "getpage = <br>"; echo "<pre>" . var_dump($getpage) . "</pre><br>";

	if ($getpage) $page_name = $getpage;

	$content = prepareVariables($page_name);

// echo "content = <br>"; echo "<pre>" . var_dump($content) . "</pre><br>";
// echo "POST = <br>"; echo "<pre>" . var_dump($_POST) . "</pre><br>";

	if (!$_POST['metod'] == 'ajax') {
//echo "POST = <br>"; echo "<pre>" . var_dump($_POST) . "</pre><br>";
		require '../templates/bases.php';
	}
	else
	{
		ob_start(); //Запускаем буферизауию вывода
		require '../templates/auth.php';
		$str = ob_get_contents(); //Записываем в переменную то, что в буфере
		ob_end_clean(); //Очищаем буфер
//echo "str = <br>"; echo "<pre>" . var_dump($str) . "<pre><br>";
//echo "<script>console.log('str = <br>'" . $str . ")</script>";
//echo ($str);
//echo "зашли в обработку ajax";
		echo json_encode($str);
	}
?>
