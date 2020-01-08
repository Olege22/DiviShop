<?php
session_start();


$mass_basket_json = json_encode($_SESSION);
//setcookie('bask', $mass_basket_json, time() - 3600 * 24 * 30 * 12);
echo json_encode($_SESSION);



echo "<pre>";
print_r($_SESSION);
echo "<br>!!!<br>";
print_r($_COOKIE);
echo "</pre>";

?>
        
