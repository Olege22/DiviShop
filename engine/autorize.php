<?php

function auth($login = null, $pass = null, $rememberme = false)
{
	$isAuth = 0;
//echo "login="; echo "<pre>" . var_dump($login) . "</pre><br>";
//echo "pass="; echo "<pre>" . var_dump($pass) . "</pre><br>";
	if ($rememberme == "true")
	{
		$rememberme = true;
	}
	else
	{
		$rememberme = false;
	}
	
	if (!empty($login))   //Если попытка авторизации через форму, то пытаемся авторизоваться
	{
		$isAuth = authWithCredential($login, $pass, $rememberme);
	//	echo "Авторизация по форме";
	}
	elseif ($_SESSION['IdUserSession'])    //иначе пытаемся авторизоваться через сессии
	{
		$isAuth = checkAuthWithSession($_SESSION['IdUserSession']);
	//	echo "Авторизация по сессии";
	}
	else // В последнем случае пытаемся авторизоваться через cookie
	{
		$isAuth = checkAuthWithCookie();
	//	echo "авторизация по cookie";
	}
	
	if ($_POST['ExitLogin'])
	{
		$isAuth = UserExit();	
	}

	if ($isAuth)
	{
		$id_user = $_SESSION['IdUserSession'];
		$sql = "SELECT * FROM users WHERE id_user = (SELECT id_user FROM users_auth WHERE hash_cookie = '$id_user')";
		$isAuth = getRowResult($sql, $link);
	}

	return $isAuth;
	
}

/*
Осуществляем удаление всех переменных, отвечающих за авторизацию пользователя.
*/
function UserExit()
{
	//Удаляем запись из БД об авторизации пользователей
	$IdUserSession = $_SESSION['IdUserSession'];
	$sql = "DELETE FROM users_auth WHERE hash_cookie = '$IdUserSession'";
	executeQuery($sql);
	
	//Удаляем все переменные сессий
	unset($_SESSION['id_user']);
	unset($_SESSION['IdUserSession']);
	unset($_SESSION['login']);
	
	//Удаляем все переменные cookie
	setcookie('idUserCookie','', time() - 3600 * 24 * 7);

	return $isAuth = 0;
}

/*Авторизация пользователя
при использования технологии хэширования паролей
$username - имя пользователя
$password - введенный пользователем пароль
*/
function authWithCredential($username, $password, $rememberme = false)
{
	$isAuth = 0;
	
	$link = getConnection();
	$login = mysqli_real_escape_string($link,$username);
	$passHash = password_hash($password, PASSWORD_DEFAULT);
	$sql = "SELECT id_user, login, pass FROM users WHERE login = '$login'";
	$user_date = getRowResult($sql, $link);

//ChromePhp::log('$user_date=' . $user_date['id_user'] . " ". $user_date['login'] . " ". $user_date['pass']);

//ChromePhp::log('$id_user=' . $id_user);

	if ($user_date)
	{
		$passHash = $user_date['pass'];
		$id_user = $user_date['id_user'];
		$idUserCookie = microtime(true) . rand(100,1000000000000);
		$idUserCookieHash = hash("sha256", $idUserCookie);

//ChromePhp::log(password_verify($password, $passHash));
		if (password_verify($password, $passHash))
		{
			
		
			
			$_SESSION['login'] = $username;
			$_SESSION['id_user'] = $id_user;
			$_SESSION['IdUserSession'] = $idUserCookieHash;
			
			/*
			На уроке неправильно был написан SQL запрос! Правильное написание в коде, написание которое было, закоментировано в данном коментарии
			
			$sql = "INSERT INTO users_auth (id_user, hash_cookie, date, prim) VALUES ($id_user, $idUserCookieHash, now(), $idUserCookie)";
			
			*/
			$sql = "INSERT INTO users_auth (id_user, hash_cookie, date, prim) VALUES ('$id_user', '$idUserCookieHash', now(), $idUserCookie)";

			//echo "id_user = " . '$id_user' . "<br>";

			executeQuery($sql);
	
			if ($rememberme == true)
			{
				setcookie('idUserCookie',$idUserCookieHash, time() + 3600 * 24 * 7, '/');
			}
			$isAuth = 1;
		}
		else
		{
			UserExit();
		}
	}
	else
	{
		UserExit();
	}
	
	return $isAuth;	
}

/* Авторизация при помощи сессий
При переходе между страницами происходит автоматическая авторизация
*/
function checkAuthWithSession($IdUserSession)
{

	$isAuth = 0;

	$link = getConnection();
	$hash_cookie = mysqli_real_escape_string($link, $IdUserSession);
	$sql = "SELECT users.login, users_auth.* FROM users_auth INNER JOIN Users on users_auth.id_user = Users.id_user WHERE users_auth.hash_cookie = '$hash_cookie'";
	

	
	$user_date = getRowResult($sql, $link);
	

	if ($user_date)
	{
		$_SESSION['login'] = $user_date['login'];
		$_SESSION['IdUserSession'] = $IdUserSession;
		$isAuth = 1;
	}
	else
	{
		$isAuth = 0;
		UserExit();
	}
	
	return $isAuth;
}

function checkAuthWithCookie()
{
	$isAuth = 0;
	
	$link = getConnection();
	$idUserCookie = $_COOKIE['idUserCookie'];
	$hash_cookie = mysqli_real_escape_string($link, $idUserCookie);
	$sql = "SELECT * FROM users_auth WHERE hash_cookie = '$hash_cookie'";
	$user_date = getRowResult($sql, $link);
	
	if ($user_date)
	{
		checkAuthWithSession($idUserCookie);
		$isAuth = 1;
	}
	else
	{
		$isAuth = 0;
		UserExit();
	}

	return $isAuth;
}



?>