<?php if (!$isAuth): ?>
	<form action="/" method="post">
		<label for="login">Логин</label><input type="text" id="login" name="login"value="user"><br>
		<label for="pass">Пароль</label><input type="password" id="pass" name="pass" value="123"><br>
		<label for="rememberme">Запомнить: </label><input type="checkbox" name="rememberme" id="rememberme" />
		<input type="button" name="Submit" value="Войти" onclick="register()" /><a href="index.php?page=getregdata">Зарегистрироваться</a>
	</form>

<?php endif; ?>


<br>

<?php if ($isAuth): ?>
<form action="" method="post">
<p>Вы авторизованы под логином <?=$_SESSION['login'] ?></p>
<input type="submit" name="ExitLogin" value="Выйти" />
</form>

<?php endif; ?>
